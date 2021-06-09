import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_appsync/data/auth_repository.dart';
import 'package:flutter_appsync/data/user_credentials_model.dart';
import 'package:meta/meta.dart';
import '';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRepository authRepository = AuthRepository(); //local repository

  Future<void> authRequest(String username, String password) async {
    emit(AuthLoading()); //always emit a state

    print("~~~ In Cubit: $username, $password");

    try {
      //auth Attempt

      UserCredentials user = await authRepository.signIn(username, password);

      if (user.isAuth) {
        emit(AuthSuccess(currentUser: user));
      } else {
        emit(AuthError("User not authorized"));
      }
    } on AuthException catch (e) {
      emit(AuthError(e.message));
    }
  }
}
