import 'package:flutter/material.dart';

import '../../ui/notification_screens/notification_screen.dart';
import '../../ui/screens_auth/code_confirmation_screen.dart';
import '../../ui/screens_auth/login_screen.dart';
import '../../ui/screens_auth/register_screen.dart';
import '../../ui/screens_auth/root_screen.dart';
import '../../ui/screens_main/main_screen.dart';

abstract class MainNavigationRoutsName {
  static const root = 'root';
  static const auth = 'auth';
  static const login = 'login';
  static const confirmation = 'confirmation';

  static const mainScreen = '/';
  static const notificationScreen = '/notification_screen';
}

class MainNavigation {
  // String initialRoute(bool isAuth) => isAuth
  //     ? MainNavigationRoutsName.mainScreen
  //     : MainNavigationRoutsName.auth;

  String initialRoute = MainNavigationRoutsName.root;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRoutsName.root: (context) => const RootScreen(),
    MainNavigationRoutsName.auth: (context) => const RegisterScreen(),
    MainNavigationRoutsName.login: (context) => const LoginScreen(),
    MainNavigationRoutsName.confirmation: (context) =>
        const CodeConfirmationScreen(),
    //
    MainNavigationRoutsName.mainScreen: (context) => const MainScreen(),
    MainNavigationRoutsName.notificationScreen: (context) =>
       const NotificationScreen(),
  };

//----роутинг где можно передавать argument(кроме ModalRoute.of(context)!.settings.arguments) ---------------------------------
  // Route<Object> onGenerateRoutes(RouteSettings settings) {
  //   //   //! в main добавить!!!!!!!!!!

  //   switch (settings.name) {
  //     case MainNavigationRoutsName.notificationScreen:
  //       final argument = settings.arguments as RemoteMessage;
    //       return MaterialPageRoute(
  //           builder: (context) => NotificationScreen(
  //                 argument: argument,
  //               ));

  //     default:
  //       const widget = Text('Navigation Error');
  //       return MaterialPageRoute(builder: (context) => widget);
  //   }
  // }
}
