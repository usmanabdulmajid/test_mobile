import 'package:test_mobile/core/core.dart';
import 'package:test_mobile/data/data.dart';
import 'package:test_mobile/domain/product/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this._product);
  final ProductApi _product;
  @override
  Future<Product> addProduct(Product data) async {
    late Product product;
    try {
      final response = await _product.addProduct(data.toMap());
      product = Product.fromMap(response.result?.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
    return product;
  }

  @override
  Future<Product> deleteProduct(int id) async {
    late Product product;
    try {
      final response = await _product.deleteProduct(id);
      product = Product.fromMap(response.result?.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
    return product;
  }

  @override
  Future<List<String>> getCategories() async {
    late List<String> categories;
    try {
      final response = await _product.getCategories();
      categories = List<String>.from(response.result?.data);
    } catch (e) {
      rethrow;
    }
    return categories;
  }

  @override
  Future<List<Product>> getLimitProduct(int limit) async {
    late List<Product> products;
    try {
      final response = await _product.getLimitProducts(limit);
      final list = response.result?.data as List;
      products = list.map((each) => Product.fromMap(each)).toList();
    } catch (e) {
      rethrow;
    }
    return products;
  }

  @override
  Future<Product> getProduct(int id) async {
    late Product product;
    try {
      final response = await _product.getProduct(id);
      product = Product.fromMap(response.result?.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
    return product;
  }

  @override
  Future<List<Product>> getProductAll() async {
    late List<Product> products;
    try {
      final response = await _product.getAllProduct();
      final list = response.result?.data['products'] as List;
      products = list.map((each) => Product.fromMap(each)).toList();
    } catch (e) {
      rethrow;
    }
    return products;
  }

  @override
  Future<List<Product>> getProductOfCategory(String category) async {
    late List<Product> products;
    try {
      final response = await _product.getProductOfCategory(category);
      final list = response.result?.data as List;
      products = list.map((each) => Product.fromMap(each)).toList();
    } catch (e) {
      rethrow;
    }
    return products;
  }

  @override
  Future<List<Product>> getSkippedProduct(int skip) async {
    late List<Product> products;
    try {
      final response = await _product.getSkippedProducts(skip);
      final list = response.result?.data as List;
      products = list.map((each) => Product.fromMap(each)).toList();
    } catch (e) {
      rethrow;
    }
    return products;
  }

  @override
  Future<Product> searchProduct(String name) async {
    late Product product;
    try {
      final response = await _product.searchProduct(name);
      product = Product.fromMap(response.result?.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
    return product;
  }

  @override
  Future<Product> updateProduct({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    late Product product;
    try {
      final response = await _product.updateProduct(id: id, data: data);
      product = Product.fromMap(response.result?.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
    return product;
  }
}
