import 'package:flutter/material.dart';
import 'package:uncover/ui/decorations.dart';

class TextFieldRounded extends StatelessWidget {
  const TextFieldRounded({super.key, this.hintText, required this.onChanged});

  final String? hintText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: textFieldRoundedDecoration.copyWith(hintText: hintText),
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
