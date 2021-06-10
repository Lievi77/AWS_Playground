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
        child: MaterialButton(
          child: Text("Go To Login"),
          color: Colors.green,
          onPressed: () {
            print("I was called");
            Navigator.pushNamed(context, LogInRoute);
          },
        ),
      ),
    );
  }
}
