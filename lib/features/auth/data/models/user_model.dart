class UserModel {
  final String email;
  final String name;
  final String token;
  final String phoneNumber;
  final dynamic groupId;
  final dynamic languages;
  final dynamic image;
  final String role;

  UserModel({
    this.languages,
    this.groupId,
    this.image,
    required this.name,
    required this.email,
    required this.token,
    required this.phoneNumber,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      phoneNumber: json['phone_number'] as String,
      role: json['role'] as String,
      groupId: json['group_id'],
      image: json['image'] as dynamic,
      languages: json['languages'] as dynamic,
    );
  }
}
