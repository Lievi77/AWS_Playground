import 'reset_password_provider.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

class ResetPasswordRepository {
  final ResetPasswordProvider _resetPasswordProvider = ResetPasswordProvider();

  Future<ResetPasswordResult> attemptPasswordReset(String email) async {
    //TODO: CONTACT COGNITO

    ResetPasswordResult res =
        await _resetPasswordProvider.attemptPasswordReset(email.trim());

    return res;
  }
}
