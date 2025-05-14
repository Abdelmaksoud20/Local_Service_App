part of 'request_cubit.dart';

sealed class RequestState extends Equatable {
  const RequestState();

  @override
  List<Object> get props => [];
}

final class RequestInitial extends RequestState {}

final class RequestLoading extends RequestState {}

final class RequestLoaded extends RequestState {
  final Map<String, dynamic> data;

  const RequestLoaded({required this.data});
}

final class Requesterror extends RequestState {
  final String err;

  const Requesterror({required this.err});
}
