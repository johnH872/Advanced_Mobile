// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_mapping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilterMappingImpl _$$FilterMappingImplFromJson(Map<String, dynamic> json) =>
    _$FilterMappingImpl(
      filterType: $enumDecodeNullable(_$FilterTypeEnumMap, json['filterType']),
      value: json['value'] as String?,
      prop: json['prop'] as String?,
      dateRange: json['dateRange'] == null
          ? null
          : DateRangeModel.fromJson(json['dateRange'] as Map<String, dynamic>),
      operator: $enumDecodeNullable(_$FilterOperatorEnumMap, json['operator']),
    );

Map<String, dynamic> _$$FilterMappingImplToJson(_$FilterMappingImpl instance) =>
    <String, dynamic>{
      'filterType': _$FilterTypeEnumMap[instance.filterType],
      'value': instance.value,
      'prop': instance.prop,
      'dateRange': instance.dateRange,
      'operator': _$FilterOperatorEnumMap[instance.operator],
    };

const _$FilterTypeEnumMap = {
  FilterType.text: 'text',
  FilterType.boolean: 'boolean',
  FilterType.dateRange: 'dateRange',
  FilterType.custom: 'custom',
};

const _$FilterOperatorEnumMap = {
  FilterOperator.substring: 'substring',
  FilterOperator.contains: 'contains',
};
