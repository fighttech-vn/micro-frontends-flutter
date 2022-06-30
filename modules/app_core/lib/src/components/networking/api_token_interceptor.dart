// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

import 'package:dio/dio.dart';

import '../../data/datasource/local/app_preferences.dart';

class ApiTokenInterceptor extends Interceptor {
  final AppPreferences appPreferences;

  ApiTokenInterceptor({
    required this.appPreferences,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = appPreferences.getToken();

    if (accessToken?.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
  }
}
