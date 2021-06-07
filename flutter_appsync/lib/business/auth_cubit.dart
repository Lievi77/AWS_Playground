import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_appsync/data/user_credentials_model.dart';
import 'package:meta/meta.dart';
import '';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> authRequest(String username, String password) async {
    emit(AuthLoading()); //always emit a state

    print("~~~ In Cubit: $username, $password");
    UserCredentials currentUser =
        UserCredentials(username: username, password: password, isAuth: false);

    try {
      SignInResult res =
          await Amplify.Auth.signIn(username: username, password: password);

      //TODO: Test in a sample cognito user
      print('${res.isSignedIn}');
    } on AuthException catch (e) {
      emit(AuthError(e.message));
    }
    //do auth
  }
}
