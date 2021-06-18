import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

class ResetPasswordProvider {
  Future<dynamic> attemptPasswordReset(String email) async {
    ResetPasswordResult res = await Amplify.Auth.resetPassword(username: email);

    return res;
  }
}
