import '../../../services/api_service.dart';
class Requests {
  ApiService apiService = ApiService();
  Future<dynamic> sendData({required Map<String, dynamic> data}) async {
    final String url = "/api/service-requests";
    try {
      return await apiService.postRequest(url, data);
      
    } catch (e) {
      throw Exception("Failed to send data: $e");
    }
  }

}
