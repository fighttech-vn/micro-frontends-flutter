part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SubmitSignInEvent extends SignInEvent {
  final String email;
  final String password;

  SubmitSignInEvent({
    required this.email,
    required this.password,
  });
}

class UserInputChanged extends SignInEvent {
  final bool isEnable;

  UserInputChanged({required this.isEnable});
}
