import 'dart:developer';
import 'package:dio/dio.dart';

import '../../../services/api_service.dart';




class SendRequestdata {
  final ApiService _api = ApiService();
  Future sendData ({required Map<String, dynamic> data}) async {
    final uri = "/api/service-requests";
    final response = await _api.postRequest(uri, data);
try{
    if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception("Failed with status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Failed to send data: $e");
    }
  }

}



























// class SendRequestdata {
//   final Dio dio = Dio();
//
//   Future<dynamic> sendData({required Map<String, dynamic> data}) async {
//     final String endPoint = 'https://f40e-45-242-203-114.ngrok-free.app';
//     try {
//
//       final String url = '$endPoint/api/service-requests';
//       log(data.toString());
//       Response response = await dio.post(
//         url,
//         data: data,
//         options: Options(
//           headers: {'Content-Type': 'application/json'},
//         ),
//       );
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return response.data;
//       } else {
//         throw Exception("Failed with status code: ${response.statusCode}");
//       }
//     } catch (e) {
//       throw Exception("Failed to send data: $e");
//     }
//   }
// }
