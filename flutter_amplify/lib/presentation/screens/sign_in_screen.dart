import 'package:flutter/material.dart';
//import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import '../widgets/usr_passwd_widget.dart';
import 'package:flutter_amplify/constants/constants.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({this.title});

  final String title;

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserPasswdWidget(
            nextPage: feedRoute,
            buttonText: "Sign In",
          ),
        ],
      ),
    );
  }
}
