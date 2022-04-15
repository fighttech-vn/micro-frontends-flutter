import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../models/api_response.dart';
import '../../models/user_model.dart';

part 'onboarding_api.g.dart';

@RestApi()
abstract class OnBoardingApi {
  factory OnBoardingApi(Dio dio, {String baseUrl}) = _OnBoardingApi;

  @GET('')
  Future<ApiResponse<List<UserModel>>> signIn();
}
