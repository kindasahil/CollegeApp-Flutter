abstract class RegisterEvent {
  const RegisterEvent();
}

class UserNameEvent extends RegisterEvent {
  final String username;
  const UserNameEvent(this.username);
}

class RegisterEmailEvent extends RegisterEvent {
  final String email;
  const RegisterEmailEvent(this.email);
}

class RegisterPasswordEvent extends RegisterEvent {
  final String password;
  const RegisterPasswordEvent(this.password);
}

class ConfirmPasswordEvent extends RegisterEvent {
  final String confirmPassword;
  const ConfirmPasswordEvent(this.confirmPassword);
}
