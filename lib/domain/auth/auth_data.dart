class AuthData {
  String username;
  String password;

  AuthData({
    required this.username,
    required this.password,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
