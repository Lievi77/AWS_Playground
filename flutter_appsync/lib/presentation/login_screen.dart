import 'package:flutter/material.dart';
import 'package:amplify_api_plugin_interface/amplify_api_plugin_interface.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({this.title});

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
    );
  }
}
