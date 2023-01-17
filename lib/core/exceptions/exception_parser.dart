// ignore_for_file: avoid_dynamic_calls

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:test_mobile/core/core.dart';

NetworkException parseNetworkException(DioError e) {
  late NetworkException networkException;
  if (e.error is SocketException) {
    networkException =
        NetworkException(NetworkExceptionType.noInternetConnection);
  } else if (e.error is FormatException) {
    networkException = NetworkException(NetworkExceptionType.invalidFormat);
  }
  switch (e.type) {
    case DioErrorType.other:
      networkException =
          NetworkException(NetworkExceptionType.noInternetConnection);
      break;
    case DioErrorType.connectTimeout:
      networkException = NetworkException(NetworkExceptionType.requestTimeOut);
      break;
    case DioErrorType.sendTimeout:
      networkException = NetworkException(NetworkExceptionType.sendTimeOut);
      break;
    case DioErrorType.receiveTimeout:
      networkException = NetworkException(NetworkExceptionType.sendTimeOut);
      break;
    case DioErrorType.cancel:
      networkException =
          NetworkException(NetworkExceptionType.requestCancelled);
      break;
    case DioErrorType.response:
      switch (e.response!.statusCode) {
        case 400:
        case 401:
        case 403:
          networkException = NetworkException(
            NetworkExceptionType.unauthorizedRequest,
            message: e.response!.data['errorMessage'],
          );
          break;
        case 404:
          networkException = NetworkException(NetworkExceptionType.notFound);
          break;
        case 408:
          networkException =
              NetworkException(NetworkExceptionType.requestTimeOut);
          break;
        case 409:
          networkException = NetworkException(NetworkExceptionType.conflict);
          break;
        case 500:
          networkException =
              NetworkException(NetworkExceptionType.internalServerError);
          break;
        case 503:
          networkException =
              NetworkException(NetworkExceptionType.serviceUnavailable);
          break;
        default:
          networkException = NetworkException(
            NetworkExceptionType.unExpected,
            message: e.message,
          );
      }
  }
  return networkException;
}
