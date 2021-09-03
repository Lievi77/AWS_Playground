import 'package:app_sync_test/presentation/widgets/my_input_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameCtrller = TextEditingController();

  final TextEditingController _emailCtrller = TextEditingController();

  final TextEditingController _passwordCtrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyInputField(
            controller: _nameCtrller,
            hint: "Enter your name",
          ),
        ],
      ),
    );
  }
}
