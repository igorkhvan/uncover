import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      this.onPressed,
      this.buttonText,
      this.backgroundColor,
      this.textColor,
      this.trailIcon,
      this.trailIconColor});

  final VoidCallback? onPressed;
  final String? buttonText;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? trailIcon;
  final Color? trailIconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // shape: const StadiumBorder(),
          // backgroundColor: const Color.fromRGBO(61, 29, 74, 1),
          backgroundColor: backgroundColor ?? Colors.red,
        ),
        child: (trailIcon != null)
            ? Row(children: [
                Text(
                  buttonText ?? 'Button',
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Icon(
                  trailIcon,
                  size: 16.0,
                  color: trailIconColor ?? Colors.white,
                ),
              ])
            : Text(
                buttonText ?? 'Button',
                style: TextStyle(
                  color: textColor ?? Colors.white,
                ),
              ),
      ),
    );
  }
}
