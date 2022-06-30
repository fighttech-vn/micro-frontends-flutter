// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> extends Equatable {
  final T results;

  const ApiResponse(
    this.results,
  );

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromT) =>
      _$ApiResponseFromJson(json, fromT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);

  @override
  List<Object> get props => [];
}
