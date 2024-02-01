import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncover/logic/providers/stranger_provider.dart';
import 'package:uncover/ui/components/stranger_tile.dart';

class UsersList extends StatefulWidget {
  const UsersList(
      {super.key, this.onShortPressFunction, this.onLongPressFunction});

  final Function? onShortPressFunction;
  final Function? onLongPressFunction;

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StrangerProvider>(
      builder: (context, strangerData, _) {
        return (strangerData.strangers != null)
            ? ListView.builder(
                itemBuilder: (context, index) {
                  final friend = strangerData.strangers[index];
                  return Card(
                    color: Colors.white.withAlpha(80),
                    child: StrangerTile(
                      name: friend.name,
                      shortPressCallback: () {
                        // Provider.of<StrangerProvider>(context).setSelectedFriend(friend);
                        widget.onShortPressFunction;
                      },
                      longPressCallback: () {
                        // Provider.of<StrangerProvider>(context).setSelectedFriend(friend);
                        widget.onLongPressFunction;
                      },
                    ),
                  );
                },
                itemCount: strangerData.count,
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.info_outline),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Users not found.'),
                ],
              );
      },
    );
  }
}
