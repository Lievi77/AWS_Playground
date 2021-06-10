import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_appsync/data/auth_repository.dart';
import 'package:meta/meta.dart';
import '';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRepository _authRepository = AuthRepository(); //local repository

  Future<void> authRequest(String username, String password) async {
    emit(AuthLoading()); //always emit a state

    print("~~~ In Cubit: $username, $password");

    try {
      //auth Attempt
      SignInResult res =
          await _authRepository.attemptSignIn(username, password);

      if (res.nextStep.signInStep == "CONFIRM_SIGN_IN_WITH_NEW_PASSWORD") {
        emit(AuthAwaitConfirm(res: res));
      } else {
        emit(AuthSuccess(res: res));
      }
    } on AuthException catch (e) {
      emit(AuthError(e.message));
    }
  }
}
