import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_appsync/data/sign_up_dl/sign_up_provider.dart';

class SignUpRepository {
  const SignUpRepository();

  static const SignUpProvider _signUpProvider = SignUpProvider();

  Future<SignUpResult> attemptSignUp(String username, String password) async {
    //first of all, clean up the input
    String cleanUsername = username.trim();
    String cleanPassword = password.trim();

    //instantiate the appropriate data and requests
    //in our schema: email == username
    Map<String, String> attr = {'email': cleanUsername};

    //usually, in BLOC, we would instantiate the response, but Cognito responses come instantiated
    SignUpResult res =
        await _signUpProvider.attemptSignUp(cleanUsername, cleanPassword, attr);
    return res;
  }
}
