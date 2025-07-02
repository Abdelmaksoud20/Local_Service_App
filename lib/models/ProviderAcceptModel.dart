/// message : "Request accepted successfully."
/// user : {"id":88,"provider_id":88,"name":"kaka ka k","email":"mad22@gmail.com","password":"123456789","phone":"12345678988","area":"Al Zohour District","service":"Air Conditioning Service","skills":["Air conditioning cleaning & summer maintenance","Air conditioning inspection","Charging Freon air conditioning","Dismantling and installing Air conditioning"],"photo":"images/profile1.jpeg","created_at":"2025-07-01T23:49:32.000000Z","updated_at":"2025-07-01T23:49:32.000000Z"}
/// request : {"id":154,"name":"abdo ahemd","email":"abdo22@gmail.com","mobile":"01012345678","area":"Al Manakh District","address":"123 Service Street","execution_day":"2025-07-20","requirements":null,"service":"Air Conditioning Service","skill":"Air conditioning inspection","price":"200-250 EGP","request_key":"FXXY852M","status":"accepted","accepted_provider_id":88,"created_at":"2025-07-02T01:49:54.000000Z","updated_at":"2025-07-02T01:50:12.000000Z"}

class ProviderAcceptModel {
  ProviderAcceptModel({
      this.message, 
      this.user, 
      this.request,});

  ProviderAcceptModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    request = json['request'] != null ? Request.fromJson(json['request']) : null;
  }
  String? message;
  User? user;
  Request? request;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (request != null) {
      map['request'] = request?.toJson();
    }
    return map;
  }

}

/// id : 154
/// name : "abdo ahemd"
/// email : "abdo22@gmail.com"
/// mobile : "01012345678"
/// area : "Al Manakh District"
/// address : "123 Service Street"
/// execution_day : "2025-07-20"
/// requirements : null
/// service : "Air Conditioning Service"
/// skill : "Air conditioning inspection"
/// price : "200-250 EGP"
/// request_key : "FXXY852M"
/// status : "accepted"
/// accepted_provider_id : 88
/// created_at : "2025-07-02T01:49:54.000000Z"
/// updated_at : "2025-07-02T01:50:12.000000Z"

class Request {
  Request({
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
      this.updatedAt,});

  Request.fromJson(dynamic json) {
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
  }
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? area;
  String? address;
  String? executionDay;
  dynamic requirements;
  String? service;
  String? skill;
  String? price;
  String? requestKey;
  String? status;
  int? acceptedProviderId;
  String? createdAt;
  String? updatedAt;

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
    return map;
  }

}

/// id : 88
/// provider_id : 88
/// name : "kaka ka k"
/// email : "mad22@gmail.com"
/// password : "123456789"
/// phone : "12345678988"
/// area : "Al Zohour District"
/// service : "Air Conditioning Service"
/// skills : ["Air conditioning cleaning & summer maintenance","Air conditioning inspection","Charging Freon air conditioning","Dismantling and installing Air conditioning"]
/// photo : "images/profile1.jpeg"
/// created_at : "2025-07-01T23:49:32.000000Z"
/// updated_at : "2025-07-01T23:49:32.000000Z"

class User {
  User({
      this.id, 
      this.providerId, 
      this.name, 
      this.email, 
      this.password, 
      this.phone, 
      this.area, 
      this.service, 
      this.skills, 
      this.photo, 
      this.createdAt, 
      this.updatedAt,});

  User.fromJson(dynamic json) {
    id = json['id'];
    providerId = json['provider_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    area = json['area'];
    service = json['service'];
    skills = json['skills'] != null ? json['skills'].cast<String>() : [];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? providerId;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? area;
  String? service;
  List<String>? skills;
  String? photo;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['provider_id'] = providerId;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['phone'] = phone;
    map['area'] = area;
    map['service'] = service;
    map['skills'] = skills;
    map['photo'] = photo;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}