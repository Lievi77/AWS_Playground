import 'package:flutter/material.dart';
import 'package:flutter_appsync/business/reset_password_cubit/reset_password_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/route_constants.dart';

class RecoverPasswordScreen extends StatefulWidget {
  @override
  _RecoverPasswordScreenState createState() => _RecoverPasswordScreenState();
}

//TODO: DESIGN RECOVER PASSWORD SCREEN
class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Recover Password")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Enter e-mail"),
            TextField(
              controller: _emailController,
            ),
            BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, state) {
              if (state is ResetPasswordAwaitConf) {
                //TODO: BUILD CONFIRMATION CODE SCREEN
                Navigator.pushNamed(context, ConfirmPasswordRoute);
              }
            }, builder: (context, state) {
              if (state is ResetPasswordError) {
                return Row(
                  children: [
                    Icon(Icons.warning),
                    Text(
                      "${state.recoverySuggestion}",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                );
              }

              return Container();
            }),
            MaterialButton(
              onPressed: () {
                BlocProvider.of<ResetPasswordCubit>(context)
                    .resetPassword(_emailController.text);
              },
              child: Text("Submit"),
              color: Colors.indigoAccent,
            )
          ],
        ),
      ),
    );
  }
}
