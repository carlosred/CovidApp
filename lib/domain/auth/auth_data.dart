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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is AuthData &&
        other.password == password &&
        other.username == username;
  }

  @override
  int get hashCode => Object.hash(password, username);
}
