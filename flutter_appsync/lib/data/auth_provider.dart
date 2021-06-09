import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter_appsync/data/user_credentials_model.dart';

class AuthProvider {
  Future<SignInResult> attemptLogin(UserCredentials user) async {
    // print("~~~ In Provider Class: ${user.username}, ${user.password}");

    SignInResult res = await Amplify.Auth.signIn(
        username: user.username, password: user.password);

    //TODO: CREATE SCREEN TO CONFIRM SIGN IN
    //print("Sign in result (in Provider class): ${res.nextStep}");

    return res;
  }
}
