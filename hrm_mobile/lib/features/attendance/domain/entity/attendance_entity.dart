class AttendanceEntity {
  final int? attendanceId;
  final String? userId;
  final DateTime? punchinDate;
  final int? punchinTime;
  final String? punchinNote;
  final int? punchinOffset;
  final DateTime? punchoutDate;
  final int? punchoutTime;
  final String? punchoutNote;
  final int? punchoutOffset;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  
  AttendanceEntity({
    this.attendanceId,
    this.userId,
    this.punchinDate,
    this.punchinTime,
    this.punchinNote,
    this.punchinOffset,
    this.punchoutDate,
    this.punchoutTime,
    this.punchoutNote,
    this.punchoutOffset,
    this.createdAt,
    this.updatedAt
  });
}
