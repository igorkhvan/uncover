import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncover/logic/providers/account_provider.dart';
import 'package:uncover/logic/providers/stranger_provider.dart';
import 'package:uncover/ui/theme_data.dart' as my_theme;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


import 'logic/services/firebase_api.dart';
import 'logic/x_navigations/main_navigations.dart';

//! перенесено в lib/logic/services/firebase_api.dart
// String? _fcmToken;
// String? _fcmTokenSharedPrefs;
// final _messageStreamController = BehaviorSubject<RemoteMessage>();

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // await Firebase.initializeApp();

//   if (kDebugMode) {
//     print("Handling a background message: ${message.messageId}");
//     print('Message data: ${message.data}');
//     print('Message title: ${message.notification?.title}');
//     print('Message body: ${message.notification?.body}');
//   }
// }

//! навигации на экран Push уведомления
final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotofication();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountProvider()),
        ChangeNotifierProvider(create: (context) => StrangerProvider()),
      ],
      child: const Uncover(),
    ),
  );
 //! перенесено в lib/logic/services/firebase_api.dart
  // _fcmTokenSharedPrefs = await SharedPrefs().getFirebaseToken();
  // while (true) {
  //   _fcmToken = await FirebaseMessaging.instance.getToken();
  //   if (_fcmToken != null) {
  //     if (kDebugMode) {
  //       print('fcmToken has obtained: $_fcmToken');
  //     }
  //     if ((_fcmTokenSharedPrefs ?? '') != _fcmToken) {
  //       await SharedPrefs().setFirebaseToken(_fcmToken);
  //     }
  //     break;
  //   }
  // }

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   if (kDebugMode) {
  //     print('Handling a foreground message: ${message.messageId}');
  //     print('Message data: ${message.data}');
  //     print('Message title: ${message.notification?.title}');
  //     print('Message notification: ${message.notification?.body}');
  //   }

  //   _messageStreamController.sink.add(message);
  // }
  // );
}

class Uncover extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const Uncover({super.key});

//   @override
//   State<Uncover> createState() => _UncoverState();
// }

// class _UncoverState extends State<Uncover> {
//   String _lastMessage = '';

  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  // _UncoverState() {
  //   _messageStreamController.listen((message) {
  //     setState(() {
  //       if (message.notification != null) {
  //         _lastMessage = 'Received a notification message:'
  //             '\nTitle=${message.notification?.title},'
  //             '\nBody=${message.notification?.body},'
  //             '\nData=${message.data}';
  //       } else {
  //         _lastMessage = 'Received a data message: ${message.data}';
  //       }
  //     });
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uncover',
      theme: my_theme.myTheme,
//!=====
      navigatorKey: navigatorKey,
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute,
      //onGenerateRoute: mainNavigation.onGenerateRoutes

      //! home: const RootScreen(),
    );
  }
}
