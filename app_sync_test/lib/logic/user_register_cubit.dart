import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_register_state.dart';

class UserRegisterCubit extends Cubit<UserRegisterState> {
  UserRegisterCubit() : super(UserRegisterInitial());

  void initRegistrationProcess(String email, String password) {}

  void initConfirmationProcess(String email) {}
}
