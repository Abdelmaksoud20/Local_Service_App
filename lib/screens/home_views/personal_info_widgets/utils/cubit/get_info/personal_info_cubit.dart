import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/personal_info_model.dart';
import 'package:graduation_project/screens/request_view/utils/requests.dart';
part 'personal_info_state.dart';

class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  PersonalInfoCubit() : super(PersonalInfoInitial());
  Requests info = Requests();
  Future personalInfoMethod({required int id}) async {
    try {
      emit(PersonalInfoLoading());
      var data = await info.personalInfo(id: id);
      emit(PersonalInfoLoaded(infoModel: data));
    } catch (e) {
      emit(PersonalInfoError(errMessage: e.toString()));
    }
  }
}
