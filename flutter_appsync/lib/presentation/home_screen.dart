import 'package:flutter/material.dart';
import 'package:flutter_appsync/presentation/router/route_constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              child: Text("Sign In"),
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, SignInRoute);
              },
            ),
            MaterialButton(
                child: Text("Sign Up"),
                color: Colors.green,
                onPressed: () {
                  Navigator.pushNamed(context, SignUpRoute);
                }),
            MaterialButton(
                child: Text("Reset Password"),
                color: Colors.green,
                onPressed: () {
                  Navigator.pushNamed(context, RecoverPasswordRoute);
                }),
          ],
        ),
      ),
    );
  }
}
