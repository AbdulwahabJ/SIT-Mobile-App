class StaffModel {
  final String name;
  final String email;
  final String role;
  final String phoneNumber;
  final dynamic languages;
  final dynamic image;
  final dynamic token;

  StaffModel({
    required this.name,
    required this.email,
    required this.role,
    required this.phoneNumber,
    this.languages,
    this.image,
    this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'languages': languages,
      'image_path': image,
    };
  }

  factory StaffModel.fromJson(Map<String, dynamic> json) {
    return StaffModel(
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      phoneNumber: json['phone_number'] as String,
      languages: json['languages'] as dynamic,
      image: json['image'] as dynamic,
      token: json['token'] as dynamic,
    );
  }
}
