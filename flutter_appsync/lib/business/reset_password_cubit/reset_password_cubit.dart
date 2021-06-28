import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_appsync/data/reset_password_dl/reset_password_provider.dart';
import 'package:flutter_appsync/data/reset_password_dl/reset_password_repository.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  final ResetPasswordRepository _resetPasswordRepository =
      ResetPasswordRepository();

  void resetPassword(String email) async {
    emit(ResetPasswordLoading());

    try {
      ResetPasswordResult res =
          await _resetPasswordRepository.attemptPasswordReset(email);

      if (res.isPasswordReset) {
        emit(ResetPasswordSuccess());
      } else {
        emit(ResetPasswordAwaitConf(
            nextStep: res.nextStep.updateStep, username: email));
      }
    } on AuthException catch (e) {
      emit(ResetPasswordError(
          message: e.message, recoverySuggestion: e.recoverySuggestion));
    }
  }
}
