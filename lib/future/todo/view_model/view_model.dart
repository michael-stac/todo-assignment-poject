import 'package:flutter/material.dart';
import '../model/todo_model.dart';
import '../service/todo_get_list_service_provider.dart';


class ProductViewModel extends ChangeNotifier {
  final ProductService _productService = ProductService();

  List<Product> _products = [];
  Product? _selectedProduct;
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get products => _products;
  Product? get selectedProduct => _selectedProduct;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchAllProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _products = await _productService.fetchAllProducts();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchProductById(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      _selectedProduct = await _productService.fetchProductById(id);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
