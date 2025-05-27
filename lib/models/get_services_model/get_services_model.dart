/// id : 1
/// name : "Ahmed Mohamed"
/// email : "ahmed@example.com"
/// mobile : "01012345678"
/// area : "Al Manakh District"
/// address : "123 Main Street"
/// execution_day : "2025-05-20"
/// requirements : "Simple plumbing work"
/// service : "Plumbing"
/// skill : "Pipe Installation"
/// price : "500 EGP"
/// request_key : "SPZNGXOJ"
/// status : "pending"
/// accepted_provider_id : null
/// created_at : "2025-05-12T23:51:47.000000Z"
/// updated_at : "2025-05-12T23:51:47.000000Z"
/// accepted_provider : null

class GetRequestServicesModel {
  GetRequestServicesModel({
      this.id, 
      this.name, 
      this.email, 
      this.mobile, 
      this.area, 
      this.address, 
      this.executionDay, 
      this.requirements, 
      this.service, 
      this.skill, 
      this.price, 
      this.requestKey, 
      this.status, 
      this.acceptedProviderId, 
      this.createdAt, 
      this.updatedAt, 
      this.acceptedProvider,});

  GetRequestServicesModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    area = json['area'];
    address = json['address'];
    executionDay = json['execution_day'];
    requirements = json['requirements'];
    service = json['service'];
    skill = json['skill'];
    price = json['price'];
    requestKey = json['request_key'];
    status = json['status'];
    acceptedProviderId = json['accepted_provider_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    acceptedProvider = json['accepted_provider'];
  }
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? area;
  String? address;
  String? executionDay;
  String? requirements;
  String? service;
  String? skill;
  String? price;
  String? requestKey;
  String? status;
  dynamic acceptedProviderId;
  String? createdAt;
  String? updatedAt;
  dynamic acceptedProvider;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['mobile'] = mobile;
    map['area'] = area;
    map['address'] = address;
    map['execution_day'] = executionDay;
    map['requirements'] = requirements;
    map['service'] = service;
    map['skill'] = skill;
    map['price'] = price;
    map['request_key'] = requestKey;
    map['status'] = status;
    map['accepted_provider_id'] = acceptedProviderId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['accepted_provider'] = acceptedProvider;
    return map;
  }

}