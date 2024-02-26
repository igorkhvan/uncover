import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:uncover/logic/providers/account_provider.dart';
import 'package:uncover/ui/screens_main//main_screen.dart';
import 'package:uncover/ui/components/rounded_button.dart';
import 'package:uncover/ui/decorations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _name;
  String? _surname;
  // String? _phone;

  late double _screenHeight;
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();

  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _surnameFocus = FocusNode();

  var maskFormatter = MaskTextInputFormatter(
      mask: "+7 (###) ###-##-##",
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

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
                'uncover',
                style: TextStyle(
                  fontSize: 500.0,
                ),
              ),
            ),
          ),

          SizedBox(height: _screenHeight * 0.12),

          const Text('Имя'),

          TextField(
            focusNode: _nameFocus,
            decoration: textFieldUnderlinedDecoration.copyWith(
              hintText: '',
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 20.0),
            onChanged: (value) {
              _name = value;
            },
            textInputAction: TextInputAction.next,
            onSubmitted: (value) {
              _name = value;
            },
            controller: _nameController,
          ),
          SizedBox(height: _screenHeight * 0.03),

          const Text('Фамилия'),

          TextField(
            focusNode: _surnameFocus,
            decoration: textFieldUnderlinedDecoration.copyWith(
              hintText: '',
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 20.0),
            onChanged: (value) {
              _surname = value;
            },
            textInputAction: TextInputAction.next,
            onSubmitted: (value) {
              _surname = value;
            },
            controller: _surnameController,
          ),
          SizedBox(height: _screenHeight * 0.03),

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
              Provider.of<AccountProvider>(context, listen: false)
                  .register(_name, _surname, '+7${maskFormatter.getUnmaskedText()}')
                  .then((success) {
                if (kDebugMode) print(success ? 'success' : 'not success');
                if (success) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()));
                }
              });
            },
            controller: _phoneController,
          ),

          SizedBox(height: _screenHeight * 0.05),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RoundedButton(
                onPressed: () {
                  Provider.of<AccountProvider>(context, listen: false)
                      .register(_name, _surname, '+7${maskFormatter.getUnmaskedText()}')
                      .then((success) {
                    if (kDebugMode) print(success ? 'success' : 'not success');
                    if (success) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()));
                    }
                  });
                },
                backgroundColor: const Color.fromRGBO(61, 29, 74, 1),
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
