import 'package:flutter/material.dart';

class FriendTile extends StatelessWidget {
  final String? name;
  final VoidCallback? longPressCallback;
  final VoidCallback? shortPressCallback;

  const FriendTile({
    super.key,
    this.name,
    this.longPressCallback,
    this.shortPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.black54,
      ),
      onLongPress: longPressCallback,
      onTap: shortPressCallback,
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
