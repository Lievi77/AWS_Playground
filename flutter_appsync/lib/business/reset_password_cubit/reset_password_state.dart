part of 'reset_password_cubit.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordError extends ResetPasswordState {
  final String message;
  final String recoverySuggestion;

  ResetPasswordError(
      {@required this.message, @required this.recoverySuggestion});
}

class ResetPasswordAwaitConf extends ResetPasswordState {
  final String nextStep;
  final String username;

  ResetPasswordAwaitConf({@required this.nextStep, @required this.username});
}
