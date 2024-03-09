// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagedData<T> _$PagedDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PagedData<T>(
      page: json['page'] == null
          ? null
          : PageModel.fromJson(json['page'] as Map<String, dynamic>),
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$PagedDataToJson<T>(
  PagedData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'page': instance.page,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
