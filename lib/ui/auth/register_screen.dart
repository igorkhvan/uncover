import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uncover/logic/providers/account_provider.dart';
import 'package:uncover/ui/components/rounded_button.dart';
import 'package:uncover/ui/components/text_field_rounded.dart';
import 'package:uncover/ui/decorations.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? firstName;

  String? lastName;

  String? phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'First name'
            ),
            TextFieldRounded(
              hintText: 'First name',
              onChanged: (value) {firstName = value;},
            ),
            const Text(
              'Last name',
            ),
            TextFieldRounded(
              hintText: 'Last name',
              onChanged: (value) {lastName = value;},
            ),
            const Text(
              'Phone',
            ),
            TextFieldRounded(
              hintText: 'Phone',
              onChanged: (value) {phone = value;},
            ),
            RoundedButton(
              onPressed: () {
                // FirebaseMessaging.instance.getToken().then((value) {
                //   String? token = value;
                // });
              },
            ),
            RoundedButton(
              onPressed: () {Provider.of<AccountProvider>(context, listen: false).register(firstName, lastName, phone);},
            ),
          ],
        ),
      ),
    );
  }
}
