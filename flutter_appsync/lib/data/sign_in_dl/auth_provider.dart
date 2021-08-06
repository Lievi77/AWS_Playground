import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

class AuthProvider {
  const AuthProvider();

  Future<SignInResult> attemptSignIn(String username, String password) async {
    // print("~~~ In Provider Class: ${user.username}, ${user.password}");

    SignInResult res =
        await Amplify.Auth.signIn(username: username, password: password);

    print("Sign in result (in Provider class): ${res.isSignedIn}");

    return res;
  }
}
