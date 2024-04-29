// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageModelImpl _$$PageModelImplFromJson(Map<String, dynamic> json) =>
    _$PageModelImpl(
      size: json['size'] as int?,
      pageNumber: json['pageNumber'] as int?,
      totalElement: json['totalElement'] as int?,
      userId: json['userId'] as String?,
      filter: (json['filter'] as List<dynamic>?)
          ?.map((e) => FilterMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      selected: (json['selected'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      roles: json['roles'] as List<dynamic>?,
    );

Map<String, dynamic> _$$PageModelImplToJson(_$PageModelImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'pageNumber': instance.pageNumber,
      'totalElement': instance.totalElement,
      'userId': instance.userId,
      'filter': instance.filter,
      'selected': instance.selected,
      'roles': instance.roles,
    };
