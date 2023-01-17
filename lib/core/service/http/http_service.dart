// ignore_for_file: avoid_setters_without_getters

import 'package:test_mobile/core/core.dart';

abstract class HttpService {
  set header(Map<String, dynamic> header);
  Future<Map<String, dynamic>> formdata({
    required String key,
    required String path,
    String? name,
  });
  Future<RResponse> request({
    required String url,
    required RequestMethod methodrequest,
    Map<String, dynamic>? params,
  });
}
