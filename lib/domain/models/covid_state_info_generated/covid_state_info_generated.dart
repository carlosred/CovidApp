import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'covid_state_info_generated.g.dart';

@JsonSerializable()
class CovidStateInfoGenerated {
  final String? state;
  final String? notes;
  final String? covid19Site;
  final String? covid19SiteSecondary;
  final String? covid19SiteTertiary;
  final dynamic covid19SiteQuaternary;
  final dynamic covid19SiteQuinary;
  final String? twitter;
  final String? covid19SiteOld;
  final String? covidTrackingProjectPreferredTotalTestUnits;
  final String? covidTrackingProjectPreferredTotalTestField;
  final String? totalTestResultsField;
  final String? pui;
  final bool? pum;
  final String? name;
  final String? fips;

  const CovidStateInfoGenerated({
    this.state,
    this.notes,
    this.covid19Site,
    this.covid19SiteSecondary,
    this.covid19SiteTertiary,
    this.covid19SiteQuaternary,
    this.covid19SiteQuinary,
    this.twitter,
    this.covid19SiteOld,
    this.covidTrackingProjectPreferredTotalTestUnits,
    this.covidTrackingProjectPreferredTotalTestField,
    this.totalTestResultsField,
    this.pui,
    this.pum,
    this.name,
    this.fips,
  });

  @override
  String toString() {
    return 'CovidStateInfoGenerated(state: $state, notes: $notes, covid19Site: $covid19Site, covid19SiteSecondary: $covid19SiteSecondary, covid19SiteTertiary: $covid19SiteTertiary, covid19SiteQuaternary: $covid19SiteQuaternary, covid19SiteQuinary: $covid19SiteQuinary, twitter: $twitter, covid19SiteOld: $covid19SiteOld, covidTrackingProjectPreferredTotalTestUnits: $covidTrackingProjectPreferredTotalTestUnits, covidTrackingProjectPreferredTotalTestField: $covidTrackingProjectPreferredTotalTestField, totalTestResultsField: $totalTestResultsField, pui: $pui, pum: $pum, name: $name, fips: $fips)';
  }

  factory CovidStateInfoGenerated.fromJson(Map<String, dynamic> json) {
    return _$CovidStateInfoGeneratedFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CovidStateInfoGeneratedToJson(this);

  CovidStateInfoGenerated copyWith({
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
  }) {
    return CovidStateInfoGenerated(
      state: state ?? this.state,
      notes: notes ?? this.notes,
      covid19Site: covid19Site ?? this.covid19Site,
      covid19SiteSecondary: covid19SiteSecondary ?? this.covid19SiteSecondary,
      covid19SiteTertiary: covid19SiteTertiary ?? this.covid19SiteTertiary,
      covid19SiteQuaternary:
          covid19SiteQuaternary ?? this.covid19SiteQuaternary,
      covid19SiteQuinary: covid19SiteQuinary ?? this.covid19SiteQuinary,
      twitter: twitter ?? this.twitter,
      covid19SiteOld: covid19SiteOld ?? this.covid19SiteOld,
      covidTrackingProjectPreferredTotalTestUnits:
          covidTrackingProjectPreferredTotalTestUnits ??
              this.covidTrackingProjectPreferredTotalTestUnits,
      covidTrackingProjectPreferredTotalTestField:
          covidTrackingProjectPreferredTotalTestField ??
              this.covidTrackingProjectPreferredTotalTestField,
      totalTestResultsField:
          totalTestResultsField ?? this.totalTestResultsField,
      pui: pui ?? this.pui,
      pum: pum ?? this.pum,
      name: name ?? this.name,
      fips: fips ?? this.fips,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CovidStateInfoGenerated) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      state.hashCode ^
      notes.hashCode ^
      covid19Site.hashCode ^
      covid19SiteSecondary.hashCode ^
      covid19SiteTertiary.hashCode ^
      covid19SiteQuaternary.hashCode ^
      covid19SiteQuinary.hashCode ^
      twitter.hashCode ^
      covid19SiteOld.hashCode ^
      covidTrackingProjectPreferredTotalTestUnits.hashCode ^
      covidTrackingProjectPreferredTotalTestField.hashCode ^
      totalTestResultsField.hashCode ^
      pui.hashCode ^
      pum.hashCode ^
      name.hashCode ^
      fips.hashCode;
}
