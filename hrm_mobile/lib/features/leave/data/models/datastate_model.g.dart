// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datastate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataStateModelImpl _$$DataStateModelImplFromJson(Map<String, dynamic> json) =>
    _$DataStateModelImpl(
      dataStateId: json['dataStateId'] as int?,
      dataStateName: json['dataStateName'] as String?,
      type: json['type'] as String?,
      colorCode: json['colorCode'] as String?,
      order: json['order'] as int?,
    );

Map<String, dynamic> _$$DataStateModelImplToJson(
        _$DataStateModelImpl instance) =>
    <String, dynamic>{
      'dataStateId': instance.dataStateId,
      'dataStateName': instance.dataStateName,
      'type': instance.type,
      'colorCode': instance.colorCode,
      'order': instance.order,
    };
