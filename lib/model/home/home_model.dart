import '../../data/api/api.dart';
import '../../data/api_call/api_call.dart';

class HomeModel {
  final _apiService = NetworkApiServices();

  Future<dynamic> allProductsApi() {
    try {
      final response = _apiService.getApi(Api.host, Api.allProducts);
      return response;
    } catch (e) {
      throw e; // Rethrow the exception for error handling in the main class
    }
  }
}
