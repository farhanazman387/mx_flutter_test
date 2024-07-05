import 'package:flutter/material.dart';
import 'package:product_showcase/models/product_list_model.dart';
import 'package:product_showcase/repository/product_repository.dart';

class ProductListViewModel extends ChangeNotifier {
  final ProductRepository _repository = ProductRepository();
  
  List<Product> _products = [];
  bool fetchingData = false;
  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    fetchingData = true;
    try {
      _products = await _repository.getProducts();
      print(_products);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
    fetchingData = false;
  }
}