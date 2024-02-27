import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  useMaterial3: true,
  // colorScheme: ColorScheme.fromSeed(
  //   seedColor: Colors.teal,
  //   brightness: Brightness.dark,
  // ),
  fontFamily: 'Helvetica',
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(fontSize: 16),
  ),
);
