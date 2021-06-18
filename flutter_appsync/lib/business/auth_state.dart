part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  AuthSuccess();
}

class AuthError extends AuthState {
  final String message;
  final String recoverySuggestion;

  AuthError({@required this.message, @required this.recoverySuggestion});
}

class AuthLoading extends AuthState {}

//whenever we are prompted for an user changing password
class AuthAwaitConfirm extends AuthState {
  final String res;
  final String deliveryMethod;
  final String username;

  AuthAwaitConfirm(
      {@required this.res,
      @required this.deliveryMethod,
      @required this.username});
}
