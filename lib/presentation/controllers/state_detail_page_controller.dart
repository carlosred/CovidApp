import 'package:covid_app/data/providers/data_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/services/service_locator.dart';
import '../../data/repositories/covid_repository.dart';
import '../../domain/models/covid_state_detail.dart';

part 'state_detail_page_controller.g.dart';

@Riverpod(keepAlive: true)
class StateDetailPageController extends _$StateDetailPageController {
  @override
  Future<CovidStateDetail?> build() async {
    return null;
  }

  Future<void> getCovidStateDetail({
    required String covidState,
  }) async {
    state = const AsyncLoading();
    try {
      var stateDetail = await getIt<CovidRepository>().getCovidStateDetail(
        state: covidState,
      );

      state = AsyncData(stateDetail);
    } catch (error, stack) {
      state = AsyncError(error, stack);
    }
  }
}
