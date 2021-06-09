part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final UserCredentials currentUser;

  AuthSuccess({this.currentUser});
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class AuthLoading extends AuthState {}
