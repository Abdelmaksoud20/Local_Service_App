// import 'package:dio/dio.dart';

// import 'dart:developer';

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/screens/request_view/bloc/bloc_event_request.dart';
import 'package:graduation_project/screens/request_view/utils/send_request_data.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestInitial());
  SendRequestdata data = SendRequestdata();

  sendDataRequest({required Map<String, dynamic> sdata}) async {
    // log(sdata.toString());
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
