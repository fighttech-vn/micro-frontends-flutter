// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'sign_in_model.dart';
import 'user_model.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse<T> extends Equatable {
  @_Converter()
  final T results;

  const ApiResponse(
    this.results,
  );

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  @override
  List<Object> get props => [];
}

class _Converter<T> implements JsonConverter<T, Object?> {
  const _Converter();

  @override
  T fromJson(Object? _json) {
    // This will only work if `json` is a native JSON type:
    //   num, String, bool, null, etc
    // *and* is assignable to `T`.
    //
    // json.encode(_json);

    if (_json is Map<String, dynamic>) {
      switch (T) {
        case SignInModel:
          return SignInModel.fromJson(_json) as T;
        // case SolutionModel:
        //   return SolutionModel.fromJson(_json) as T;

        case Map:
          return _json as T;
      }
    } else if (_json is List) {
      switch (T) {
        case List<UserModel>:
          return _json
              .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList() as T;
      }
    }
    return _json as T;
  }

  @override
  Object? toJson(T object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object;
  }
}
