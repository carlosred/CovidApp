import 'dart:convert';

import 'package:equatable/equatable.dart';

class CovidGeneratedState extends Equatable {
  final int? date;
  final int? states;
  final int? positive;
  final int? negative;
  final int? pending;
  final int? hospitalizedCurrently;
  final int? hospitalizedCumulative;
  final int? inIcuCurrently;
  final int? inIcuCumulative;
  final int? onVentilatorCurrently;
  final int? onVentilatorCumulative;
  final String? dateChecked;
  final int? death;
  final int? hospitalized;
  final int? totalTestResults;
  final String? lastModified;
  final dynamic recovered;
  final int? total;
  final int? posNeg;
  final int? deathIncrease;
  final int? hospitalizedIncrease;
  final int? negativeIncrease;
  final int? positiveIncrease;
  final int? totalTestResultsIncrease;
  final String? hash;

  const CovidGeneratedState({
    this.date,
    this.states,
    this.positive,
    this.negative,
    this.pending,
    this.hospitalizedCurrently,
    this.hospitalizedCumulative,
    this.inIcuCurrently,
    this.inIcuCumulative,
    this.onVentilatorCurrently,
    this.onVentilatorCumulative,
    this.dateChecked,
    this.death,
    this.hospitalized,
    this.totalTestResults,
    this.lastModified,
    this.recovered,
    this.total,
    this.posNeg,
    this.deathIncrease,
    this.hospitalizedIncrease,
    this.negativeIncrease,
    this.positiveIncrease,
    this.totalTestResultsIncrease,
    this.hash,
  });

  factory CovidGeneratedState.fromMap(Map<String, dynamic> data) {
    return CovidGeneratedState(
      date: data['date'] as int?,
      states: data['states'] as int?,
      positive: data['positive'] as int?,
      negative: data['negative'] as int?,
      pending: data['pending'] as int?,
      hospitalizedCurrently: data['hospitalizedCurrently'] as int?,
      hospitalizedCumulative: data['hospitalizedCumulative'] as int?,
      inIcuCurrently: data['inIcuCurrently'] as int?,
      inIcuCumulative: data['inIcuCumulative'] as int?,
      onVentilatorCurrently: data['onVentilatorCurrently'] as int?,
      onVentilatorCumulative: data['onVentilatorCumulative'] as int?,
      dateChecked: data['dateChecked'] as String?,
      death: data['death'] as int?,
      hospitalized: data['hospitalized'] as int?,
      totalTestResults: data['totalTestResults'] as int?,
      lastModified: data['lastModified'] as String?,
      recovered: data['recovered'] as dynamic,
      total: data['total'] as int?,
      posNeg: data['posNeg'] as int?,
      deathIncrease: data['deathIncrease'] as int?,
      hospitalizedIncrease: data['hospitalizedIncrease'] as int?,
      negativeIncrease: data['negativeIncrease'] as int?,
      positiveIncrease: data['positiveIncrease'] as int?,
      totalTestResultsIncrease: data['totalTestResultsIncrease'] as int?,
      hash: data['hash'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'date': date,
        'states': states,
        'positive': positive,
        'negative': negative,
        'pending': pending,
        'hospitalizedCurrently': hospitalizedCurrently,
        'hospitalizedCumulative': hospitalizedCumulative,
        'inIcuCurrently': inIcuCurrently,
        'inIcuCumulative': inIcuCumulative,
        'onVentilatorCurrently': onVentilatorCurrently,
        'onVentilatorCumulative': onVentilatorCumulative,
        'dateChecked': dateChecked,
        'death': death,
        'hospitalized': hospitalized,
        'totalTestResults': totalTestResults,
        'lastModified': lastModified,
        'recovered': recovered,
        'total': total,
        'posNeg': posNeg,
        'deathIncrease': deathIncrease,
        'hospitalizedIncrease': hospitalizedIncrease,
        'negativeIncrease': negativeIncrease,
        'positiveIncrease': positiveIncrease,
        'totalTestResultsIncrease': totalTestResultsIncrease,
        'hash': hash,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CovidGeneratedState].
  factory CovidGeneratedState.fromJson(String data) {
    return CovidGeneratedState.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CovidGeneratedState] to a JSON string.
  String toJson() => json.encode(toMap());

  CovidGeneratedState copyWith({
    int? date,
    int? states,
    int? positive,
    int? negative,
    int? pending,
    int? hospitalizedCurrently,
    int? hospitalizedCumulative,
    int? inIcuCurrently,
    int? inIcuCumulative,
    int? onVentilatorCurrently,
    int? onVentilatorCumulative,
    String? dateChecked,
    int? death,
    int? hospitalized,
    int? totalTestResults,
    String? lastModified,
    dynamic recovered,
    int? total,
    int? posNeg,
    int? deathIncrease,
    int? hospitalizedIncrease,
    int? negativeIncrease,
    int? positiveIncrease,
    int? totalTestResultsIncrease,
    String? hash,
  }) {
    return CovidGeneratedState(
      date: date ?? this.date,
      states: states ?? this.states,
      positive: positive ?? this.positive,
      negative: negative ?? this.negative,
      pending: pending ?? this.pending,
      hospitalizedCurrently:
          hospitalizedCurrently ?? this.hospitalizedCurrently,
      hospitalizedCumulative:
          hospitalizedCumulative ?? this.hospitalizedCumulative,
      inIcuCurrently: inIcuCurrently ?? this.inIcuCurrently,
      inIcuCumulative: inIcuCumulative ?? this.inIcuCumulative,
      onVentilatorCurrently:
          onVentilatorCurrently ?? this.onVentilatorCurrently,
      onVentilatorCumulative:
          onVentilatorCumulative ?? this.onVentilatorCumulative,
      dateChecked: dateChecked ?? this.dateChecked,
      death: death ?? this.death,
      hospitalized: hospitalized ?? this.hospitalized,
      totalTestResults: totalTestResults ?? this.totalTestResults,
      lastModified: lastModified ?? this.lastModified,
      recovered: recovered ?? this.recovered,
      total: total ?? this.total,
      posNeg: posNeg ?? this.posNeg,
      deathIncrease: deathIncrease ?? this.deathIncrease,
      hospitalizedIncrease: hospitalizedIncrease ?? this.hospitalizedIncrease,
      negativeIncrease: negativeIncrease ?? this.negativeIncrease,
      positiveIncrease: positiveIncrease ?? this.positiveIncrease,
      totalTestResultsIncrease:
          totalTestResultsIncrease ?? this.totalTestResultsIncrease,
      hash: hash ?? this.hash,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      date,
      states,
      positive,
      negative,
      pending,
      hospitalizedCurrently,
      hospitalizedCumulative,
      inIcuCurrently,
      inIcuCumulative,
      onVentilatorCurrently,
      onVentilatorCumulative,
      dateChecked,
      death,
      hospitalized,
      totalTestResults,
      lastModified,
      recovered,
      total,
      posNeg,
      deathIncrease,
      hospitalizedIncrease,
      negativeIncrease,
      positiveIncrease,
      totalTestResultsIncrease,
      hash,
    ];
  }
}
