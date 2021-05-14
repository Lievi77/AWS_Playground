import 'package:flutter/material.dart';

class SignInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Email"),
        TextFormField(),
        Text("Password"),
        TextFormField()
      ],
    );
  }
}
