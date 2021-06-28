import 'package:flutter/material.dart';
import 'package:flutter_appsync/business/log_in_cubit/log_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/route_constants.dart';

class ConfirmationScreen extends StatefulWidget {
  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _conf_code_controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushNamed(context, SignInRoute);
            }
          },
          builder: (context, state) {
            if (state is LoginAwaitConf) {
              return CodeConfFiled(
                controller: _conf_code_controller,
                deliveryMethod: state.deliveryDest,
                onPressed: () {
                  String codeToSend = _conf_code_controller.text;

                  BlocProvider.of<LoginCubit>(context)
                      .attemptConfirmation(codeToSend, state.username);
                },
              );
            } else if (state is LoginLoading) {
              return CircularProgressIndicator();
            } else {
              return CodeConfFiled(
                controller: _conf_code_controller,
                deliveryMethod: "email",
                onPressed: () {
                  String codeToSend = _conf_code_controller.text;

                  BlocProvider.of<LoginCubit>(context)
                      .attemptConfirmation(codeToSend, "xxx");
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class CodeConfFiled extends StatelessWidget {
  const CodeConfFiled(
      {Key key,
      @required this.deliveryMethod,
      @required this.controller,
      @required this.onPressed})
      : super(key: key);

  final String deliveryMethod;
  final TextEditingController controller;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Enter your verification code sent at $deliveryMethod"),
        TextField(
          controller: controller,
        ),
        MaterialButton(
          onPressed: onPressed,
          child: Text("Submit Confirmation Code"),
          color: Colors.amber,
        )
      ],
    );
  }
}
