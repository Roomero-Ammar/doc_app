import 'package:dio/dio.dart';
import 'api_constants.dart';
import 'api_error_model.dart';

// TODO: Refactor this as needed
enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout, // Fixed typo
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError, // Changed to avoid using reserved keywords
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unauthorized = 401; // failure, user is not authorized
  static const int forbidden = 403; // failure, API rejected request
  static const int internalServerError = 500; // failure, crash on server side
  static const int notFound = 404; // failure, not found
  static const int apiLogicError = 422; // API logic error

  // Local status codes
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3; // Fixed typo
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
}

class ResponseMessage {
  static const String noContent = ApiErrors.noContent;
  static const String badRequest = ApiErrors.badRequestError;
  static const String unauthorized = ApiErrors.unauthorizedError; // Changed
  static const String forbidden = ApiErrors.forbiddenError;
  static const String internalServerError = ApiErrors.internalServerError;
  static const String notFound = ApiErrors.notFoundError;

  // Local status messages
  static String connectTimeout = ApiErrors.timeoutError;
  static String cancel = ApiErrors.defaultError;
  static String receiveTimeout = ApiErrors.timeoutError; // Fixed typo
  static String sendTimeout = ApiErrors.timeoutError;
  static String cacheError = ApiErrors.cacheError;
  static String noInternetConnection = ApiErrors.noInternetError;
  static String defaultError = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.noContent:
        return ApiErrorModel(code: ResponseCode.noContent, message: ResponseMessage.noContent);
      case DataSource.badRequest:
        return ApiErrorModel(code: ResponseCode.badRequest, message: ResponseMessage.badRequest);
      case DataSource.forbidden:
        return ApiErrorModel(code: ResponseCode.forbidden, message: ResponseMessage.forbidden);
      case DataSource.unauthorized: // Changed to match enum
        return ApiErrorModel(code: ResponseCode.unauthorized, message: ResponseMessage.unauthorized);
      case DataSource.notFound:
        return ApiErrorModel(code: ResponseCode.notFound, message: ResponseMessage.notFound);
      case DataSource.internalServerError:
        return ApiErrorModel(code: ResponseCode.internalServerError, message: ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return ApiErrorModel(code: ResponseCode.connectTimeout, message: ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return ApiErrorModel(code: ResponseCode.cancel, message: ResponseMessage.cancel);
      case DataSource.receiveTimeout: // Fixed typo
        return ApiErrorModel(code: ResponseCode.receiveTimeout, message: ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return ApiErrorModel(code: ResponseCode.sendTimeout, message: ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return ApiErrorModel(code: ResponseCode.cacheError, message: ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return ApiErrorModel(code: ResponseCode.noInternetConnection, message: ResponseMessage.noInternetConnection);
      case DataSource.defaultError:
        return ApiErrorModel(code: ResponseCode.defaultError, message: ResponseMessage.defaultError);
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // Dio error from the API response or Dio itself
      apiErrorModel = _handleError(error);
    } else {
      // Default error
      apiErrorModel = DataSource.defaultError.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null && error.response?.statusCode != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null && error.response?.statusCode != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
    case DioExceptionType.badCertificate:
      return DataSource.defaultError.getFailure();
  }
  // Default case for unhandled types
 //  return DataSource.defaultError.getFailure();
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}