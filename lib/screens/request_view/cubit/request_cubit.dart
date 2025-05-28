import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/screens/request_view/utils/requests.dart';
part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestInitial());
  Requests data = Requests();
  sendDataRequestMethod({required Map<String, dynamic> senddata}) async {
    emit(RequestLoading());
    try {
      final response = await data.sendData(data: senddata);
      log(response.toString());
      emit(RequestLoaded(data: response));
    } catch (error) {
      log(error.toString());
      emit(Requesterror(err: error.toString()));
    }
  }
}
