import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrm_mobile/features/attendance/domain/entity/attendance_entity.dart';
part 'attendance_model.freezed.dart';
part 'attendance_model.g.dart';

@freezed
class AttendanceModel extends AttendanceEntity with _$AttendanceModel {
  const factory AttendanceModel({
    int? attendanceId,
    String? userId,
    DateTime? punchinDate,
    int? punchinTime,
    String? punchinNote,
    int? punchinOffset,
    DateTime? punchoutDate,
    int? punchoutTime,
    String? punchoutNote,
    int? punchoutOffset,
    DateTime? createdAt,
    DateTime? updatedAt,
    double? duration
  }) = _AttendanceModel;

  factory AttendanceModel.fromJson(Map<String, Object?> json) => _$AttendanceModelFromJson(json);

  factory AttendanceModel.fromEntity(AttendanceEntity entity) {
    return AttendanceModel(
      attendanceId: entity.attendanceId,
      userId: entity.userId,
      punchinDate: entity.punchinDate,
      punchinTime: entity.punchinTime,
      punchinNote: entity.punchinNote,
      punchinOffset: entity.punchinOffset,
      punchoutDate: entity.punchoutDate,
      punchoutTime: entity.punchoutTime,
      punchoutNote: entity.punchoutNote,
      punchoutOffset: entity.punchoutOffset,
      duration: entity.duration
    );
  }
}
