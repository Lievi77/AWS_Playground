part of 'log_in_cubit.dart';

@immutable
abstract class LoginState {
  //const constructors have certain benefits
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  final String nextStep;
  const LoginLoading({this.nextStep});
}

class LoginAwaitConf extends LoginState {
  final String username;
  final String deliveryDest;

  const LoginAwaitConf({this.username, this.deliveryDest});
}

class LoginError extends LoginState {
  final String message;
  final String recoverySuggestion;

  const LoginError({this.message, this.recoverySuggestion});
}

class LoginSuccess extends LoginState {}
