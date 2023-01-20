// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:test_mobile/core/core.dart';
import 'package:test_mobile/domain/domain.dart';

class BusinessViewmodel extends ChangeNotifier {
  BusinessViewmodel(this._productRepo);
  final ProductRepository _productRepo;

  bool _loading = false;
  List<Product> _businesses = [];
  List<Product> _utilityBusinessList = [];
  final _errorModel = ErrorModel();

  bool get loading => _loading;
  List<Product> get businesses => _businesses;
  ErrorModel get error => _errorModel;

  Future<void> getBusinesses() async {
    if (_businesses.isEmpty) {
      _loading = true;
      notifyListeners();
    }
    _errorModel.clear();
    notifyListeners();
    try {
      _businesses = await _productRepo.getProductAll();
      notifyListeners();
    } on NetworkException catch (e) {
      _errorModel.description = e.value;
      notifyListeners();
      logger.e(e.value);
    } catch (e) {
      _errorModel.description = 'Somthing went wrong';
      notifyListeners();
      logger.e(e);
    }
    _loading = false;
    notifyListeners();
  }

  void searchProduct(String keyword) {
    if (keyword.isEmpty) {
      _businesses = _utilityBusinessList;
      _businesses.sort((a, b) => a.title!.compareTo(b.title!));
      notifyListeners();
      return;
    }
    _businesses = _utilityBusinessList
        .where((category) => category.title!.toLowerCase().contains(keyword))
        .toList();
    _businesses.sort((a, b) => a.title!.compareTo(b.title!));
    notifyListeners();
  }
}
