/// status : true
/// message : "Dashboard data retrieved successfully."
/// data : {"provider":{"id":17,"name":"Ramy Adham Sabri","email":"ramyas123@gmail.com","phone":"01122334455","area":"Al Zohour District","service":"Electrical Work Service","skills":["Wiring and Cabling Services","Installing and Maintaining Electrical Panels","Installing and Maintaining Lighting Systems","Installing and Maintaining Alarm and Home Security Systems"],"created_at":null,"updated_at":null},"service_requests":[{"id":72,"name":"MohamedAhmed Saber","email":"na9803436@gmail.com","mobile":"01026180967","area":"Al Zohour District","address":"El Amal street ,the hussen building,the second floor","execution_day":"2025-05-26","requirements":null,"service":"Electrical Work Service","skill":"Wiring and Cabling Services","price":"500-1500 $","request_key":"9E6AAAD2","status":"pending","accepted_provider_id":null,"created_at":"2025-05-24T20:57:08.000000Z","updated_at":"2025-05-24T20:57:08.000000Z"}],"top_provider_requests":[{"id":1,"provider_id":17,"name":"mohamed adham","email":"elghoulnada17@gmail.com","mobile":"01123235671","area":"Al-talatini District","Problem_Address":"amal street","execution_day":"2025-05-26","requirements":null,"service":"Electrical Work Service","skill":"Wiring and Cabling Services","price":"500-1500 $","service_provider":"Ramy Adham Sabri","request_key":"BCE671C8","status":"pending","created_at":"2025-05-24T21:13:37.000000Z","updated_at":"2025-05-24T21:13:37.000000Z"},{"id":2,"provider_id":17,"name":"maryam sief","email":"na9803436@gmail.com","mobile":"01026180967","area":"Al-talatini District","Problem_Address":"El Amal street ,the hussen building,the second floor","execution_day":"2025-05-26","requirements":null,"service":"Electrical Work Service","skill":"Wiring and Cabling Services","price":"500-1500 $","service_provider":"Ramy Adham Sabri","request_key":"3C3FEBE8","status":"pending","created_at":"2025-05-24T21:15:13.000000Z","updated_at":"2025-05-24T21:15:13.000000Z"}]}
library;

class GetProviderDashBoard {
  GetProviderDashBoard({
      this.status, 
      this.message, 
      this.data,});

  GetProviderDashBoard.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// provider : {"id":17,"name":"Ramy Adham Sabri","email":"ramyas123@gmail.com","phone":"01122334455","area":"Al Zohour District","service":"Electrical Work Service","skills":["Wiring and Cabling Services","Installing and Maintaining Electrical Panels","Installing and Maintaining Lighting Systems","Installing and Maintaining Alarm and Home Security Systems"],"created_at":null,"updated_at":null}
/// service_requests : [{"id":72,"name":"MohamedAhmed Saber","email":"na9803436@gmail.com","mobile":"01026180967","area":"Al Zohour District","address":"El Amal street ,the hussen building,the second floor","execution_day":"2025-05-26","requirements":null,"service":"Electrical Work Service","skill":"Wiring and Cabling Services","price":"500-1500 $","request_key":"9E6AAAD2","status":"pending","accepted_provider_id":null,"created_at":"2025-05-24T20:57:08.000000Z","updated_at":"2025-05-24T20:57:08.000000Z"}]
/// top_provider_requests : [{"id":1,"provider_id":17,"name":"mohamed adham","email":"elghoulnada17@gmail.com","mobile":"01123235671","area":"Al-talatini District","Problem_Address":"amal street","execution_day":"2025-05-26","requirements":null,"service":"Electrical Work Service","skill":"Wiring and Cabling Services","price":"500-1500 $","service_provider":"Ramy Adham Sabri","request_key":"BCE671C8","status":"pending","created_at":"2025-05-24T21:13:37.000000Z","updated_at":"2025-05-24T21:13:37.000000Z"},{"id":2,"provider_id":17,"name":"maryam sief","email":"na9803436@gmail.com","mobile":"01026180967","area":"Al-talatini District","Problem_Address":"El Amal street ,the hussen building,the second floor","execution_day":"2025-05-26","requirements":null,"service":"Electrical Work Service","skill":"Wiring and Cabling Services","price":"500-1500 $","service_provider":"Ramy Adham Sabri","request_key":"3C3FEBE8","status":"pending","created_at":"2025-05-24T21:15:13.000000Z","updated_at":"2025-05-24T21:15:13.000000Z"}]

class Data {
  Data({
      this.provider, 
      this.serviceRequests, 
      this.topProviderRequests,});

  Data.fromJson(dynamic json) {
    provider = json['provider'] != null ? Provider.fromJson(json['provider']) : null;
    if (json['service_requests'] != null) {
      serviceRequests = [];
      json['service_requests'].forEach((v) {
        serviceRequests?.add(ServiceRequests.fromJson(v));
      });
    }
    if (json['top_provider_requests'] != null) {
      topProviderRequests = [];
      json['top_provider_requests'].forEach((v) {
        topProviderRequests?.add(TopProviderRequests.fromJson(v));
      });
    }
  }
  Provider? provider;
  List<ServiceRequests>? serviceRequests;
  List<TopProviderRequests>? topProviderRequests;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (provider != null) {
      map['provider'] = provider?.toJson();
    }
    if (serviceRequests != null) {
      map['service_requests'] = serviceRequests?.map((v) => v.toJson()).toList();
    }
    if (topProviderRequests != null) {
      map['top_provider_requests'] = topProviderRequests?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// provider_id : 17
/// name : "mohamed adham"
/// email : "elghoulnada17@gmail.com"
/// mobile : "01123235671"
/// area : "Al-talatini District"
/// Problem_Address : "amal street"
/// execution_day : "2025-05-26"
/// requirements : null
/// service : "Electrical Work Service"
/// skill : "Wiring and Cabling Services"
/// price : "500-1500 $"
/// service_provider : "Ramy Adham Sabri"
/// request_key : "BCE671C8"
/// status : "pending"
/// created_at : "2025-05-24T21:13:37.000000Z"
/// updated_at : "2025-05-24T21:13:37.000000Z"

class TopProviderRequests {
  TopProviderRequests({
      this.id, 
      this.providerId, 
      this.name, 
      this.email, 
      this.mobile, 
      this.area, 
      this.problemAddress, 
      this.executionDay, 
      this.requirements, 
      this.service, 
      this.skill, 
      this.price, 
      this.serviceProvider, 
      this.requestKey, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  TopProviderRequests.fromJson(dynamic json) {
    id = json['id'];
    providerId = json['provider_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    area = json['area'];
    problemAddress = json['Problem_Address'];
    executionDay = json['execution_day'];
    requirements = json['requirements'];
    service = json['service'];
    skill = json['skill'];
    price = json['price'];
    serviceProvider = json['service_provider'];
    requestKey = json['request_key'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? providerId;
  String? name;
  String? email;
  String? mobile;
  String? area;
  String? problemAddress;
  String? executionDay;
  dynamic requirements;
  String? service;
  String? skill;
  String? price;
  String? serviceProvider;
  String? requestKey;
  String? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['provider_id'] = providerId;
    map['name'] = name;
    map['email'] = email;
    map['mobile'] = mobile;
    map['area'] = area;
    map['Problem_Address'] = problemAddress;
    map['execution_day'] = executionDay;
    map['requirements'] = requirements;
    map['service'] = service;
    map['skill'] = skill;
    map['price'] = price;
    map['service_provider'] = serviceProvider;
    map['request_key'] = requestKey;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 72
/// name : "MohamedAhmed Saber"
/// email : "na9803436@gmail.com"
/// mobile : "01026180967"
/// area : "Al Zohour District"
/// address : "El Amal street ,the hussen building,the second floor"
/// execution_day : "2025-05-26"
/// requirements : null
/// service : "Electrical Work Service"
/// skill : "Wiring and Cabling Services"
/// price : "500-1500 $"
/// request_key : "9E6AAAD2"
/// status : "pending"
/// accepted_provider_id : null
/// created_at : "2025-05-24T20:57:08.000000Z"
/// updated_at : "2025-05-24T20:57:08.000000Z"

class ServiceRequests {
  ServiceRequests({
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

  ServiceRequests.fromJson(dynamic json) {
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
  dynamic acceptedProviderId;
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

/// id : 17
/// name : "Ramy Adham Sabri"
/// email : "ramyas123@gmail.com"
/// phone : "01122334455"
/// area : "Al Zohour District"
/// service : "Electrical Work Service"
/// skills : ["Wiring and Cabling Services","Installing and Maintaining Electrical Panels","Installing and Maintaining Lighting Systems","Installing and Maintaining Alarm and Home Security Systems"]
/// created_at : null
/// updated_at : null

class Provider {
  Provider({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.area, 
      this.service, 
      this.skills, 
      this.createdAt, 
      this.updatedAt,});

  Provider.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    area = json['area'];
    service = json['service'];
    skills = json['skills'] != null ? json['skills'].cast<String>() : [];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? email;
  String? phone;
  String? area;
  String? service;
  List<String>? skills;
  dynamic createdAt;
  dynamic updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['area'] = area;
    map['service'] = service;
    map['skills'] = skills;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}