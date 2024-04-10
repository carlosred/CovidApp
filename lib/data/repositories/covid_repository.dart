import 'package:covid_app/data/datasources/covid_http_client.dart';
import 'package:covid_app/domain/models/covid_state_info.dart';
import 'package:covid_app/domain/models/covid_total_data.dart';
import 'package:covid_app/domain/models/covid_state.dart';

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

  Future<List<CovidState>?> getCovidStates() async {
    List<CovidState>? covidStates;

    try {
      var result = await covidHttpClient.getStatesCodes();
      covidStates = result?.map((state) => CovidState.fromJson(state)).toList();
    } catch (e) {
      covidStates = null;
    }
    return covidStates;
  }

  Future<List<CovidStateInfo>?> getCovidStatesInfo() async {
    List<CovidStateInfo>? covidStatesInfo;

    try {
      var result = await covidHttpClient.getStatesInfo();
      covidStatesInfo =
          result?.map((info) => CovidStateInfo.fromJson(info)).toList();
    } catch (e) {
      covidStatesInfo = null;
    }
    return covidStatesInfo;
  }
}
