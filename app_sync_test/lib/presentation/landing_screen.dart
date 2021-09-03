import 'package:app_sync_test/presentation/widgets/my_input_field.dart';
import 'package:flutter/material.dart';

//Landing screen == Login Screen in this app
class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyInputField(),
          MyInputField(),
          MaterialButton(
            color: Colors.lightGreen,
            onPressed: () {},
            child: Text("Login"),
          )
        ],
      ),
    );
  }
}
