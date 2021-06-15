import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_appsync/business/connection_cubit.dart';
import 'package:flutter_appsync/business/signup_cubit.dart';
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
        print("I am awaiting cobnf");
        emit(AuthAwaitConfirm(res: res.nextStep.signInStep));
      } else {
        emit(AuthSuccess(res: res.nextStep.signInStep));
      }
    } on AuthException catch (e) {
      emit(AuthError(e.message));
    }
  }

  //bad practice, always build different cubits for different functionalities
  Future<void> attemptSignUp(String username, String password) async {
    emit(AuthLoading());

    try {
      SignUpResult res =
          await _authRepository.attemptSignUp(username, password);

      if (res.nextStep.signUpStep == "CONFIRM_SIGN_UP_STEP") {
        emit(AuthAwaitConfirm(res: res.nextStep.signUpStep));
      }
    } on AuthException catch (e) {
      emit(AuthError(e.message));
    }
  }
}
