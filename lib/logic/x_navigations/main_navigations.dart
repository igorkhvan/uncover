import 'package:flutter/material.dart';

import '../../ui/screens_auth/register_screen.dart';
import '../../ui/screens_main/main_screen.dart';


abstract class MainNavigationRoutsName {
  static const auth = 'auth';
  static const mainScreen = '/';
  static const movieScreen = '/movie';
  static const movieScreenDetails = '/movie_details';
  static const movieScreenDetailsTrailer = '/movie_details/trailer';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRoutsName.mainScreen
      : MainNavigationRoutsName.auth;

  final routes = <String, Widget Function(BuildContext)>{
   
    MainNavigationRoutsName.auth: (context) => const RegisterScreen(),
    MainNavigationRoutsName.mainScreen: (context) => const MainScreen(),
  };



//----------------роутинг где можно передавать argument ---------------------------------
  // Route<Object> onGenerateRoutes(RouteSettings settings) {
  //   //! в main добавить!!!!!!!!!!

  //   switch (settings.name) {
  //     case MainNavigationRoutsName.movieScreenDetails:
  //       final argument = settings.arguments as int;
  //       return MaterialPageRoute(
  //           builder: (context) => Widget(
  //                 argument: argument,
  //               ));
      
  //     default:
  //       const widget = Text('Navigation Error');
  //       return MaterialPageRoute(builder: (context) => widget);
  //   }
  // }
}
