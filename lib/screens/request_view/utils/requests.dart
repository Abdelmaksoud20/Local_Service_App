import 'dart:developer';
import 'package:graduation_project/models/personal_info_model.dart';
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

  Future<PersonalInfoModel> personalInfo({required int id}) async {
    final String url = "/api/users/user/profile/$id";
    try {
      var response = await apiService.getRequest(url);
      log(response.toString());
      final PersonalInfoModel info = PersonalInfoModel.formjson(response);
      return info;
    } catch (e) {
      log(e.toString());
      throw Exception("Failed to data: $e");
    }
  }
}
