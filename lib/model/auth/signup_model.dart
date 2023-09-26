import '../../data/api/api.dart';
import '../../data/api_call/api_call.dart';

class SignUpModel {
  final _apiService = NetworkApiServices();

  Future<dynamic> signupApi(Map<String, void> data) async {
    try {
      final response = await _apiService.postApi(data, Api.host, Api.signupUrl);
      return response;
    } catch (e) {
      throw e; // Rethrow the exception for error handling in the main class
    }
  }
}
