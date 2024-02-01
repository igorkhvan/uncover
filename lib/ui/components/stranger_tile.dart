import 'package:flutter/material.dart';

class StrangerTile extends StatelessWidget {
  final String? name;
  final VoidCallback? longPressCallback;
  final VoidCallback? shortPressCallback;

  const StrangerTile({
    super.key,
    this.name,
    this.longPressCallback,
    this.shortPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // trailing: const Icon(
      //   Icons.keyboard_arrow_right,
      //   color: Colors.black54,
      // ),
      onLongPress: () {if (longPressCallback != null) longPressCallback;},
      onTap: () {if (shortPressCallback != null) shortPressCallback;},
      title: Text(
        name ?? '',
      ),
    //      trailing: Icon(
    //        Icons.list,
    //        color: Colors.black54,
    //      ),
    );
  }
}
