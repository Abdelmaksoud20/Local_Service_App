import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  late Dio _dio;
  bool _initialized = false;
  final String baseUrl = "https://306f-45-242-56-157.ngrok-free.app";
  ApiService._internal();

  Future<Dio> get dio async {
    if (_initialized) return _dio;

    final dir = await getApplicationDocumentsDirectory();
    final cookieJar = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage('${dir.path}/.cookies/'),
    );

    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {"Content-Type": "application/json"},
      ),
    )..interceptors.add(CookieManager(cookieJar));

    _initialized = true;

    return _dio;
  }

  Future<dynamic> getRequest(String endpoint) async {
    final d = await dio;
    final response = await d.get(endpoint);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      log('error get data');
    }
  }

  Future<dynamic> postRequest(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final d = await dio;
    final response = await d.post(endpoint, data: data);

    return response.data;
  }

  Future<dynamic> putRequest(String endpoint, Map<String, dynamic> data) async {
    final d = await dio;
    final response = await d.put(endpoint, data: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      throw Exception("Failed with status code: ${response.statusCode}");
    }
  }

  Future<dynamic> deleteRequest(String endpoint) async {
    final d = await dio;
    final response = await d.delete(endpoint);
    return response.data;
  }
}
