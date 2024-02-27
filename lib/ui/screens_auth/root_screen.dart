import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncover/logic/models/account_model.dart';
import 'package:uncover/logic/providers/account_provider.dart';
import 'package:uncover/logic/repositories/shared_prefs.dart';
import 'package:uncover/ui/screens_main//main_screen.dart';
import 'package:uncover/ui/screens_auth/register_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  Future<AccountModel>? _account;

  @override
  void initState() {
    super.initState();
    Provider.of<AccountProvider>(context, listen: false)
        .setAccountFromSharedPrefs();
    _account = SharedPrefs().getAccount();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AccountModel>(
      future: _account,
      builder: (BuildContext context, AsyncSnapshot<AccountModel> snapshot) {
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
