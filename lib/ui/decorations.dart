import 'package:flutter/material.dart';

const buttonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const messageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const messageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const textFieldRoundedDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderSide: BorderSide(width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const textFieldUnderlinedDecoration = InputDecoration(
  focusedBorder: focusedInputBorder,
  enabledBorder: enabledInputBorder,
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.0,
  ),
);

const focusedInputBorder = UnderlineInputBorder(
  //Outline border type for TextField
  borderSide: BorderSide(
    color: Colors.white,
    width: 1,
  ),
);

const enabledInputBorder = UnderlineInputBorder(
  //Outline border type for TextField
  borderSide: BorderSide(
    color: Colors.grey,
    width: 1,
  ),
);

const mainBackgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [0.1, 0.3, 0.5, 0.9],
    colors: [
      Colors.black,
      Color.fromRGBO(20, 6, 48, 1.0),
      Color.fromRGBO(53, 15, 135, 1.0),
      Colors.teal,
    ],
  ),
);

const double horizontalPadding = 20.0;

const double verticalPadding = 0.0;
