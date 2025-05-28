import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/helper/failures.dart';
import 'package:graduation_project/screens/request_view/repo/request_repo.dart';

class RequestRepoImplmenetion implements RequestRepo {
  final Dio dio = Dio();
  @override
  Future<Either<Failures, Map<String, dynamic>>> requestData({
    required Map<String, dynamic> data,
  }) async {
    final String endPoint = 'https://f40e-45-242-203-114.ngrok-free.app';
    try {
      final String url = '$endPoint/api/service-requests';
      // log(data.toString());
      Response response = await dio.post(
        url,
        data: data,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(response.data);
      } else {
        throw Exception("Failed with status code: ${response.statusCode}");
      }
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailuer.fromDioException(error));
      }
      return left(ServerFailuer(error.toString()));
    }
  }
}
