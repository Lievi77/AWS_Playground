part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {
  //const constructors have certain benefits
  const SignUpState();
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {
  final String nextStep;
  const SignUpLoading({this.nextStep});
}

class SignUpAwaitConf extends SignUpState {
  final String username;
  final String deliveryDest;

  const SignUpAwaitConf({this.username, this.deliveryDest});
}

class SignUpError extends SignUpState {
  final String message;
  final String recoverySuggestion;

  const SignUpError({this.message, this.recoverySuggestion});
}

class SignUpSuccess extends SignUpState {}
