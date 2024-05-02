import 'package:freezed_annotation/freezed_annotation.dart';

part 'covid_state_info_generated.freezed.dart';
part 'covid_state_info_generated.g.dart';

@freezed
class CovidStateInfoGenerated with _$CovidStateInfoGenerated {
  factory CovidStateInfoGenerated({
    String? state,
    String? notes,
    String? covid19Site,
    String? covid19SiteSecondary,
    String? covid19SiteTertiary,
    dynamic covid19SiteQuaternary,
    dynamic covid19SiteQuinary,
    String? twitter,
    String? covid19SiteOld,
    String? covidTrackingProjectPreferredTotalTestUnits,
    String? covidTrackingProjectPreferredTotalTestField,
    String? totalTestResultsField,
    String? pui,
    bool? pum,
    String? name,
    String? fips,
  }) = _CovidStateInfoGenerated;

  factory CovidStateInfoGenerated.fromJson(Map<String, dynamic> json) =>
      _$CovidStateInfoGeneratedFromJson(json);
}
