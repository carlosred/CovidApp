import 'package:covid_app/data/datasources/covid_http_client.dart';
import 'package:covid_app/data/datasources/local_data_client.dart';
import 'package:covid_app/data/repositories/covid_repository.dart';
import 'package:covid_app/data/repositories/login_repository.dart';

import 'package:riverpod/riverpod.dart';

var authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
    localDataClient: LocalDataClient(),
  ),
);

var covidRepositoryProvider = Provider<CovidRepository>(
  (ref) => CovidRepository(
    covidHttpClient: CovidHttpClient(),
  ),
);

var authProvider = StateProvider<bool>((ref) => false);
