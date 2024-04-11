import 'package:covid_app/data/providers/data_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'states_page_controller.g.dart';

@Riverpod(keepAlive: true)
class StatesPageController extends _$StatesPageController {
  @override
  Future<List<Map<String, dynamic>>?> build() async {
    return null;
  }

  Future<void> getCovidStates() async {
    state = const AsyncLoading();
    try {
      var result = <Map<String, dynamic>>[];
      var covidStates =
          await ref.read(covidRepositoryProvider).getCovidStates();
      var covidStatesInfo =
          await ref.read(covidRepositoryProvider).getCovidStatesInfo();
      if (covidStates != null && covidStatesInfo != null) {
        for (var covidStateInfo in covidStatesInfo) {
          for (var covidState in covidStates) {
            if (covidStateInfo.state == covidState.code) {
              result.add({
                'code': covidState.code,
                'name': covidState.name,
                'positive': covidStateInfo.positive,
                'lastUpdated': covidStateInfo.lastUpdateEt,
              });
            }
          }
        }
      }

      state = AsyncData(result);
    } catch (error, stack) {
      state = AsyncError(error, stack);
    }
  }
}
