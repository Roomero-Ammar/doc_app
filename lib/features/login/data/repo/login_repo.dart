import 'package:doctors_speciality/core/networking/api_error_handler.dart';
import 'package:doctors_speciality/core/networking/api_result.dart';
import 'package:doctors_speciality/core/networking/api_service.dart';
import 'package:doctors_speciality/features/login/data/models/login_request_body.dart';
import 'package:doctors_speciality/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } on Exception catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}
