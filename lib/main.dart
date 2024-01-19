import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncover/logic/providers/account_provider.dart';
import 'package:uncover/ui/auth/register_screen.dart';
import 'package:uncover/ui/auth/root_screen.dart';
import 'package:uncover/ui/theme_data.dart' as my_theme;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';

Future<void> main() async {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountProvider()),
      ],
      child: const Uncover(),
    ),
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // final fcmToken = await FirebaseMessaging.instance.getToken().then((value) {
  //   print(value);
  // });

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

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}

class Uncover extends StatefulWidget {
  const Uncover({super.key});

  @override
  State<Uncover> createState() => _UncoverState();
}

class _UncoverState extends State<Uncover> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uncover',
      theme: my_theme.myTheme,
      home: const RootScreen(),
    );
  }
}
