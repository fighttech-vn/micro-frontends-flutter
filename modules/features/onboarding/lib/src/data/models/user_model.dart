// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.

import 'package:app_engine/app_engine.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final String email;
  final String gender;

  const UserModel({
    required this.email,
    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [email];

  User toEntity() => User(
        email: email,
        gender: gender,
      );
}
