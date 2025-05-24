class PersonalInfoModel {
  final String name;
  final String email;
  final String area;
  final dynamic phone;
   String? service;

  PersonalInfoModel(
    {
    this.service,
    required this.name,
    required this.email,
    required this.area,
    required this.phone,
  });
  factory PersonalInfoModel.formjson(data) {
    return PersonalInfoModel(
      name: data['user']['name'],
      email: data['user']['email'],
      area: data['user']['area'],
      phone: data['user']['phone'],
        service: data["user"]["service"]
    );
  }
    Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'area': area,
      'phone': phone,
    };
  }

}
