// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_calendar_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkCalendarDetailModelImpl _$$WorkCalendarDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkCalendarDetailModelImpl(
      workCalendarDetailId: json['workCalendarDetailId'] as int?,
      workCalendarId: json['workCalendarId'] as int?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      description: json['description'] as String?,
      codeColor: json['codeColor'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$WorkCalendarDetailModelImplToJson(
        _$WorkCalendarDetailModelImpl instance) =>
    <String, dynamic>{
      'workCalendarDetailId': instance.workCalendarDetailId,
      'workCalendarId': instance.workCalendarId,
      'from': instance.from,
      'to': instance.to,
      'description': instance.description,
      'codeColor': instance.codeColor,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
