import 'dart:convert';

import 'package:covid_app/domain/auth/auth_data.dart';
import 'package:flutter/services.dart';

class LocalDataClient {
  Future<AuthData> login() async {
    String jsonString =
        await rootBundle.loadString('assets/responses/login.json');
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    var result = AuthData.fromJson(jsonData);
    return result;
  }
}
