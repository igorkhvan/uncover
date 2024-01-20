import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uncover/logic/models/user_model.dart';
import 'package:uncover/logic/providers/account_provider.dart';
import 'package:uncover/logic/services/shared_prefs_service.dart';
import 'package:uncover/ui/auth/auth_screen.dart';
import 'package:uncover/ui/auth/main_screen.dart';
import 'package:uncover/ui/auth/register_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  Future<UserModel>? _user;

  @override
  void initState() {
    super.initState();
    Provider.of<AccountProvider>(context, listen: false)
        .setUserFromSharedPrefs();
    _user = SharedPrefs().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: _user,
      builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
        Widget screen;
        if (snapshot.hasData) {
          if (snapshot.data?.authToken == null) {
            screen = const RegisterScreen();
          } else {
            screen = const MainScreen();
          }
        } else {
          screen = const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ],
          );
        }
        return screen;
      },
    );
  }
}