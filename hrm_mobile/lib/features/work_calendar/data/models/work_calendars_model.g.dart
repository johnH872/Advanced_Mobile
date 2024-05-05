// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_calendars_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkCalendarsModelImpl _$$WorkCalendarsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkCalendarsModelImpl(
      workCalendarId: json['workCalendarId'] as int?,
      userId: json['userId'] as String?,
      workingDate: json['workingDate'] == null
          ? null
          : DateTime.parse(json['workingDate'] as String),
      workingType: json['workingType'] as int?,
      workingHour: (json['workingHour'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      WorkCalendarDetails: (json['WorkCalendarDetails'] as List<dynamic>?)
          ?.map((e) =>
              WorkCalendarDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkCalendarsModelImplToJson(
        _$WorkCalendarsModelImpl instance) =>
    <String, dynamic>{
      'workCalendarId': instance.workCalendarId,
      'userId': instance.userId,
      'workingDate': instance.workingDate?.toIso8601String(),
      'workingType': instance.workingType,
      'workingHour': instance.workingHour,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'WorkCalendarDetails': instance.WorkCalendarDetails,
    };
