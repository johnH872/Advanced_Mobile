class WorkCalendarDetailEntity {
  final int? workCalendarDetailId;
  final int? workCalendarId;
  final String? from;
  final String? to;
  final String? description;
  final String? codeColor;
  final String? createdAt;
  final DateTime? updatedAt;
  
  WorkCalendarDetailEntity({
    this.workCalendarDetailId,
    this.workCalendarId,
    this.from,
    this.to,
    this.description,
    this.codeColor,
    this.createdAt,
    this.updatedAt,
  });
}
