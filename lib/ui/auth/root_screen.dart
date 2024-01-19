import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uncover/logic/models/user_model.dart';
import 'package:uncover/logic/providers/account_provider.dart';
import 'package:uncover/logic/services/shared_prefs_service.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {

  Future<UserModel>? user;

  @override
  void initState() {
    super.initState();
    Provider.of<AccountProvider>(context, listen: false).setUserFromSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
