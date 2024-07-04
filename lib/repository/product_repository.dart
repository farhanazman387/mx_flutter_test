import 'dart:convert';

import 'package:product_showcase/models/product_list_model.dart';
import 'package:product_showcase/service/product_api_service.dart';

class ProductRepository {
  final ApiService _service = ApiService();

  Future<List<Product>> getProducts() async {
    final response = await _service.fetchProducts();

    if (response.statusCode == 200) {
      return List<Product>.from(
          json.decode(response.body).map((x) => Product.fromJson(x)));
    } else {
      throw Exception('Failed to load products');
    }
  }
}