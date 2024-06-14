import 'package:covid_app/domain/auth/auth_data.dart';

void main() {
  var auth1 = AuthData(username: 'test1', password: 'test');

  var auth2 = AuthData(username: 'test1', password: 'test');
  var auth3 = AuthData(username: 'test2', password: 'test');

  print(auth1 == auth3);
}
