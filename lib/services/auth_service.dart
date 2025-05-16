import 'package:graduation_project/models/auth_models/login_model.dart';
import 'package:graduation_project/models/auth_models/register_model.dart';

import 'api_service.dart';




class AuthService {
  final ApiService _api = ApiService();

  Future login(LoginModel model) async {
    final uri = "/api/user/auth/login";
    final response = await _api.postRequest(uri, model.toJson());

    print("Login Response: $response");
    return response;
  }

  Future register(RegisterModel model) async {
    final uri = "/api/user/auth/register";
    final response = await _api.postRequest(uri,model.toJson());
    print("Register Response: $response");
    return response;
  }

  Future registerClint(RegisterModel model ) async {
    print("Login Payload: ${model.toJson()}--------+++++++...........");
    final uri = "/api/user/auth/register/client";
    final response = await _api.postRequest( uri , model.toJson() );
    print(" Register Clint Response: $response---------------------");
    return response;
  }
}










