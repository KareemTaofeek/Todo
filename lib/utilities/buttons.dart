import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final ButtonName;
  VoidCallback onPressed;
  MyButtons({
    Key? key,
    required this.ButtonName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.white,
      child:
      Text(ButtonName,),
    );
  }
}
