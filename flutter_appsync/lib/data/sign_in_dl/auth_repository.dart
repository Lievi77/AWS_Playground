import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'auth_provider.dart' as AP;

class AuthRepository {
  const AuthRepository();

  static const AP.AuthProvider _cognitoAPI = AP.AuthProvider();

  Future<SignInResult> attemptSignIn(username, password) async {
    SignInResult res = await _cognitoAPI.attemptSignIn(username, password);

    print("-> In Repo Sign In: ${res.isSignedIn} ");

    return res;
  }
}
