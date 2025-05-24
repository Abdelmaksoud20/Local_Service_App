class PersonalInfoModel {
  final String name;
  final String email;
  final String area;
  final dynamic phone;

  PersonalInfoModel({
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
    );
  }
}
