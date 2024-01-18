
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncover/logic/providers/account_provider.dart';
import 'package:uncover/ui/auth/auth_screen.dart';
import 'package:uncover/ui/auth/register_screen.dart';
import 'package:uncover/ui/theme_data.dart' as my_theme;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountProvider()),
      ],
      child: const Uncover(),
    ),
  );
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
      home: const RegisterScreen(),
    );
  }
}
