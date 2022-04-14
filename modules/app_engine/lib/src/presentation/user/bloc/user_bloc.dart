import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user.dart';


part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUserEvent>(_mapLoadUserEvent);
  }

  FutureOr<void> _mapLoadUserEvent(
      LoadUserEvent event, Emitter<UserState> emit) {
    emit(UserLoadedInformation(event.user));
  }
}
