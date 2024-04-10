class CovidTotalData {
  CovidTotalData({
    required this.date,
    required this.states,
    required this.positive,
    required this.negative,
    required this.pending,
    required this.hospitalizedCurrently,
    required this.hospitalizedCumulative,
    required this.inIcuCurrently,
    required this.inIcuCumulative,
    required this.onVentilatorCurrently,
    required this.onVentilatorCumulative,
    required this.dateChecked,
    required this.death,
    required this.hospitalized,
    required this.totalTestResults,
    required this.lastModified,
    this.recovered,
    required this.total,
    required this.posNeg,
    required this.deathIncrease,
    required this.hospitalizedIncrease,
    required this.negativeIncrease,
    required this.positiveIncrease,
    required this.totalTestResultsIncrease,
    required this.hash,
  });
  late final int date;
  late final int states;
  late final int positive;
  late final int negative;
  late final int pending;
  late final int hospitalizedCurrently;
  late final int hospitalizedCumulative;
  late final int inIcuCurrently;
  late final int inIcuCumulative;
  late final int onVentilatorCurrently;
  late final int onVentilatorCumulative;
  late final String dateChecked;
  late final int death;
  late final int hospitalized;
  late final int totalTestResults;
  late final String lastModified;
  late final Null recovered;
  late final int total;
  late final int posNeg;
  late final int deathIncrease;
  late final int hospitalizedIncrease;
  late final int negativeIncrease;
  late final int positiveIncrease;
  late final int totalTestResultsIncrease;
  late final String hash;

  CovidTotalData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    states = json['states'];
    positive = json['positive'];
    negative = json['negative'];
    pending = json['pending'];
    hospitalizedCurrently = json['hospitalizedCurrently'];
    hospitalizedCumulative = json['hospitalizedCumulative'];
    inIcuCurrently = json['inIcuCurrently'];
    inIcuCumulative = json['inIcuCumulative'];
    onVentilatorCurrently = json['onVentilatorCurrently'];
    onVentilatorCumulative = json['onVentilatorCumulative'];
    dateChecked = json['dateChecked'];
    death = json['death'];
    hospitalized = json['hospitalized'];
    totalTestResults = json['totalTestResults'];
    lastModified = json['lastModified'];
    recovered = null;
    total = json['total'];
    posNeg = json['posNeg'];
    deathIncrease = json['deathIncrease'];
    hospitalizedIncrease = json['hospitalizedIncrease'];
    negativeIncrease = json['negativeIncrease'];
    positiveIncrease = json['positiveIncrease'];
    totalTestResultsIncrease = json['totalTestResultsIncrease'];
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['states'] = states;
    _data['positive'] = positive;
    _data['negative'] = negative;
    _data['pending'] = pending;
    _data['hospitalizedCurrently'] = hospitalizedCurrently;
    _data['hospitalizedCumulative'] = hospitalizedCumulative;
    _data['inIcuCurrently'] = inIcuCurrently;
    _data['inIcuCumulative'] = inIcuCumulative;
    _data['onVentilatorCurrently'] = onVentilatorCurrently;
    _data['onVentilatorCumulative'] = onVentilatorCumulative;
    _data['dateChecked'] = dateChecked;
    _data['death'] = death;
    _data['hospitalized'] = hospitalized;
    _data['totalTestResults'] = totalTestResults;
    _data['lastModified'] = lastModified;
    _data['recovered'] = recovered;
    _data['total'] = total;
    _data['posNeg'] = posNeg;
    _data['deathIncrease'] = deathIncrease;
    _data['hospitalizedIncrease'] = hospitalizedIncrease;
    _data['negativeIncrease'] = negativeIncrease;
    _data['positiveIncrease'] = positiveIncrease;
    _data['totalTestResultsIncrease'] = totalTestResultsIncrease;
    _data['hash'] = hash;
    return _data;
  }
}
