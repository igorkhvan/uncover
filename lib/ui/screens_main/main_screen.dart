import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncover/logic/providers/account_provider.dart';
import 'package:uncover/logic/providers/stranger_provider.dart';
import 'package:uncover/logic/repositories/shared_prefs.dart';
import 'package:uncover/ui/components/glowing_avatar.dart';
import 'package:uncover/ui/components/stranger_list.dart';
import 'package:location/location.dart';

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
      await Provider.of<StrangerProvider>(context, listen: false)
          .getStrangersFromServer(
              Provider.of<AccountProvider>(context, listen: false).account)
          .then(
            (value) => {
              if (kDebugMode) {print(value ? 'success' : 'not success')}
            },
          );

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
      SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/backgrounds/1.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        bottomNavigationBar: Theme(
          data: ThemeData(
            navigationBarTheme: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  );
                }
                return const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                );
              }),
              // iconTheme: MaterialStateProperty.all(
              //   const IconThemeData(color: Colors.blueGrey),
              // ),
            ),
          ),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                // currentPageIndex = index;
              });
            },
            indicatorColor: Colors.amber,
            backgroundColor: Colors.white.withAlpha(100),
            // selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.indigo,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Badge(
                  label: Text('2'),
                  child: Icon(
                    Icons.notifications_sharp,
                    color: Colors.indigo,
                  ),
                ),
                label: 'Notifications',
              ),
              NavigationDestination(
                icon: Badge(
                  label: Text('2'),
                  child: Icon(
                    Icons.messenger_sharp,
                    color: Colors.indigo,
                  ),
                ),
                label: 'Messages',
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset(
                        'assets/icons/pin-point.png',
                        width: 30.0,
                        height: 30.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      'Люди рядом с тобой',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: GlowingAvatar(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Expanded(
                  child: StrangerList(),
                ),
              ],
            ),
          ),
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
