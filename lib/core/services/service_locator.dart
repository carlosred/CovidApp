import 'package:covid_app/data/blocs/auth_cubit.dart';
import 'package:covid_app/data/datasources/covid_http_client.dart';
import 'package:covid_app/data/datasources/local_data_client.dart';
import 'package:covid_app/data/repositories/covid_repository.dart';
import 'package:covid_app/data/repositories/login_repository.dart';
import 'package:covid_app/presentation/blocs/login_controller/login_controller_bloc.dart';
import 'package:covid_app/presentation/cubits/device_info_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton<DeviceInfoCubit>(DeviceInfoCubit());

  final localDataClient = getIt.registerSingleton<LocalDataClient>(
    LocalDataClient(),
  );
  final covidHttpClient = getIt.registerSingleton<CovidHttpClient>(
    CovidHttpClient(),
  );

  getIt.registerSingleton<AuthRepository>(
    AuthRepository(localDataClient: localDataClient),
  );

  getIt.registerSingleton<CovidRepository>(
    CovidRepository(covidHttpClient: covidHttpClient),
  );

  getIt.registerSingleton<AuthCubit>(
    AuthCubit(),
  );

  getIt.registerSingleton<LoginControllerCubit>(
    LoginControllerCubit(),
  );
}
