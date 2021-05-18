import 'package:flutter/material.dart';

class UserPasswdWidget extends StatefulWidget {
  UserPasswdWidget(
      {this.nextPage,
      this.buttonText,
      this.onPressed,
      this.userFldController,
      this.passwdFldController});
  final String nextPage; //the name of the next page
  final String buttonText;
  final Function onPressed;
  final TextEditingController userFldController;
  final TextEditingController passwdFldController;

  @override
  _UserPasswdWidgetState createState() => _UserPasswdWidgetState();
}

class _UserPasswdWidgetState extends State<UserPasswdWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Email"),
        TextFormField(
          controller: widget.userFldController,
        ),
        Text("Password"),
        TextFormField(
          obscureText: true,
          controller: widget.passwdFldController,
        ),
        MaterialButton(
            color: Colors.green,
            child: Text(widget.buttonText),
            onPressed: widget.onPressed)
      ],
    );
  }
}
