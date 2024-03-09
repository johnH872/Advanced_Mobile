// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_mapping.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FilterMapping _$FilterMappingFromJson(Map<String, dynamic> json) {
  return _FilterMapping.fromJson(json);
}

/// @nodoc
mixin _$FilterMapping {
  FilterType? get filterType => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String? get prop => throw _privateConstructorUsedError;
  DateRangeModel? get dateRange => throw _privateConstructorUsedError;
  FilterOperator? get operator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilterMappingCopyWith<FilterMapping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterMappingCopyWith<$Res> {
  factory $FilterMappingCopyWith(
          FilterMapping value, $Res Function(FilterMapping) then) =
      _$FilterMappingCopyWithImpl<$Res, FilterMapping>;
  @useResult
  $Res call(
      {FilterType? filterType,
      String? value,
      String? prop,
      DateRangeModel? dateRange,
      FilterOperator? operator});

  $DateRangeModelCopyWith<$Res>? get dateRange;
}

/// @nodoc
class _$FilterMappingCopyWithImpl<$Res, $Val extends FilterMapping>
    implements $FilterMappingCopyWith<$Res> {
  _$FilterMappingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterType = freezed,
    Object? value = freezed,
    Object? prop = freezed,
    Object? dateRange = freezed,
    Object? operator = freezed,
  }) {
    return _then(_value.copyWith(
      filterType: freezed == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as FilterType?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      prop: freezed == prop
          ? _value.prop
          : prop // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRange: freezed == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateRangeModel?,
      operator: freezed == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as FilterOperator?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DateRangeModelCopyWith<$Res>? get dateRange {
    if (_value.dateRange == null) {
      return null;
    }

    return $DateRangeModelCopyWith<$Res>(_value.dateRange!, (value) {
      return _then(_value.copyWith(dateRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FilterMappingImplCopyWith<$Res>
    implements $FilterMappingCopyWith<$Res> {
  factory _$$FilterMappingImplCopyWith(
          _$FilterMappingImpl value, $Res Function(_$FilterMappingImpl) then) =
      __$$FilterMappingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FilterType? filterType,
      String? value,
      String? prop,
      DateRangeModel? dateRange,
      FilterOperator? operator});

  @override
  $DateRangeModelCopyWith<$Res>? get dateRange;
}

/// @nodoc
class __$$FilterMappingImplCopyWithImpl<$Res>
    extends _$FilterMappingCopyWithImpl<$Res, _$FilterMappingImpl>
    implements _$$FilterMappingImplCopyWith<$Res> {
  __$$FilterMappingImplCopyWithImpl(
      _$FilterMappingImpl _value, $Res Function(_$FilterMappingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterType = freezed,
    Object? value = freezed,
    Object? prop = freezed,
    Object? dateRange = freezed,
    Object? operator = freezed,
  }) {
    return _then(_$FilterMappingImpl(
      filterType: freezed == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as FilterType?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      prop: freezed == prop
          ? _value.prop
          : prop // ignore: cast_nullable_to_non_nullable
              as String?,
      dateRange: freezed == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateRangeModel?,
      operator: freezed == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as FilterOperator?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterMappingImpl implements _FilterMapping {
  const _$FilterMappingImpl(
      {this.filterType, this.value, this.prop, this.dateRange, this.operator});

  factory _$FilterMappingImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterMappingImplFromJson(json);

  @override
  final FilterType? filterType;
  @override
  final String? value;
  @override
  final String? prop;
  @override
  final DateRangeModel? dateRange;
  @override
  final FilterOperator? operator;

  @override
  String toString() {
    return 'FilterMapping(filterType: $filterType, value: $value, prop: $prop, dateRange: $dateRange, operator: $operator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterMappingImpl &&
            (identical(other.filterType, filterType) ||
                other.filterType == filterType) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.prop, prop) || other.prop == prop) &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange) &&
            (identical(other.operator, operator) ||
                other.operator == operator));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, filterType, value, prop, dateRange, operator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterMappingImplCopyWith<_$FilterMappingImpl> get copyWith =>
      __$$FilterMappingImplCopyWithImpl<_$FilterMappingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterMappingImplToJson(
      this,
    );
  }
}

abstract class _FilterMapping implements FilterMapping {
  const factory _FilterMapping(
      {final FilterType? filterType,
      final String? value,
      final String? prop,
      final DateRangeModel? dateRange,
      final FilterOperator? operator}) = _$FilterMappingImpl;

  factory _FilterMapping.fromJson(Map<String, dynamic> json) =
      _$FilterMappingImpl.fromJson;

  @override
  FilterType? get filterType;
  @override
  String? get value;
  @override
  String? get prop;
  @override
  DateRangeModel? get dateRange;
  @override
  FilterOperator? get operator;
  @override
  @JsonKey(ignore: true)
  _$$FilterMappingImplCopyWith<_$FilterMappingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
