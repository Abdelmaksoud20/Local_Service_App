import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/screens/request_view/repo/request_repo.dart';
import 'package:graduation_project/screens/request_view/utils/send_request_data.dart';
part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestInitial());
  SendRequestdata data = SendRequestdata();
  sendDataRequest({required Map<String, dynamic> sdata}) async {
    emit(RequestLoading());
    try {
      final response = await data.sendData(data: sdata);
      emit(RequestLoaded(data: response));
    } catch (error) {
      log(error.toString());
      emit(Requesterror(err: error.toString()));
    }
  }
}

class RequestCubitRepo extends Cubit<RequestState> {
  RequestCubitRepo(this.repo) : super(RequestInitial());
  final RequestRepo repo;
  sendDataRequest({required Map<String, dynamic> sdata}) async {
    emit(RequestLoading());
      final response = await repo.requestData(data: sdata);
      response.fold(
      (failuer) {
      emit(Requesterror(err: failuer.errMessage));
    }, (data) {
      emit(RequestLoaded(data: data));
    });
    
  }
}
