import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncover/logic/providers/account_provider.dart';
import 'package:uncover/logic/providers/users_provider.dart';
import 'package:uncover/logic/services/shared_prefs_service.dart';
import 'package:uncover/ui/components/rounded_button.dart';
import 'package:uncover/ui/components/side_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final SharedPrefs sharedPrefs = SharedPrefs();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<UsersProvider>(context, listen: false).getUsersFromServer(
          Provider.of<AccountProvider>(context, listen: false).account);

      requestNotificationPermission();

      if (kDebugMode) {
        print(await SharedPrefs().getFirebaseToken());
      }



    });
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'uncover',
          ),
//        actions: [],
        ),
        body: Container(),
        drawer: SideDrawer(),
      ),
    );
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

    // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    //   print('User granted permission');
    // } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    //   print('User granted provisional permission');
    // } else {
    //   print('User declined or has not accepted permission');
    // }

    if (kDebugMode) {
      print('Permission granted: ${settings.authorizationStatus}');
    }
  }

}
