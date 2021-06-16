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

  void authRequest(String username, String password) async {
    emit(AuthLoading()); //always emit a state

    print("~~~ In Cubit: $username, $password");

    try {
      //auth Attempt
      SignInResult res =
          await _authRepository.attemptSignIn(username, password);

      if (res.nextStep.signInStep == "CONFIRM_SIGN_IN_WITH_NEW_PASSWORD") {
        //print("I am awaiting cobnf");
        emit(AuthAwaitConfirm(
            res: res.nextStep.signInStep,
            username: username,
            deliveryMethod: res.nextStep.codeDeliveryDetails.destination));
      } else {
        emit(AuthSuccess());
      }
    } on AuthException catch (e) {
      emit(AuthError(e.message));
    }
  }

  //bad practice, always build different cubits for different functionalities
  void attemptSignUp(String username, String password) async {
    emit(AuthLoading());

    try {
      SignUpResult res =
          await _authRepository.attemptSignUp(username, password);

      if (res.nextStep.signUpStep == "CONFIRM_SIGN_UP_STEP") {
        emit(AuthAwaitConfirm(
            res: res.nextStep.signUpStep,
            deliveryMethod: res.nextStep.codeDeliveryDetails.destination,
            username: username));
      }
    } on AuthException catch (e) {
      emit(AuthError(e.message));
    }
  }

  void attemptConfirmation(String code, String username) async {
    emit(AuthLoading());

    try {
      SignUpResult res =
          await _authRepository.attemptConfirmation(code.trim(), username);

      if (res.isSignUpComplete) {
        emit(AuthSuccess());
      } else {
        emit(AuthError("Something went wrong"));
      }
    } on AuthException catch (e) {
      emit(AuthError(e.message));
    }
  }
}
