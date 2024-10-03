class User {
  final String email;
  final String name;
  final String token;
  final String? phoneNumber; // رقم الهاتف
  final String? code; // الرمز

  User({
    required this.email,
    required this.name,
    required this.token,
    required this.phoneNumber,
    required this.code,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String,
      name: json['name'] as String,
      token: json['token'] as String,
      phoneNumber:
          json['phone_number'] != null ? json['phone_number'] as String : null,
      code: json['code'] != null ? json['code'] as String : null,
    );
  }
}
