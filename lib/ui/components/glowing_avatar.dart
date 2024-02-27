import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncover/logic/providers/account_provider.dart';

class GlowingAvatar extends StatelessWidget {
  const GlowingAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Card(
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: Image.network(
          Provider.of<AccountProvider>(context, listen: false)
              .account
              .avatar,
          width: 30.0,
          height: 30.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
