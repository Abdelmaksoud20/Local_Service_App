class RequestModel {
  final String name;
  final String email;
  final String mobile;
  final String area;
  final String address;
  final String executionday;
  // final String requirements;
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

  // Map<String, String> toJson() =>
  //    {
  //     "name": name,
  //     "email": email,
  //     "mobile": mobile,
  //     "area": area,
  //     "address": address,
  //     "execution_day": executionday,
  //     "service": service,
  //     "skill": skill,
  //     "price": "$price EGP",
  //   };
  
}
