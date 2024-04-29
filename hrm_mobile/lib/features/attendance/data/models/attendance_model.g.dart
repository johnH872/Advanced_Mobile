// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceModelImpl _$$AttendanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceModelImpl(
      attendanceId: json['attendanceId'] as int?,
      userId: json['userId'] as String?,
      punchinDate: json['punchinDate'] == null
          ? null
          : DateTime.parse(json['punchinDate'] as String),
      punchinTime: json['punchinTime'] as int?,
      punchinNote: json['punchinNote'] as String?,
      punchinOffset: json['punchinOffset'] as int?,
      punchoutDate: json['punchoutDate'] == null
          ? null
          : DateTime.parse(json['punchoutDate'] as String),
      punchoutTime: json['punchoutTime'] as int?,
      punchoutNote: json['punchoutNote'] as String?,
      punchoutOffset: json['punchoutOffset'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      duration: (json['duration'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AttendanceModelImplToJson(
        _$AttendanceModelImpl instance) =>
    <String, dynamic>{
      'attendanceId': instance.attendanceId,
      'userId': instance.userId,
      'punchinDate': instance.punchinDate?.toIso8601String(),
      'punchinTime': instance.punchinTime,
      'punchinNote': instance.punchinNote,
      'punchinOffset': instance.punchinOffset,
      'punchoutDate': instance.punchoutDate?.toIso8601String(),
      'punchoutTime': instance.punchoutTime,
      'punchoutNote': instance.punchoutNote,
      'punchoutOffset': instance.punchoutOffset,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'duration': instance.duration,
    };
