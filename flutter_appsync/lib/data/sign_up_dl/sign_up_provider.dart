import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

class SignUpProvider {
  const SignUpProvider();

  Future<SignUpResult> attemptSignUp(
      String username, String password, Map<String, String> attributes) async {
    //at this point, the inputs are clean

    return await Amplify.Auth.signUp(
        username: username,
        password: password,
        options: CognitoSignUpOptions(userAttributes: attributes));
  }

  Future<SignUpResult> confirmSignUp(String code, String email) async {
    //need email
    return await Amplify.Auth.confirmSignUp(
        username: email, confirmationCode: code);
  }
}
