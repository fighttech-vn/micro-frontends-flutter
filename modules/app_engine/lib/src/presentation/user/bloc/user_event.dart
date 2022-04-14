part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class LoadUserEvent extends UserEvent {
  final User user;

  LoadUserEvent(this.user);
}
