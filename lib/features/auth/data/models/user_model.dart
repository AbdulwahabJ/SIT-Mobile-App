class User {
  final String email;
  final String name;
  final String token;

  User({
    required this.email,
    required this.name,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String,
      name: json['name'] as String,
      token: json['token'] as String,
    );
  }
}
