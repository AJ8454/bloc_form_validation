part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class SignInTextChangeEvent extends SignInEvent {
  String? emailValue;
  String? passwordValue;
  SignInTextChangeEvent({
    this.emailValue,
    this.passwordValue,
  });
}

class SignInSubmittedEvent extends SignInEvent {
  String? email;
  String? password;
  SignInSubmittedEvent({
    this.email,
    this.password,
  });
}
