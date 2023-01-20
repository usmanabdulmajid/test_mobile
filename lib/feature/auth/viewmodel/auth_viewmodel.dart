// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:test_mobile/core/core.dart';
import 'package:test_mobile/domain/domain.dart';

class AuthViewmodel extends ChangeNotifier {
  AuthViewmodel(this._auth);
  final AuthRepository _auth;

  bool _loading = false;
  final _errorModel = ErrorModel();
  bool get loading => _loading;
  ErrorModel get error => _errorModel;

  void setloading(bool val) {
    _loading = val;
    if (val) _errorModel.clear();
    notifyListeners();
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    setloading(true);
    try {
      await _auth.login(username: username, password: password);
    } on NetworkException catch (e) {
      _errorModel.description = e.value;
      notifyListeners();
      logger.e(e.value);
    } catch (e) {
      _errorModel.description = 'Somthing went wrong';
      notifyListeners();
      logger.e(e);
    }
    setloading(false);
  }
}
