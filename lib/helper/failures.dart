import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;
  const Failures(this.errMessage);
}

class ServerFailuer extends Failures {
  ServerFailuer(super.errMessage);
  factory ServerFailuer.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuer("Connection timeout With ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailuer("Send Timeout With ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailuer("Receive Timeout With ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailuer("badCertificate With ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailuer.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailuer("badCertificate With ApiServer");
      case DioExceptionType.connectionError:
        return ServerFailuer("internet Connection Error");
      case DioExceptionType.unknown:
        return ServerFailuer("Unexpected Error ,Please Try again");
      // default:
      //   return ServerFailuer("opps there was an error,please try again");
    }
  }
  factory ServerFailuer.fromResponse(
    int statusCode,
    Map<String, dynamic> response,
  ) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailuer(response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailuer("Requested resource could not be found. ");
    } else if (statusCode == 500) {
      return ServerFailuer("Intenal Server error , Please Try Later!");
    } else {
      return ServerFailuer("opps there wae an error,please try later!");
    }
  }
}
