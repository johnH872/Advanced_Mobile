// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_range_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DateRangeModel _$DateRangeModelFromJson(Map<String, dynamic> json) {
  return _DateRangeModel.fromJson(json);
}

/// @nodoc
mixin _$DateRangeModel {
  DateTime? get start => throw _privateConstructorUsedError;
  DateTime? get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DateRangeModelCopyWith<DateRangeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateRangeModelCopyWith<$Res> {
  factory $DateRangeModelCopyWith(
          DateRangeModel value, $Res Function(DateRangeModel) then) =
      _$DateRangeModelCopyWithImpl<$Res, DateRangeModel>;
  @useResult
  $Res call({DateTime? start, DateTime? end});
}

/// @nodoc
class _$DateRangeModelCopyWithImpl<$Res, $Val extends DateRangeModel>
    implements $DateRangeModelCopyWith<$Res> {
  _$DateRangeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateRangeModelImplCopyWith<$Res>
    implements $DateRangeModelCopyWith<$Res> {
  factory _$$DateRangeModelImplCopyWith(_$DateRangeModelImpl value,
          $Res Function(_$DateRangeModelImpl) then) =
      __$$DateRangeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? start, DateTime? end});
}

/// @nodoc
class __$$DateRangeModelImplCopyWithImpl<$Res>
    extends _$DateRangeModelCopyWithImpl<$Res, _$DateRangeModelImpl>
    implements _$$DateRangeModelImplCopyWith<$Res> {
  __$$DateRangeModelImplCopyWithImpl(
      _$DateRangeModelImpl _value, $Res Function(_$DateRangeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_$DateRangeModelImpl(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DateRangeModelImpl implements _DateRangeModel {
  const _$DateRangeModelImpl({this.start, this.end});

  factory _$DateRangeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DateRangeModelImplFromJson(json);

  @override
  final DateTime? start;
  @override
  final DateTime? end;

  @override
  String toString() {
    return 'DateRangeModel(start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateRangeModelImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateRangeModelImplCopyWith<_$DateRangeModelImpl> get copyWith =>
      __$$DateRangeModelImplCopyWithImpl<_$DateRangeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DateRangeModelImplToJson(
      this,
    );
  }
}

abstract class _DateRangeModel implements DateRangeModel {
  const factory _DateRangeModel({final DateTime? start, final DateTime? end}) =
      _$DateRangeModelImpl;

  factory _DateRangeModel.fromJson(Map<String, dynamic> json) =
      _$DateRangeModelImpl.fromJson;

  @override
  DateTime? get start;
  @override
  DateTime? get end;
  @override
  @JsonKey(ignore: true)
  _$$DateRangeModelImplCopyWith<_$DateRangeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
