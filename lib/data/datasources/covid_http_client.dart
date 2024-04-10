import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../utils/contants.dart';

class CovidHttpClient {
  Future<Map<String, dynamic>?> getCovidTotalData() async {
    Map<String, dynamic>? result;
    try {
      var url = Uri.https(
        Contants.baseApiUrl,
        Contants.homeUrl,
      );

      var response = await http.get(
        url,
      );

      if (response.statusCode == 200) {
        var responseList = jsonDecode(response.body) as List<dynamic>;
        result = responseList.first as Map<String, dynamic>;
      } else {
        log('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      log('Request failed with status: ${e.toString()}');
    }
    return result;
  }
}
