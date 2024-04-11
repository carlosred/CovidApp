import 'package:covid_app/data/providers/data_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/covid_total_data.dart';

part 'home_page_controller.g.dart';

@Riverpod(keepAlive: true)
class HomePageController extends _$HomePageController {
  @override
  Future<CovidTotalData?> build() async {
    return null;
  }

  Future<void> getCovidTotalData() async {
    state = const AsyncLoading();
    try {
      var covidTotals =
          await ref.read(covidRepositoryProvider).getCovidTotalData();

      state = AsyncData(covidTotals);
    } catch (error, stack) {
      state = AsyncError(error, stack);
    }
  }
}
