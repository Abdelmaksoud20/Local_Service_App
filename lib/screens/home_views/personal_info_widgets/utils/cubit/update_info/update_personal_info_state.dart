part of 'update_personal_info_cubit.dart';

sealed class PersonalInfoUpdateState extends Equatable {
  const PersonalInfoUpdateState();

  @override
  List<Object> get props => [];
}

final class PersonalInfoInitialUpdate extends PersonalInfoUpdateState {}

final class PersonalInfoLoadingUpdate extends PersonalInfoUpdateState {}

final class PersonalInfoLoadedUpdate extends PersonalInfoUpdateState {
  final Map<String,dynamic> updatedData;

  const PersonalInfoLoadedUpdate({required this.updatedData});
}

final class PersonalInfoErrorUpdate extends PersonalInfoUpdateState {
  final String errMessage;

  const PersonalInfoErrorUpdate({required this.errMessage});
}
