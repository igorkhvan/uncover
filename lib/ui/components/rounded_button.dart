import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, this.onPressed, this.buttonText});

  final VoidCallback? onPressed;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
      ),
      child: Text(buttonText ?? 'Text not defined'),
    );
  }
}
