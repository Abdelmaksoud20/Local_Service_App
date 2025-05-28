
import '../models/get_services_model/get_provider_dash_board.dart';
import 'api_service.dart';

class ProviderDashBoardService {
  Future<GetProviderDashBoard> getProviderDashboard() async {
    final ApiService api = ApiService();
    final endPoint = "/api/dashboard";
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

