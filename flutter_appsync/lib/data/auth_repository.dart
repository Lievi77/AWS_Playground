import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'auth_provider.dart' as AP;

class AuthRepository {
  AP.AuthProvider _cognitoAPI = AP.AuthProvider();

  Future<SignInResult> attemptSignIn(username, password) async {
    SignInResult res = await _cognitoAPI.attemptSignIn(username, password);

    print("-> In Repo Sign In: ${res.isSignedIn} ");

    return res;
  }

  Future<SignUpResult> attemptSignUp(username, password) async {
    SignUpResult res = await _cognitoAPI.attemptSignUp(username, password);

    print("-> In Repo Sign In: ${res.isSignUpComplete} ");
    print("-> In Repo, Next_step: ${res.nextStep.signUpStep}");
    return res;
  }

  Future<dynamic> attemptConfirmation(username, password) async {
    var res = await _cognitoAPI.attemptConfirmation(username, password);

    print("--> In Repo, attempting confirmation: ${res.isSignedIn}");

    return res;
  }
}
