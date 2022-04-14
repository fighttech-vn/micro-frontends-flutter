import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String username;
  final String picture;

  const User({
    required this.email,
    required this.username,
    required this.picture,
  });

  @override
  List<Object?> get props => [
        email,
        username,
      ];
}
