import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../../data/api/api.dart';
import '../../../model/all_products/all_products.dart';

class ProductController extends GetxController {
  List<Product> products = [];

  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
  }

  Future<void> fetchAllProducts() async {
    try {
      final response = await http.get(
        Uri.parse(Api.products),
        headers: {'Accept': 'application/json'},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
        final List<dynamic> productList = jsonResponse['data']['products'];
        products.clear();
        products.addAll(productList.map((json) => Product.fromJson(json)));
        print(products);
        update();

        final storage = GetStorage();
        storage.write('products', productList);
      } else {
        // Handle error
      }
    } catch (e) {
      // Handle error
    }
  }
}

class LocalStorageController extends GetxController {
  final box = GetStorage();

  List<Product> get products => box.read<List<Product>>('products') ?? [];

  void saveProducts(List<Product> products) {
    box.write('products', products);
  }
}
