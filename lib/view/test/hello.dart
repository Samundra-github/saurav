import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gokyo/resource/theme/colors.dart';
import 'package:http/http.dart' as http;

class Product {
  int id;
  String name;
  double cost;
  double price;
  int quantity;
  String image;
  String category;

  Product({
    required this.id,
    required this.name,
    required this.cost,
    required this.price,
    required this.quantity,
    required this.image,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      cost: json['cost'].toDouble(),
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      image: json['image'],
      category: json['category']['name'],
    );
  }
}

class ProController extends GetxController {
  List<Product> products = [];

  Future<void> fetchAllProducts() async {
    try {
      final response = await http.get(
        Uri.parse('https://ea.allgetz.com/api/v1/site/category/1/products'),
        headers: {'Accept': 'application/json'},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
        final List<dynamic> productList = jsonResponse['data']['products'];

        products.clear();
        products.addAll(productList.map((json) => Product.fromJson(json)));

        update();
      } else {
        // ... (existing error handling code)
      }
    } catch (e) {
      // ... (existing error handling code)
    }
  }
}

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final ProController proController = Get.put(ProController());

  @override
  void initState() {
    super.initState();
    proController.fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = proController.products;
    return Container(
      color: whiteColor,
      height: 400,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: categoryProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) {
                final product = categoryProducts[index];
                return YourCustomWidget(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class YourCustomWidget extends StatelessWidget {
  final Product product;

  YourCustomWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          SizedBox(height: 8),
          Text(
            'Category: ${product.category}',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
