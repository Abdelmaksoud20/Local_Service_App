import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/screens/home_views/utils/models/request_state_model/request_state_model.dart';
import 'package:graduation_project/screens/request_view/utils/requests.dart';
part 'request_state_state.dart';

class RequestStateCubit extends Cubit<RequestStateState> {
  RequestStateCubit() : super(RequestStateInitial());
  final Requests data = Requests();
  final Map<int, List<RequestStateModel>> userRequests = {};

  Future<void> requestDetailsMethod({required int id, required int userId}) async {
    emit(RequestStateLoading());

    try {
      final response = await data.requestDetails(id: id); 
      final currentList = userRequests[userId] ?? [];

      // فحص إذا الطلب موجود
      final index = currentList.indexWhere((e) => e.id == response.id);
      if (index == -1) {
        currentList.add(response); // إضافة طلب جديد
      } else {
        currentList[index] = response; // تحديث الطلب الموجود
      }

      // تحديث بيانات المستخدم
      userRequests[userId] = currentList;

      // إرسال الحالة المحدثة فقط لهذا المستخدم
      emit(RequestStateLoaded(details: List.from(userRequests[userId]!)));
    } catch (e) {
      emit(RequestStateError(errMessage: e.toString()));
    }
  }

  // اختيارية: مسح طلبات مستخدم عند الـ Logout
  void clearUserRequests(int userId) {
    userRequests.remove(userId);
    emit(RequestStateInitial());
  }
}

