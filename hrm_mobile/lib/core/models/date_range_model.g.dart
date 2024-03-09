// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_range_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DateRangeModelImpl _$$DateRangeModelImplFromJson(Map<String, dynamic> json) =>
    _$DateRangeModelImpl(
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$$DateRangeModelImplToJson(
        _$DateRangeModelImpl instance) =>
    <String, dynamic>{
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
    };
