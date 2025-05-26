class PersonalInfoModel {
  final int? id;
  final String name;
  final String email;
  final String area;
  final dynamic phone;
  String? service;
 List<dynamic>? skills;

  PersonalInfoModel( {
    this.id,
    this.skills,
    this.service,
    required this.name,
    required this.email,
    required this.area,
    required this.phone,
  });
  factory PersonalInfoModel.formjson(data) {
    return PersonalInfoModel(
      id: data['provider']['profile']['id'],
      name: data['provider']['profile']['name'],
      email: data['provider']['profile']['email'],
      area: data['provider']['profile']['area'],
      phone: data['provider']['profile']['phone'],
      service: data["provider"]['profile']["service"],
      skills: data['provider']['profile']['skills']  is String
        ? [] // لو skills سترينج، نحوله لقائمة فاضية
        : List<String>.from(data['provider']['profile']['skills'] ?? []),
    );
  }
  factory PersonalInfoModel.formjsonUser(data) {
    return PersonalInfoModel(
      id: data['provider']['profile']['id'],
      name: data['provider']['profile']['name'],
      email: data['provider']['profile']['email'],
      area: data['provider']['profile']['area'],
      phone: data['provider']['profile']['phone'],
      skills:data['provider']['profile']['skills']  is String
        ? [] // لو skills سترينج، نحوله لقائمة فاضية
        : List<String>.from(data['provider']['profile']['skills'] ?? []),
    );
  }
  factory PersonalInfoModel.formjsonProviderData(data) {
    return PersonalInfoModel(
       id: data['user']['id'],
      name: data['user']['name'],
      email: data['user']['email'],
      area: data['user']['area'],
      phone: data['user']['phone'],
      service: data["user"]["service"],
      skills: data['user']['skills']  is String
        ? [] // لو skills سترينج، نحوله لقائمة فاضية
        : List<String>.from(data['user']['skills'] ?? []),
    );
  }
  factory PersonalInfoModel.formjsonUserData(data) {
    return PersonalInfoModel(
      id: data['user']['id'],
      name: data['user']['name'],
      email: data['user']['email'],
      area: data['user']['area'],
      phone: data['user']['phone'],
      skills: data['user']['skills']  is String
        ? [] // لو skills سترينج، نحوله لقائمة فاضية
        : List<String>.from(data['user']['skills'] ?? []), 
    );
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'area': area, 'phone': phone, 'service': service,
    'skills':skills ?? []
    };
  }
}
