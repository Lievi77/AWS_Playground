import 'package:flutter/material.dart';
import 'package:flutter_appsync/business/auth_cubit.dart';
import 'package:flutter_appsync/presentation/router/route_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Widget buildSignInForm(BuildContext context, var _formKey,
      TextEditingController user, TextEditingController password) {
    return Center(
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: user,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null; //a valid form always returns null
                },
              ),
              TextFormField(
                controller: password,

                obscureText: true,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null; //a valid form always returns null
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    print("~~~OnPressed : ${user.text} , ${password.text}");
                  }
                  // ScaffoldMessenger.of(context)
                  //    .showSnackBar(SnackBar(content: Text('Processing Data')));
                },
                child: Text('Submit'),
              ),
            ],
          )),
    );
  }

  Widget buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(); //to ID the form
    TextEditingController user = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("My Login Screen"),
      ),
      body: Center(
        child: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
          if (state is AuthSuccess) {
            //redirect to feed page

            print("Success, logged as ${state.res.isSignedIn} ");

            Navigator.pushNamed(context, FeedRoute);
          } else if (state is AuthAwaitConfirm) {
            print("~~ Awaiting Confirmation");

            Navigator.pushNamed(context, ConfirmRoute);
          }
        }, builder: (context, state) {
          if (state is AuthInitial) {
            return buildSignInForm(context, _formKey, user, password);
          } else if (state is AuthLoading) {
            return buildLoadingIndicator();
          } else if (state is AuthError) {
            //(state is AuthError)

            print("${state.message}");
            return buildSignInForm(
              context,
              _formKey,
              user,
              password,
            );
          }
          //(state is AuthSuccess)
          return buildSignInForm(context, _formKey, user, password);
        }),
      ),
    );
  }
}
