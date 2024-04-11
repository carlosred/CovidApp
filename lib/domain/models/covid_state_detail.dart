class CovidStateDetail {
  CovidStateDetail({
    required this.state,
    required this.notes,
    required this.covid19Site,
    required this.covid19SiteSecondary,
    required this.covid19SiteTertiary,
    this.covid19SiteQuaternary,
    this.covid19SiteQuinary,
    required this.twitter,
    required this.covid19SiteOld,
    required this.covidTrackingProjectPreferredTotalTestUnits,
    required this.covidTrackingProjectPreferredTotalTestField,
    required this.totalTestResultsField,
    required this.pui,
    required this.pum,
    required this.name,
    required this.fips,
  });
  late final String state;
  late final String notes;
  late final String covid19Site;
  late final String covid19SiteSecondary;
  late final String covid19SiteTertiary;
  late final Null covid19SiteQuaternary;
  late final Null covid19SiteQuinary;
  late final String twitter;
  late final String covid19SiteOld;
  late final String covidTrackingProjectPreferredTotalTestUnits;
  late final String covidTrackingProjectPreferredTotalTestField;
  late final String totalTestResultsField;
  late final String pui;
  late final bool pum;
  late final String name;
  late final String fips;

  CovidStateDetail.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    notes = json['notes'];
    covid19Site = json['covid19Site'];
    covid19SiteSecondary = json['covid19SiteSecondary'];
    covid19SiteTertiary = json['covid19SiteTertiary'];
    covid19SiteQuaternary = null;
    covid19SiteQuinary = null;
    twitter = json['twitter'];
    covid19SiteOld = json['covid19SiteOld'];
    covidTrackingProjectPreferredTotalTestUnits =
        json['covidTrackingProjectPreferredTotalTestUnits'];
    covidTrackingProjectPreferredTotalTestField =
        json['covidTrackingProjectPreferredTotalTestField'];
    totalTestResultsField = json['totalTestResultsField'];
    pui = json['pui'];
    pum = json['pum'];
    name = json['name'];
    fips = json['fips'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['state'] = state;
    data['notes'] = notes;
    data['covid19Site'] = covid19Site;
    data['covid19SiteSecondary'] = covid19SiteSecondary;
    data['covid19SiteTertiary'] = covid19SiteTertiary;
    data['covid19SiteQuaternary'] = covid19SiteQuaternary;
    data['covid19SiteQuinary'] = covid19SiteQuinary;
    data['twitter'] = twitter;
    data['covid19SiteOld'] = covid19SiteOld;
    data['covidTrackingProjectPreferredTotalTestUnits'] =
        covidTrackingProjectPreferredTotalTestUnits;
    data['covidTrackingProjectPreferredTotalTestField'] =
        covidTrackingProjectPreferredTotalTestField;
    data['totalTestResultsField'] = totalTestResultsField;
    data['pui'] = pui;
    data['pum'] = pum;
    data['name'] = name;
    data['fips'] = fips;
    return data;
  }
}
