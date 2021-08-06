import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_appsync/data/sign_up_dl/sign_up_repository.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

//SIGN UP STATE COMPLETED

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  //deals with the sign up process. i.e, sending new
  // user's information to Cognito and confirming such account

  static const SignUpRepository _signUpRepository = SignUpRepository();

  //step 1: we sign register the user
  void attemptSignUp(String username, String password) async {
    //assume that input is not yet cleaned up

    emit(SignUpLoading());

    try {
      final SignUpResult res =
          await _signUpRepository.attemptSignUp(username, password);

      //start with the unsuccessful cases
      if (!res.isSignUpComplete) {
        //After, we need to confirm the user
        emit(SignUpAwaitConf(
            deliveryDest: res.nextStep.codeDeliveryDetails.destination,
            //we need the username to confirm the account
            username: username));
      }
    } on AuthException catch (e) {
      emit(SignUpError(
          message: e.message, recoverySuggestion: e.recoverySuggestion));
      print("${e.message}");
      print("${e.recoverySuggestion}");
    }
  }

  void confirmSignUp(String code, String email) async {
    emit(SignUpLoading());

    try {
      final SignUpResult res =
          await _signUpRepository.confirmSignUp(code, email);

      if (res.isSignUpComplete) {
        emit(SignUpSuccess());
      } else {
        emit(SignUpError(
            message: res.nextStep.signUpStep,
            recoverySuggestion: res.nextStep.signUpStep));
      }
    } on AuthException catch (e) {
      emit(SignUpError(
          message: e.message, recoverySuggestion: e.recoverySuggestion));
    }
  }
}
