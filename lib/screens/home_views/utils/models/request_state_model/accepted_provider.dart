class AcceptedProvider {
  String? name;

  AcceptedProvider({this.name});

  factory AcceptedProvider.fromJson(Map<String, dynamic> json) {
    return AcceptedProvider(name: json['name'] as String?);
  }

  Map<String, dynamic> toJson() => {'name': name};
}
