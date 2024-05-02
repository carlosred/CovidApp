// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_state_info_generated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CovidStateInfoGeneratedImpl _$$CovidStateInfoGeneratedImplFromJson(
        Map<String, dynamic> json) =>
    _$CovidStateInfoGeneratedImpl(
      state: json['state'] as String?,
      notes: json['notes'] as String?,
      covid19Site: json['covid19Site'] as String?,
      covid19SiteSecondary: json['covid19SiteSecondary'] as String?,
      covid19SiteTertiary: json['covid19SiteTertiary'] as String?,
      covid19SiteQuaternary: json['covid19SiteQuaternary'],
      covid19SiteQuinary: json['covid19SiteQuinary'],
      twitter: json['twitter'] as String?,
      covid19SiteOld: json['covid19SiteOld'] as String?,
      covidTrackingProjectPreferredTotalTestUnits:
          json['covidTrackingProjectPreferredTotalTestUnits'] as String?,
      covidTrackingProjectPreferredTotalTestField:
          json['covidTrackingProjectPreferredTotalTestField'] as String?,
      totalTestResultsField: json['totalTestResultsField'] as String?,
      pui: json['pui'] as String?,
      pum: json['pum'] as bool?,
      name: json['name'] as String?,
      fips: json['fips'] as String?,
    );

Map<String, dynamic> _$$CovidStateInfoGeneratedImplToJson(
        _$CovidStateInfoGeneratedImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'notes': instance.notes,
      'covid19Site': instance.covid19Site,
      'covid19SiteSecondary': instance.covid19SiteSecondary,
      'covid19SiteTertiary': instance.covid19SiteTertiary,
      'covid19SiteQuaternary': instance.covid19SiteQuaternary,
      'covid19SiteQuinary': instance.covid19SiteQuinary,
      'twitter': instance.twitter,
      'covid19SiteOld': instance.covid19SiteOld,
      'covidTrackingProjectPreferredTotalTestUnits':
          instance.covidTrackingProjectPreferredTotalTestUnits,
      'covidTrackingProjectPreferredTotalTestField':
          instance.covidTrackingProjectPreferredTotalTestField,
      'totalTestResultsField': instance.totalTestResultsField,
      'pui': instance.pui,
      'pum': instance.pum,
      'name': instance.name,
      'fips': instance.fips,
    };
