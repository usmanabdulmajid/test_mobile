import 'package:test_mobile/core/core.dart';
import 'package:test_mobile/data/product/product_api.dart';

class DummyProduct implements ProductApi {
  DummyProduct(this.http);
  final HttpService http;
  @override
  Future<RResponse> addProduct(Map<String, dynamic> product) async {
    return await http.request(
      url: '/products/add',
      methodrequest: RequestMethod.post,
      params: product,
    );
  }

  @override
  Future<RResponse> deleteProduct(int id) async {
    return await http.request(
      url: '/products/$id',
      methodrequest: RequestMethod.delete,
    );
  }

  @override
  Future<RResponse> getAllProduct() async {
    return await http.request(
      url: '/products',
      methodrequest: RequestMethod.get,
    );
  }

  @override
  Future<RResponse> getCategories() async {
    return await http.request(
      url: '/products/categories',
      methodrequest: RequestMethod.get,
    );
  }

  @override
  Future<RResponse> getLimitProduct(int limit) async {
    return await http.request(
      url: '/products?limit=$limit',
      methodrequest: RequestMethod.get,
    );
  }

  @override
  Future<RResponse> getProduct(int id) async {
    return await http.request(
      url: '/products/$id',
      methodrequest: RequestMethod.get,
    );
  }

  @override
  Future<RResponse> getProductOfCategory(String category) async {
    return await http.request(
      url: '/products/category/$category',
      methodrequest: RequestMethod.get,
    );
  }

  @override
  Future<RResponse> getSkippedProduct(int skip) async {
    return await http.request(
      url: '/products?skip=$skip',
      methodrequest: RequestMethod.get,
    );
  }

  @override
  Future<RResponse> searchProduct(String name) async {
    return await http.request(
      url: '/products/search?q=$name',
      methodrequest: RequestMethod.get,
    );
  }

  @override
  Future<RResponse> updateProduct({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    return await http.request(
      url: '/products/$id',
      methodrequest: RequestMethod.put,
      params: data,
    );
  }
}
