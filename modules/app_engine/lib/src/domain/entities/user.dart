import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String gender;

  const User({
    required this.email,
    required this.gender,
  });

  @override
  List<Object?> get props => [
        email,
        gender,
      ];
}
