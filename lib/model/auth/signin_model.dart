import '../../data/api/api.dart';
import '../../data/api_call/api_call.dart';

class SignInModel {
  final _apiService = NetworkApiServices();

  Future<dynamic> signinApi(Map<String, dynamic> data) async {
    try {
      final response = await _apiService.postApi(data, Api.host, Api.signinUrl);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
