import 'package:test_mobile/core/core.dart';

abstract class ProductApi {
  Future<RResponse> getAllProduct();
  Future<RResponse> getProduct(int id);
  Future<RResponse> searchProduct(String name);
  Future<RResponse> getLimitProducts(int limit);
  Future<RResponse> getSkippedProducts(int skip);
  Future<RResponse> getCategories();
  Future<RResponse> getProductOfCategory(String category);
  Future<RResponse> addProduct(Map<String, dynamic> product);
  Future<RResponse> updateProduct({
    required int id,
    required Map<String, dynamic> data,
  });
  Future<RResponse> deleteProduct(int id);
}
