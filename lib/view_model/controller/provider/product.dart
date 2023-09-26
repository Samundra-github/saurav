import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../model/all_products/all_products.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchAllProducts() async {
    try {
      final response = await http.get(
        Uri.parse('https://ea.allgetz.com/api/v1/site/all-products'),
        headers: {'Accept': 'application/json'},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
        final List<dynamic> productList = jsonResponse['data']['products'];
        print(productList);
        _products.clear();
        _products.addAll(productList.map((json) => Product.fromJson(json)));
        print(_products);
        notifyListeners();
      } else {
        // Handle error here
        print('API call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error here
      print('Error fetching products: $e');
    }
  }
}
