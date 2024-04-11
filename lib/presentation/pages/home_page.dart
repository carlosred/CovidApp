import 'package:covid_app/presentation/controllers/home_page_controller.dart';
import 'package:covid_app/presentation/widgets/covid_total_row_widget.dart';
import 'package:covid_app/presentation/widgets/floating_action_show_states.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../widgets/device_info_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(homePageControllerProvider.notifier).getCovidTotalData(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    var homePageController = ref.watch(homePageControllerProvider);

    return Scaffold(
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
                            child: Image.asset('assets/images/home.jpg'),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: -27,
                          child: SizedBox(
                            width: width * 0.38,
                            height: height * 0.37,
                            child: Image.asset(
                              'assets/images/splash.webp',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const Positioned(
                          right: 25,
                          top: 50,
                          child: Icon(
                            Icons.logout,
                            size: 35,
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
                                  topRight: Radius.circular(30.0))),
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
                                      'Fecha Recolección Datos: ${DateFormat('dd.MM.yyyy').format(
                                        DateTime.parse(data.dateChecked),
                                      )}',
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                                CovidTotalRowWidget(
                                  primaryTitle:
                                      data.totalTestResults.toString(),
                                  primarySubtitle: 'Casos totales',
                                  secondaryTitle: data.hospitalized.toString(),
                                  secondarySubtitle: 'Hospitalizados',
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                CovidTotalRowWidget(
                                  primaryTitle: data.negative.toString(),
                                  primarySubtitle: 'Pruebas negativas',
                                  secondaryTitle: data.positive.toString(),
                                  secondarySubtitle: 'Pruebas positivas',
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                CovidTotalRowWidget(
                                  primaryTitle: data.death.toString(),
                                  primarySubtitle: 'Fallecidos',
                                  secondaryTitle: data.pending.toString(),
                                  secondarySubtitle: 'Pendientes',
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                CovidTotalRowWidget(
                                  primaryTitle: data.inIcuCurrently.toString(),
                                  primarySubtitle: 'En UCI',
                                  secondaryTitle:
                                      data.onVentilatorCurrently.toString(),
                                  secondarySubtitle: 'Con ventiladores',
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
                                    'El proyecto COVID Tracking ha finalizado toda recopilación de datos a partir del 7 de marzo de 2021',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        DeviceInfoWidget(
                          width: width,
                          height: height,
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
            child: Text('error:$error'),
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
    );
  }
}
