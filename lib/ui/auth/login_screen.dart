import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uncover/ui/components/rounded_button.dart';
import 'package:uncover/ui/decorations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late double _screenHeight;
  String? _phone;
  final _phoneController = TextEditingController();
  final FocusNode _phoneFocus = FocusNode();

  var maskFormatter = MaskTextInputFormatter(
      mask: "+7 (###) ###-##-##",
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  void initState() {
    super.initState();
  }

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
              _phoneController.text = maskFormatter.getMaskedText() ?? '';
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
                'uncover',
                style: TextStyle(
                  fontSize: 500.0,
                ),
              ),
            ),
          ),
          SizedBox(height: _screenHeight * 0.18),
          const Text('Номер телефона'),
          TextField(
            focusNode: _phoneFocus,
            inputFormatters: [maskFormatter],
            decoration: textFieldUnderlinedDecoration.copyWith(
              hintText: '',
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.phone,
            style: const TextStyle(fontSize: 20.0),
            onChanged: (value) {
              _phone = value;
              if (kDebugMode) print(maskFormatter.getUnmaskedText());
            },
            textInputAction: TextInputAction.done,
            onSubmitted: (value) {
              _phone = value;
              if (kDebugMode) print(maskFormatter.getUnmaskedText());
            },
            controller: _phoneController,
          ),
          SizedBox(height: _screenHeight * 0.05),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RoundedButton(
                backgroundColor: Color.fromRGBO(61, 29, 74, 1),
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
