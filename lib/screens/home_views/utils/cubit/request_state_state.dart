part of 'request_state_cubit.dart';

sealed class RequestStateState extends Equatable {
  const RequestStateState();
  
  @override
  List<Object> get props => [];
}

final class RequestStateInitial extends RequestStateState {}

final class RequestStateLoading extends RequestStateState {}

final class RequestStateLoaded extends RequestStateState {
  final List<RequestStateModel> details;

  const RequestStateLoaded({required this.details});
}

final class RequestStateError extends RequestStateState {
  final String errMessage;

  const RequestStateError({required this.errMessage});
}
