import 'package:flutter/material.dart';

class SignInWidget extends StatefulWidget {
  SignInWidget({this.nextPage});
  final String nextPage; //the name of the next page

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  String usr;
  String passwd;

  final usrController = TextEditingController();
  final passwdController = TextEditingController();

  void onPressed() {
    //Works well
    //print(
    //    "~~Debug in Sign_In_Widget: usr -> ${usrController.value} , passwd -> ${passwdController.value} ");
    usr = usrController.text;
    passwd = passwdController.text;
    clearControllers();
    //print("~~Debug in Sign_In_Widget: usr -> ${usr} , passwd -> ${passwd} ");
    Navigator.pushNamed(context, widget.nextPage, arguments: [usr, passwd]);
  }

  void clearControllers() {
    usrController.clear();
    passwdController.clear();
  }

  @override
  void dispose() {
    clearControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Email"),
        TextFormField(
          controller: usrController,
        ),
        Text("Password"),
        TextFormField(
          obscureText: true,
          controller: passwdController,
        ),
        MaterialButton(
            color: Colors.green, child: Text("Sign in"), onPressed: onPressed)
      ],
    );
  }
}
