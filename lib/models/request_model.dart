class RequestModel {
  final String name;
  final String email;
  final String mobile;
  final String area;
  final String address;
  final String executionday;
  final String service;
  final String skill;
  final String price;

  const RequestModel({
    required this.name,
    required this.email,
    required this.mobile,
    required this.area,
    required this.address,
    required this.executionday,
    required this.service,
    required this.skill,
    required this.price,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
      area: json['area'] ?? '',
      address: json['address'] ?? '',
      executionday: json['execution_day'] ?? '',
      service: json['service'] ?? '',
      skill: json['skill'] ?? '',
      price: json['price'] ?? '',
    );
  }
  Map<String, String> toJson() => {
    "name": name,
    "email": email,
    "mobile": mobile,
    "area": area,
    "address": address,
    "execution_day": executionday,
    "service": service,
    "skill": skill,
    "price": "$price EGP",
  };
}
