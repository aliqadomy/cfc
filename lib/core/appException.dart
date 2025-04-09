
import 'package:dio/dio.dart';

class AppException implements Exception {
  final String message;

  AppException(this.message);
  @override

  String toString() {
    return message;
  }

  static AppException fromDioError(DioException dioError) {
    String? errorDescription;

    switch (dioError.type) {
      case DioException.receiveTimeout:
        return AppException('Connection Timeout');
      case DioException.sendTimeout:
        return AppException('Connection Timeout');
      case DioException.badResponse:
        return AppException(_handleError(dioError.response?.statusCode));
      case DioException.requestCancelled:
        return AppException('Request Cancelled');
      case DioExceptionType.badResponse:
        try {
          // Check for specific status codes and provide tailored messages
          if (dioError.response!.statusCode == 404) {
            errorDescription = 'Resource not found';
            return AppException('$errorDescription');

          } else if (dioError.response!.statusCode == 401) {
            errorDescription = 'Unauthorized access';
            return AppException('$errorDescription');

          } else if (dioError.response!.statusCode == 422) {
            errorDescription = 'Validation failed';
            return AppException('$errorDescription');

          } else {
            errorDescription = 'Something went wrong. Please try again';
            return AppException('Something went wrong');
          }
        } catch (e) {
          return AppException('Something went wrong');
        }
      default:
        return AppException('Something went wrong');
    }
  }

  static String _handleError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad Request';
      case 401:
        return 'Unauthorized';
      case 404:
        return 'Not Found';
      case 500:
        return 'Internal Server Error';
      default:
        return 'Oops! Something went wrong';
    }
  }
}