// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_core_factory.dart';

GetIt injector = GetIt.instance;

class DependencyInjection {
  Future<void> inject(Map<String, dynamic> env) async {
    // Local DataSource
    final sharedPreferences = await SharedPreferences.getInstance();

    injector.registerSingleton<SharedPreferences>(sharedPreferences);

    injector.registerSingleton<Dio>(AppCoreFactory.createDio());
  }
}
