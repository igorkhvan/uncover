import 'package:uncover/logic/services/shared_prefs_service.dart';
import 'package:flutter/material.dart';



class SideDrawer extends StatelessWidget {
  final SharedPrefs sharedPrefs = SharedPrefs();

  SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Name',
            ),
            // Provider.of<AccountProvider>(context).getAccount().name),
            accountEmail: const Text(
              'email',
            ),
            // Provider.of<AccountProvider>(context).getAccount().phone),
            currentAccountPicture: CircleAvatar(
              backgroundColor:
              Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.white
                  : Colors.white,
              child: const Text(
                'UserName',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: const Text("1"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.pushNamed(context, TaskBoosterScreen.id);
            },
          ),
          ListTile(
            title: const Text("2"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.pushNamed(context, TasksScreen.id);
            },
          ),
          ListTile(
            title: const Text("3"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.pushNamed(context, ChatsScreen.id);
            },
          ),
          ListTile(
            title: const Text("4"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.pushNamed(context, FriendsScreen.id);
            },
          ),
          ListTile(
            title: const Text("Logout"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              sharedPrefs.deleteUser();
              Navigator.of(context).pop();
              // Navigator.pushNamed(context, LoginScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
