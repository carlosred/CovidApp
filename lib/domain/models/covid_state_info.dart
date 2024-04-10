class CovidStateInfo {
  CovidStateInfo({
    required this.state,
    required this.positive,
    required this.lastUpdateEt,
  });

  late final String state;
  late final int positive;
  late final String lastUpdateEt;

  CovidStateInfo.fromJson(Map<String, dynamic> json) {
    state = json['state'] ?? '';
    positive = json['positive'] ?? '';
    lastUpdateEt = json['lastUpdateEt'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['state'] = state;
    data['positive'] = positive;
    data['lastUpdateEt'] = lastUpdateEt;

    return data;
  }
}
