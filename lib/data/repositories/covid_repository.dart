import 'package:covid_app/data/datasources/covid_http_client.dart';
import 'package:covid_app/domain/models/covid_total_data.dart';

class CovidRepository {
  final CovidHttpClient covidHttpClient;

  CovidRepository({
    required this.covidHttpClient,
  });

  Future<CovidTotalData?> getCovidTotalData() async {
    CovidTotalData? covidTotalData;

    try {
      var result = await covidHttpClient.getCovidTotalData();
      if (result != null) {
        covidTotalData = CovidTotalData.fromJson(result);
      }
    } catch (e) {
      covidTotalData = null;
    }
    return covidTotalData;
  }
}
