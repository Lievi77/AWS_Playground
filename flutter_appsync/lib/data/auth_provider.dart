import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

class AuthProvider {
  Future<SignInResult> attemptSignIn(String username, String password) async {
    // print("~~~ In Provider Class: ${user.username}, ${user.password}");

    SignInResult res =
        await Amplify.Auth.signIn(username: username, password: password);

    print("Sign in result (in Provider class): ${res.nextStep.signInStep}");

    return res;
  }

  Future<SignUpResult> attemptSignUp(String username, String password) async {
    CognitoSignUpOptions opts =
        //Must match your Cognito Schema. ie, what identifies a user?
        CognitoSignUpOptions(userAttributes: {'email': username});

    SignUpResult res = await Amplify.Auth.signUp(
        username: username, password: password, options: opts);

    print("Sign up result (In Provider class: ${res.isSignUpComplete}");

    return res;
  }

  //TODO: REGISTRATION FLOW
  Future<dynamic> attemptConfirmation(String username, String password) async {
    SignInResult res =
        await Amplify.Auth.signIn(username: username, password: password);

    print('Sign in result (in Provider class): ${res.nextStep.signInStep}');

    return res;
  }
}
