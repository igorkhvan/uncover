import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncover/logic/providers/account_provider.dart';
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
}
