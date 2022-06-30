import 'package:bot_interceptor/bot_interceptor.dart';
import 'package:dio/dio.dart';

class AppCoreFactory {
  static Dio createDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://randomuser.me/api/',
        responseType: ResponseType.json,
      ),
    )..interceptors.add(LoggerInterceptor());
  }
}
