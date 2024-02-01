import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncover/logic/providers/account_provider.dart';
import 'package:uncover/logic/providers/stranger_provider.dart';
import 'package:uncover/logic/services/shared_prefs_service.dart';
import 'package:uncover/ui/components/stranger_tile.dart';
import 'package:uncover/ui/components/side_drawer.dart';
import 'package:location/location.dart';
import 'package:uncover/ui/decorations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final SharedPrefs sharedPrefs = SharedPrefs();

  Location? location = Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<StrangerProvider>(context, listen: false).getStrangersFromServer(
          Provider.of<AccountProvider>(context, listen: false).account);

      requestNotificationPermission();
      requestLocationPermission();

      if (kDebugMode) {
        print(await SharedPrefs().getFirebaseToken());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: mainBackgroundDecoration,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: const Icon(Icons.menu_sharp),
          backgroundColor: Colors.black.withAlpha(50),
          title: const Center(
            child: Text(
              'Люди рядом с вами',
            ),
          ),
                 // actions: [],
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StrangerTile(),
          ],
        ),
        // drawer: SideDrawer(),
      ),
    ]);
  }

  void requestNotificationPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (kDebugMode) {
      print('Permission granted: ${settings.authorizationStatus}');
    }
  }



  void requestLocationPermission() async {
    _serviceEnabled = await location?.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location?.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location?.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location?.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location?.getLocation();

    if (context.mounted) {
      Provider.of<AccountProvider>(context, listen: false).lastLocation =
          '${_locationData?.latitude?.toStringAsFixed(7) ?? ''};${_locationData?.longitude?.toStringAsFixed(7) ?? ''}';
    }

    if (kDebugMode) {
      print(
          '${_locationData?.latitude?.toStringAsFixed(7) ?? ''};${_locationData?.longitude?.toStringAsFixed(7) ?? ''}');
    }

    if (context.mounted) {
      Provider.of<AccountProvider>(context, listen: false).updateProfile().then(
        (value) {
          if (kDebugMode) {
            print(value ? 'success' : 'not success');
          }
        },
      );
    }
  }
}