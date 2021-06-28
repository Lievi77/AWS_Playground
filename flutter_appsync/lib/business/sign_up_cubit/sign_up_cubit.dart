import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  //deals with the sign up process. i.e, sending new
  // user's information to Cognito and confirming such account

  void attemptSignUp() {}
}
