import 'package:flutter/material.dart';

import '../decorations.dart';

class CodeConfirmationScreen extends StatefulWidget {
  const CodeConfirmationScreen({super.key});

  @override
  State<CodeConfirmationScreen> createState() => _CodeConfirmationScreenState();
}

class _CodeConfirmationScreenState extends State<CodeConfirmationScreen> {
  late double _screenHeight;

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          decoration: mainBackgroundDecoration,
        ),
        SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: screenElements(),
            ),
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
          SizedBox(height: _screenHeight * 0.18),
          SizedBox(
            height: _screenHeight * 0.08,
            child: const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'sms code',
                style: TextStyle(
                  fontSize: 500.0,
                ),
              ),
            ),
          ),
          SizedBox(height: _screenHeight * 0.18),
        ],
      ),
    );
  }
}
