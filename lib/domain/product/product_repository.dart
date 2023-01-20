import 'package:test_mobile/core/core.dart';

abstract class ProductRepository {
  Future<List<Product>> getProductAll();
  Future<Product> getProduct(int id);
  Future<Product> searchProduct(String name);
  Future<List<Product>> getLimitProduct(int limit);
  Future<List<Product>> getSkippedProduct(int skip);
  Future<List<String>> getCategories();
  Future<List<Product>> getProductOfCategory(String category);
  Future<Product> addProduct(Product data);
  Future<Product> updateProduct({
    required int id,
    required Map<String, dynamic> data,
  });
  Future<Product> deleteProduct(int id);
}
