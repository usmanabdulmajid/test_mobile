import 'package:flutter/material.dart';
import 'package:test_mobile/core/core.dart';
import 'package:test_mobile/domain/product/product_repository.dart';

class DashboardViewmodel extends ChangeNotifier {
  DashboardViewmodel(this._productRepo);
  final ProductRepository _productRepo;

  bool _loading = false;
  List<Product> _businesses = [];
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
}
