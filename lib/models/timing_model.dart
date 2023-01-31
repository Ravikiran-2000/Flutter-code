class TimingModel {
  TimingModel({
    this.code,
    this.day,
    this.period,
  });

  TimingModel.fromJson(dynamic json) {
    code = json['Code'];
    day = json['Day'];
    period = json['Period'];
  }

  String? code;
  String? day;
  String? period;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Code'] = code;
    map['Day'] = day;
    map['Period'] = period;
    return map;
  }
}
