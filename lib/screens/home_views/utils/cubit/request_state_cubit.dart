import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/screens/home_views/utils/models/request_state_model/request_state_model.dart';
import 'package:graduation_project/screens/request_view/utils/requests.dart';
part 'request_state_state.dart';

class RequestStateCubit extends Cubit<RequestStateState> {
  RequestStateCubit() : super(RequestStateInitial());
  Requests data = Requests();
  List<RequestStateModel> dataList = [];
  Future requestDetailsMethod({required int id}) async {
    emit(RequestStateLoading());
    try {
      final response = await data.requestDetails(id: id);

      final exists = dataList.any((element) => element.id == response.id);
      if (!exists) {
        dataList = List.from(dataList)..add(response); // ✅ نسخة جديدة
      } else {
        dataList =
            dataList.map((e) => e.id == response.id ? response : e).toList();
      }
      emit(RequestStateLoaded(details: [...dataList]));
    } catch (e) {
      emit(RequestStateError(errMessage: e.toString()));
    }
  }
}
