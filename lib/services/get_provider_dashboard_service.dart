
import '../models/get_services_model/get_provider_dash_board.dart';
import 'api_service.dart';

class ProviderDashBoardService {
  final ApiService api = ApiService();
  final endPoint = "/api/dashboard";

  Future<GetProviderDashBoard> getProviderDashboard() async {
    try {
      final Map<String, dynamic> data = await api.getRequest(endPoint);
      final providerDashBoard = GetProviderDashBoard.fromJson(data);
      print("-------------${providerDashBoard.data?.serviceRequests?.length.toString()}----------------");
    return providerDashBoard;

    } catch (e) {
      throw Exception('+++++++++++++Error fetching providers: $e');
    }
  }
}

class RequestStatus{
  final ApiService api = ApiService();

  Future<void> accepted (String requestKey)async {
    final endPoint = "/api/service-request/$requestKey";
    final response = await api.postRequest(endPoint, {} );

  }

  Future<void> refuse (String requestKey)async {
    final endPoint = "/api/service-requests/$requestKey";
    final response = await api.postRequest(endPoint, {} );

  }

//  https://f295-45-242-203-114.ngrok-free.app/api/service-requests
}


// /api/service-request/
