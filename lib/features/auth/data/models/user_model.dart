class UserModel {
  final String email;
  final String name;
  final String token;
  final String phoneNumber;
  final dynamic groupId;

  UserModel({
    required this.email,
    required this.name,
    required this.token,
    required this.phoneNumber,
    this.groupId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      phoneNumber: json['phone_number'] as String,
      groupId: json['group_id'] != null
          ? json['group_id'] as dynamic
          : json['group_id'],
    );
  }
  //  Map<String, String> getUserInfo() {
  //   return {
  //     'name': name,
  //     'email': email,
  //     'phoneNumber': phoneNumber,
  //   };
  // }
}
