import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncover/logic/providers/stranger_provider.dart';
import 'package:uncover/ui/components/stranger_tile.dart';

class StrangerList extends StatefulWidget {
  const StrangerList(
      {super.key, this.onShortPressFunction, this.onLongPressFunction});

  final Function? onShortPressFunction;
  final Function? onLongPressFunction;

  @override
  State<StrangerList> createState() => _StrangerListState();
}

class _StrangerListState extends State<StrangerList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StrangerProvider>(
      builder: (context, strangerData, _) {
        return (strangerData.strangers != null) && (strangerData.count != 0)
            ? ListView.builder(
                itemBuilder: (context, index) {
                  final stranger = strangerData.strangers[index];
                  return StrangerTile(
                    stranger: stranger,
                    shortPressCallback: () {
                      // Provider.of<StrangerProvider>(context).setSelectedFriend(friend);
                      widget.onShortPressFunction;
                    },
                    longPressCallback: () {
                      // Provider.of<StrangerProvider>(context).setSelectedFriend(friend);
                      widget.onLongPressFunction;
                    },
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
                  Text('Пользователи не найдены.'),
                ],
              );
      },
    );
  }
}
