import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_appsync/data/sign_in_dl/auth_repository.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static const AuthRepository _authRepository = AuthRepository();

  //TODO: BUILD THE LOGIN METHOD

  void attemptLogin(String username, String password) async {
    emit(LoginLoading());

    try {
      //we attempt a login

      SignInResult res =
          await _authRepository.attemptSignIn(username, password);

      if (res.isSignedIn) {
        emit(LoginSuccess());
      } else if (res.nextStep.signInStep == 'DONE') {
        emit(LoginSuccess());
      }
    } on AuthException catch (e) {
      emit(LoginError(
          message: e.message, recoverySuggestion: e.recoverySuggestion));
    }
  }
}
