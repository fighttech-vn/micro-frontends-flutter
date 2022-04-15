part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState extends Equatable {
  final bool isEnableSubmit;

  const SignInState(this.isEnableSubmit);
}

class SignInInitial extends SignInState {
  const SignInInitial(bool isEnableSubmit) : super(isEnableSubmit);

  @override
  List<Object?> get props => [isEnableSubmit];
}

class SignInLoading extends SignInInitial {
  const SignInLoading(bool isEnableSubmit) : super(isEnableSubmit);

  @override
  List<Object?> get props => [isEnableSubmit];
}

class SingInSuccess extends SignInState {
  final User user;

  const SingInSuccess(
    this.user, {
    required bool isEnableSubmit,
  }) : super(isEnableSubmit);

  @override
  List<Object?> get props => [user, isEnableSubmit];
}

class SingInFailed extends SignInState {
  final String msg;

  const SingInFailed(
    this.msg, {
    required bool isEnableSubmit,
  }) : super(isEnableSubmit);

  @override
  List<Object?> get props => [msg, isEnableSubmit];
}
