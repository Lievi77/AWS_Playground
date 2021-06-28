import 'package:flutter/material.dart';
import 'package:flutter_appsync/business/reset_password_cubit/reset_password_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmCodeScreen extends StatefulWidget {
  ConfirmCodeScreen({
    Key key,
  }) : super(key: key);

  @override
  _ConfirmCodeScreenState createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  final TextEditingController _codeController = TextEditingController();
  String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm your account"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              builder: (context, state) {
                if (state is ResetPasswordAwaitConf) {
                  //store the username
                  username = state.username;
                }

                return Text("Enter your code sent at $username");
              },
            ),
            TextField(
              controller: _codeController,
            ),
            MaterialButton(
              onPressed: () {
                //TODO: IMPLEMENT ON PRESSED

                print("$username");
              },
              child: Text("Submit code"),
              color: Colors.amberAccent,
            )
          ],
        ),
      ),
    );
  }
}
