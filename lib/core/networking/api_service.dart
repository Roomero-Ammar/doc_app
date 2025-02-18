import 'package:dio/dio.dart';
import 'package:doctors_speciality/core/networking/api_constants.dart';
import 'package:doctors_speciality/features/login/data/models/login_response.dart';
import 'package:doctors_speciality/features/sign_up/data/models/sign_up_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/login/data/models/login_request_body.dart';
import '../../features/sign_up/data/models/sign_up_request_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService (Dio dio , {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody 
    );

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody 
    );


}

// dart run build_runner build --delete-conflicting-outputs >> build_runner to generate code