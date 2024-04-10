import 'package:covid_app/domain/models/covid_state_info.dart';

class CovidState {
  CovidState({
    required this.code,
  });
  late final String code;
  late final String name;
  late final CovidStateInfo covidStateInfo;

  CovidState.fromJson(Map<String, dynamic>? json) {
    code = json?['state'] ?? '';
    name = json?['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}
