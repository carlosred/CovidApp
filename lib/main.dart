import 'package:covid_app/data/blocs/auth_cubit.dart';
import 'package:covid_app/presentation/blocs/login_controller/login_controller_bloc.dart';
import 'package:covid_app/presentation/cubits/device_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/routes_generator.dart';

import 'core/services/service_locator.dart';
import 'utils/contants.dart';

void main() {
  serviceLocatorInit();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<DeviceInfoCubit>(
          create: (BuildContext context) => getIt<DeviceInfoCubit>(),
        ),
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => getIt<AuthCubit>(),
        ),
        BlocProvider<LoginControllerCubit>(
          create: (BuildContext context) => getIt<LoginControllerCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        dialogTheme: const DialogTheme(surfaceTintColor: Colors.white),
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
