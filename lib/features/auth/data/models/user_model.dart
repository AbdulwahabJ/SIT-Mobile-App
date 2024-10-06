class User {
  final String email;
  final String name;
  final String token;
  final String phoneNumber;
  final int? groupId;

  User({
    required this.email,
    required this.name,
    required this.token,
    required this.phoneNumber,
    this.groupId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      phoneNumber: json['phone_number'] as String,
      groupId: json['group_id'] != null
          ? json['group_id'] as int
          : json['group_id'],
    );
  }
}
