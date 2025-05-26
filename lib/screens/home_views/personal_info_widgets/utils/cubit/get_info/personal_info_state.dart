part of 'personal_info_cubit.dart';

sealed class PersonalInfoState extends Equatable {
  const PersonalInfoState();

  @override
  List<Object> get props => [];
}

final class PersonalInfoInitial extends PersonalInfoState {}

final class PersonalInfoLoading extends PersonalInfoState {}

final class PersonalInfoLoaded extends PersonalInfoState {
  final PersonalInfoModel infoModel;

  const PersonalInfoLoaded({required this.infoModel});
}

final class PersonalInfoError extends PersonalInfoState {
  final String errMessage;

  const PersonalInfoError({required this.errMessage});
}
