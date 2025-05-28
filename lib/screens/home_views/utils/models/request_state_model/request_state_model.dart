import 'accepted_provider.dart';

class RequestStateModel {
  int? id;
  String? service;
  String? executionDay;
  AcceptedProvider? acceptedProvider;
  String? requestKey;
  String? status;
  int? acceptedProviderId;

  RequestStateModel({
    this.id,
    this.executionDay,
    this.service,
    this.requestKey,
    this.status,
    this.acceptedProviderId,
    this.acceptedProvider,
  });

  factory RequestStateModel.fromJson(Map<String, dynamic> json) {

    return RequestStateModel(
      id: json['id'] as int?,
      executionDay: json['execution_day'] as String?,
      service: json['service'] as String?,
      requestKey: json['request_key'] as String?,
      status: json['status'] as String?,
      acceptedProviderId: json['accepted_provider_id'] as int?,
      acceptedProvider:
          json['accepted_provider'] == null
              ? null
              : AcceptedProvider.fromJson(
                json['accepted_provider'] as Map<String, dynamic>,
              ),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'execution_day': executionDay,
    'service': service,
    'request_key': requestKey,
    'status': status,
    'accepted_provider_id': acceptedProviderId,
    'accepted_provider': acceptedProvider?.toJson(),
  };
}
