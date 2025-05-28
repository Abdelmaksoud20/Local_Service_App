class FormModel {
  final String? firstName;
  final String? lastName;
  final String? userName;
  final String? email;
  final String? district;
  final String? serviceType;
  final String? skills;
  final String? phoneNumber;
  final String? password;
  bool? obscureText = true;
  bool? obscureTextConfirm = true;

  FormModel({
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.district,
    this.serviceType,
    this.skills,
    this.phoneNumber,
    this.password,
  });
}
