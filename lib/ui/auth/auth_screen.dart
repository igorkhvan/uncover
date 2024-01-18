import 'package:flutter/material.dart';
import 'package:uncover/ui/components/text_field_rounded.dart';
import 'package:uncover/ui/decorations.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextFieldRounded(
            //   // hintText: 'Hello',
            // )
          ],
        ),
      ),
    );
  }
}
