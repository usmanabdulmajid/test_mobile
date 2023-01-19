// ignore_for_file: only_throw_errors, avoid_setters_without_getters

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:test_mobile/core/core.dart';

class DioService implements HttpService {
  DioService(this.dio) {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 15000;
    dio.options.headers.addAll({'Content-Type': 'application/json'});
    if (kDebugMode) {
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (requestOptions, handler) {
            logger.i(
              'REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}'
              '=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}',
            );
            return handler.next(requestOptions);
          },
          onResponse: (response, handler) {
            logger.i(
              'RESPONSE[${response.statusCode}] => DATA: ${response.data}',
            );
            return handler.next(response);
          },
          onError: (err, handler) {
            logger
              ..e('Error[${err.response?.statusCode}]')
              ..e('Error[${err.response?.data}]');
            return handler.next(err);
          },
        ),
      );
    }
  }
  final Dio dio;
  @override
  Future<RResponse> request({
    required String url,
    required RequestMethod methodrequest,
    Map<String, dynamic>? params,
  }) async {
    var response = RResponse();
    try {
      if (methodrequest == RequestMethod.post) {
        response.result = await dio.post(url, data: params);
      } else if (methodrequest == RequestMethod.delete) {
        response.result = await dio.delete(url);
      } else if (methodrequest == RequestMethod.patch) {
        response.result = await dio.patch(url);
      } else if (methodrequest == RequestMethod.put) {
        response.result = await dio.put(url, data: params);
      } else {
        response.result = await dio.get(url, queryParameters: params);
      }
      return response;
    } catch (e) {
      if (e is DioError) {
        logger.e(e.response);
        throw parseNetworkException(e);
      }
      throw Exception(e);
    }
  }

  @override
  set header(Map<String, dynamic> header) {
    dio.options.headers = header;
  }

  @override
  Future<Map<String, dynamic>> formdata({
    required String key,
    required String path,
    String? name,
  }) async {
    final formdata = <String, dynamic>{
      key: await MultipartFile.fromFile(path, filename: name),
    };
    return formdata;
  }
}
