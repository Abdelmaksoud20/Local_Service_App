import 'package:dartz/dartz.dart';
import 'package:graduation_project/helper/failures.dart';

abstract class RequestRepo {
  Future<Either<Failures, Map<String, dynamic>>> requestData({required Map<String, dynamic> data});
}
