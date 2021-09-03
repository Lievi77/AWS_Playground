part of 'user_register_cubit.dart';

abstract class UserRegisterState extends Equatable {
  const UserRegisterState();
}

class UserRegisterInitial extends UserRegisterState {
  @override
  List<Object> get props => [];
}

class UserRegisterAwaitConf extends UserRegisterState {
  @override
  List<Object?> get props => [];
}

class UserRegisterError extends UserRegisterState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserRegisterSuccess extends UserRegisterState {
  //Upon success, redirect to , login
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
