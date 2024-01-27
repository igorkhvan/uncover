import 'package:flutter/material.dart';
import 'package:uncover/ui/components/rounded_button.dart';
import 'package:uncover/ui/decorations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late double _screenHeight;

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          decoration: mainBackgroundDecoration,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: screenElements(),
          ),
        ),
      ],
    );
  }

  Widget screenElements() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: _screenHeight * 0.18,),
          SizedBox(
            height: _screenHeight * 0.08,
            child: const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'uncover',
                style: TextStyle(
                  fontSize: 500.0,
                ),
              ),
            ),
          ),
          SizedBox(height: _screenHeight * 0.18,),
          const Text('Номер телефона'),
          TextField(
            decoration: textFieldUnderlinedDecoration.copyWith(
              hintText: '',
            ),
            cursorColor: Colors.white,
          ),
          SizedBox(height: _screenHeight * 0.1,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RoundedButton(
                buttonText: 'Далее',
                trailIcon: Icons.arrow_forward_ios_sharp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
