import 'dart:developer';
import 'package:graduation_project/models/personal_info_model.dart';
import 'package:graduation_project/screens/home_views/utils/models/request_state_model/request_state_model.dart';
import '../../../services/api_service.dart';

class Requests {
  ApiService apiService = ApiService();
  Future<dynamic> sendTopData({required Map<String, dynamic> data}) async {
    final String url = "/api/top-provider-request";
    try {
      return await apiService.postRequest(url, data);
    } catch (e) {
      throw Exception("Failed to send data: $e");
    }
  }
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
      final PersonalInfoModel info = PersonalInfoModel.formjson(response);
      return info;
    } catch (e) {
      log(e.toString());
      throw Exception("Failed to data: $e");
    }
  }

  Future<Map<String, dynamic>> updateData({
    required Map<String, dynamic> data,
    required int id,
  }) async {
    final String url = '/api/users/user/profile/$id';
    try {
      var response = await apiService.postRequest(url, data);
      return response;
    } catch (e) {
      throw Exception("Failed to update data: $e");
    }
  }

  Future<RequestStateModel> requestDetails({required int id}) async {
    final String url = '/api/service-requests/$id';
    try {
      final response = await apiService.getRequest(url);
      final RequestStateModel data = RequestStateModel.fromJson(response);
      return data;
    } catch (e) {
      throw Exception("Failed to Request Details: $e");
    }
  }
}
