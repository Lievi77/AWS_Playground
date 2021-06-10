part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final SignInResult res;

  AuthSuccess({@required this.res});
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class AuthLoading extends AuthState {}

//whenever we are prompted for an user changing password
class AuthAwaitConfirm extends AuthState {
  final SignInResult res;

  AuthAwaitConfirm({@required this.res});
}
