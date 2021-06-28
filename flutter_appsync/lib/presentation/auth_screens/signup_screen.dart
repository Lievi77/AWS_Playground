import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appsync/business/sign_up_cubit/sign_up_cubit.dart';

import 'package:flutter_appsync/constants/route_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usr_ctrller = TextEditingController();
  final TextEditingController _psswd_ctrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpAwaitConf) {
              Navigator.pushNamed(context, ConfirmRoute);
            }
          },
          builder: (context, state) {
            return SignUpForm(
                usr_ctrller: _usr_ctrller, psswd_ctrller: _psswd_ctrller);
          },
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key key,
    @required TextEditingController usr_ctrller,
    @required TextEditingController psswd_ctrller,
  })  : _usr_ctrller = usr_ctrller,
        _psswd_ctrller = psswd_ctrller,
        super(key: key);

  final TextEditingController _usr_ctrller;
  final TextEditingController _psswd_ctrller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Username:"),
        TextField(
          controller: _usr_ctrller,
        ),
        Text("Password:"),
        TextField(
          controller: _psswd_ctrller,
        ),
        MaterialButton(
          child: Text("Sign Up"),
          color: Colors.deepOrange,
          onPressed: () {
            print("Submitting Sign Up");

            BlocProvider.of<SignUpCubit>(context)
                .attemptSignUp(_usr_ctrller.text, _psswd_ctrller.text);
          },
        )
      ],
    );
  }
}
