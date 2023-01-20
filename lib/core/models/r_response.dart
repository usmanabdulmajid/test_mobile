import 'package:dio/dio.dart';

///This is a response object returned from http requests
class RResponse<T> {
  Response? result;
  RResponse({
    this.result,
  });

  RResponse<T> copyWith({
    Response? result,
  }) {
    return RResponse<T>(
      result: result ?? this.result,
    );
  }
}
