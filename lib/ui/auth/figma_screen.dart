import 'package:flutter/material.dart';

class FigmaScreen extends StatelessWidget {
  const FigmaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 932,
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
        // transform: Matrix4.rotationZ(0),
        // opacity: 1,
      ),
      child: const Text(
        'uncover',
        style: TextStyle(
          // width: 178,
          height: 57,
          // transform: Matrix4.rotationZ(0),
          // opacity: 1,
          // textAlign: TextAlign.left,
          fontSize: 50,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }
}