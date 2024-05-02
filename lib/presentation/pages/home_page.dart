import 'dart:async';

import 'package:covid_app/presentation/controllers/home_page_controller.dart';
import 'package:covid_app/presentation/controllers/login_controller.dart';
import 'package:covid_app/presentation/providers/presentation_providers.dart';
import 'package:covid_app/presentation/widgets/covid_total_row_widget.dart';
import 'package:covid_app/presentation/widgets/floating_action_show_states.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../core/routes/routes.dart';

import '../../utils/contants.dart';
import '../widgets/device_info_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late Timer _timerDateTimeNow;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _timerDateTimeNow = Timer.periodic(Durations.extralong4, (timer) {
          ref.read(dateTimeProvider.notifier).state = DateTime.now();
        });
        ref.read(homePageControllerProvider.notifier).getCovidTotalData();
      },
    );
    super.initState();
  }

  void _logout() {
    ref.read(loginControllerProvider.notifier).logout();
    Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.loginRoute, (route) => route.settings.name == Routes.homeRoute);
  }

  @override
  void dispose() {
    super.dispose();
    _timerDateTimeNow.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var deviceInfo = ref.read(deviceInfoProvider);
    var homePageController = ref.watch(homePageControllerProvider);

    return PopScope(
      onPopInvoked: (value) {
        _logout();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: SizedBox(
          height: height,
          width: width,
          child: homePageController.when(
            data: (data) {
              if (data != null) {
                return Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Stack(
                        children: [
                          Center(
                            child: AspectRatio(
                              aspectRatio: 50 / 50,
                              child: Image.asset(Constants.homeImage),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: -27,
                            child: SizedBox(
                              width: width * 0.38,
                              height: height * 0.37,
                              child: Image.asset(
                                Constants.splashImage,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 25,
                            top: 50,
                            child: GestureDetector(
                              onTap: () {
                                _logout();
                              },
                              child: const Icon(
                                Icons.logout,
                                size: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: width,
                            height: height,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  30.0,
                                ),
                                topRight: Radius.circular(30.0),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height * 0.13,
                                  ),
                                  SizedBox(
                                    width: width,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20.0,
                                        left: 25.0,
                                        bottom: 20.0,
                                      ),
                                      child: Text(
                                        '${Constants.dateChecked} ${DateFormat('dd.MM.yyyy').format(
                                          DateTime.parse(data.dateChecked),
                                        )}',
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  CovidTotalRowWidget(
                                    primaryTitle:
                                        data.totalTestResults.toString(),
                                    primarySubtitle: Constants.totalCases,
                                    secondaryTitle:
                                        data.hospitalized.toString(),
                                    secondarySubtitle: Constants.hospitalized,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  CovidTotalRowWidget(
                                    primaryTitle: data.negative.toString(),
                                    primarySubtitle: Constants.negatives,
                                    secondaryTitle: data.positive.toString(),
                                    secondarySubtitle: Constants.positives,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  CovidTotalRowWidget(
                                    primaryTitle: data.death.toString(),
                                    primarySubtitle: Constants.totalDeaths,
                                    secondaryTitle: data.pending.toString(),
                                    secondarySubtitle: Constants.pending,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  CovidTotalRowWidget(
                                    primaryTitle:
                                        data.inIcuCurrently.toString(),
                                    primarySubtitle: Constants.inUci,
                                    secondaryTitle:
                                        data.onVentilatorCurrently.toString(),
                                    secondarySubtitle: Constants.onVentilator,
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 25.0,
                                    ),
                                    child: Text(
                                      Constants.disclaimer,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DeviceInfoWidget(
                            width: width,
                            height: height,
                            deviceInfo: deviceInfo,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.orange),
                    strokeWidth: 3,
                  ),
                );
              }
            },
            error: (error, stackTrace) => Center(
              child: Text('${Constants.error}${error.toString()}'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.orange),
                strokeWidth: 3,
              ),
            ),
          ),
        ),
        floatingActionButton: const FloatingShowStatesButton(),
      ),
    );
  }
}
