// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_model.dart';

part 'sign_in_model.g.dart';

@JsonSerializable()
class SignInModel extends Equatable {
  final UserModel user;

  const SignInModel({
    required this.user,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignInModelToJson(this);

  @override
  List<Object?> get props => [user];
}
