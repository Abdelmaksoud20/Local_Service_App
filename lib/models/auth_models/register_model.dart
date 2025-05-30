class RegisterModel {
  RegisterModel({
    this.name,
    this.email,
    this.phone,
    this.area,
    this.service,
    this.password,
    this.skillsList ,
  });

  RegisterModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    area = json['area'];
    service = json['service'];
    password = json['password'];

    skillsList = json['skills'] != null ? json['skills'].cast<String>() : [];

  }
  String? name;
  String? password;
  String? email;
  String? phone;
  String? area;
  String? service;

  List<String>? skillsList ;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['area'] = area;
    map['service'] = service;
    map['password'] = password;
    map["skills"] = skillsList;
    return map;
  }
}
