part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {
  
}

class UserLoadedInformation extends UserState {
  final User user;

  UserLoadedInformation(this.user);
}
