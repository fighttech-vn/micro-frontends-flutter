import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/authentication_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthenticationUsecase authenticationUseCase;
  final UserBloc userBloc;

  SignInBloc(this.authenticationUseCase, this.userBloc)
      : super(const SignInInitial(false)) {
    on<SubmitSignInEvent>(_mapSubmitSignInEvent);
    on<UserInputChanged>(_mapUserInputChanged);
  }

  FutureOr<void> _mapSubmitSignInEvent(
      SubmitSignInEvent event, Emitter<SignInState> emit) async {
    try {
      emit(SignInLoading(state.isEnableSubmit));

      final user =
          await authenticationUseCase.sinIn(event.email, event.password);

      userBloc.add(LoadUserEvent(user));
      emit(SingInSuccess(
        user,
        isEnableSubmit: state.isEnableSubmit,
      ));
    } catch (e) {
      emit(SingInFailed(
        'error_msg',
        isEnableSubmit: state.isEnableSubmit,
      ));
    }
  }

  FutureOr<void> _mapUserInputChanged(
      UserInputChanged event, Emitter<SignInState> emit) {
    emit(SignInInitial(event.isEnable));
  }
}
