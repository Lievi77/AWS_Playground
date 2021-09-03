import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  const MyInputField({Key? key, required this.controller, this.hint = ''})
      : super(key: key);

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}
