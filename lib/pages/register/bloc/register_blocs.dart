import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gagu/pages/register/bloc/register_events.dart';
import 'package:gagu/pages/register/bloc/register_state.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBlocs() : super(const RegisterStates()) {
    on<UserNameEvent>(_userNameEvent);
    on<RegisterEmailEvent>(_emailEvent);
    on<RegisterPasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
  }
  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emit) {
    print("${event.username}");
    emit(state.copyWith(userName: event.username));
  }

  void _emailEvent(RegisterEmailEvent event, Emitter<RegisterStates> emit) {
    print("${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(
      RegisterPasswordEvent event, Emitter<RegisterStates> emit) {
    print("${event.password}");
    emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordEvent(
      ConfirmPasswordEvent event, Emitter<RegisterStates> emit) {
    print("${event.confirmPassword}");
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
