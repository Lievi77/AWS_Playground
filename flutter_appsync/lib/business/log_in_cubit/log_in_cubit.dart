import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
}
