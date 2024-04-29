class RangeDateValue {
  final DateTime? startDate;
  final DateTime? endDate;
  RangeDateValue({
    required this.startDate,
    required this.endDate,
  });

  factory RangeDateValue.fromJson(Map<String, dynamic> json) {
    return RangeDateValue(
      startDate: json['startDate'] as DateTime,
      endDate: json['endDate'] as DateTime
    );
  }

  Map<String, dynamic> toJson() {
    return {'startDate': startDate.toString(), 'endDate': endDate.toString()};
  }
}