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
      appBar: AppBar(
        title: Text("New User"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyInputField(
              controller: _nameCtrller,
              hint: "Enter your name",
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: MyInputField(
                controller: _emailCtrller,
                hint: "Enter your email",
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: MyInputField(
                controller: _passwordCtrller,
                hint: "Enter your password",
              ),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.greenAccent,
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
