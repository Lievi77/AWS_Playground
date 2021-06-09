import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'auth_provider.dart' as AP;
import 'package:flutter_appsync/data/user_credentials_model.dart';

class AuthRepository {
  AP.AuthProvider _cognitoAPI = AP.AuthProvider();

  Future<UserCredentials> signIn(username, password) async {
    UserCredentials currentUser =
        UserCredentials(username: username, password: password, isAuth: false);

    SignInResult res = await _cognitoAPI.attemptLogin(currentUser);

    currentUser.authorization = res.isSignedIn;

    print("-> In Repo Sign In: ${currentUser.isAuth} ");

    return currentUser;
  }
}
