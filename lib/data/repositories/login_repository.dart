import 'package:covid_app/data/datasources/local_data_client.dart';

import '../../domain/auth/auth_data.dart';

class AuthRepository {
  final LocalDataClient localDataClient;

  AuthRepository({required this.localDataClient});

  Future<bool?> login({
    required String username,
    required String password,
  }) async {
    AuthData? authData;
    bool result = false;
    try {
      authData = await localDataClient.login();
      if (authData.password == password && authData.username == username) {
        result = true;
      }
    } catch (e) {
      result = false;
    }
    return result;
  }
}
