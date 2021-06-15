part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupAwaitConf extends SignupState {}

class SignupError extends SignupState {}
