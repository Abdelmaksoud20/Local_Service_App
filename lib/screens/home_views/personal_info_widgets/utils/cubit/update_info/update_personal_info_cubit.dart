import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/screens/request_view/utils/requests.dart';
part 'update_personal_info_state.dart';

class UpdatePersonalInfoCubit extends Cubit<PersonalInfoUpdateState> {
  UpdatePersonalInfoCubit() : super(PersonalInfoInitialUpdate());
  Requests info = Requests();
  Future updatePesrsonalInfoMethod({
    required Map<String, dynamic> data,
    required int id,
  }) async {
    emit(PersonalInfoLoadingUpdate());
    try {
      var updatedData = await info.updateData(data: data, id: id);
      log('updatedData => $updatedData');
      emit(PersonalInfoLoadedUpdate(updatedData: updatedData));
    } catch (e) {
      emit(PersonalInfoErrorUpdate(errMessage: e.toString()));
    }
  }
}
