import 'package:app_sync_test/presentation/widgets/my_input_field.dart';
import 'package:flutter/material.dart';

//Landing screen == Login Screen in this app
class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final TextEditingController _emailCtrller = TextEditingController();

  final TextEditingController _passwordCtrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyInputField(
              controller: _emailCtrller,
              hint: "Enter your email",
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: MyInputField(
                controller: _passwordCtrller,
                hint: "Enter your password",
              ),
            ),
            MaterialButton(
              color: Colors.lightGreen,
              onPressed: () {},
              child: Text("Login"),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.greenAccent,
              child: Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}
