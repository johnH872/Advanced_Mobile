// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'datastate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataStateModel _$DataStateModelFromJson(Map<String, dynamic> json) {
  return _DataStateModel.fromJson(json);
}

/// @nodoc
mixin _$DataStateModel {
  int? get dataStateId => throw _privateConstructorUsedError;
  String? get dataStateName => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get colorCode => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataStateModelCopyWith<DataStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataStateModelCopyWith<$Res> {
  factory $DataStateModelCopyWith(
          DataStateModel value, $Res Function(DataStateModel) then) =
      _$DataStateModelCopyWithImpl<$Res, DataStateModel>;
  @useResult
  $Res call(
      {int? dataStateId,
      String? dataStateName,
      String? type,
      String? colorCode,
      int? order});
}

/// @nodoc
class _$DataStateModelCopyWithImpl<$Res, $Val extends DataStateModel>
    implements $DataStateModelCopyWith<$Res> {
  _$DataStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataStateId = freezed,
    Object? dataStateName = freezed,
    Object? type = freezed,
    Object? colorCode = freezed,
    Object? order = freezed,
  }) {
    return _then(_value.copyWith(
      dataStateId: freezed == dataStateId
          ? _value.dataStateId
          : dataStateId // ignore: cast_nullable_to_non_nullable
              as int?,
      dataStateName: freezed == dataStateName
          ? _value.dataStateName
          : dataStateName // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      colorCode: freezed == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataStateModelImplCopyWith<$Res>
    implements $DataStateModelCopyWith<$Res> {
  factory _$$DataStateModelImplCopyWith(_$DataStateModelImpl value,
          $Res Function(_$DataStateModelImpl) then) =
      __$$DataStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? dataStateId,
      String? dataStateName,
      String? type,
      String? colorCode,
      int? order});
}

/// @nodoc
class __$$DataStateModelImplCopyWithImpl<$Res>
    extends _$DataStateModelCopyWithImpl<$Res, _$DataStateModelImpl>
    implements _$$DataStateModelImplCopyWith<$Res> {
  __$$DataStateModelImplCopyWithImpl(
      _$DataStateModelImpl _value, $Res Function(_$DataStateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataStateId = freezed,
    Object? dataStateName = freezed,
    Object? type = freezed,
    Object? colorCode = freezed,
    Object? order = freezed,
  }) {
    return _then(_$DataStateModelImpl(
      dataStateId: freezed == dataStateId
          ? _value.dataStateId
          : dataStateId // ignore: cast_nullable_to_non_nullable
              as int?,
      dataStateName: freezed == dataStateName
          ? _value.dataStateName
          : dataStateName // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      colorCode: freezed == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataStateModelImpl implements _DataStateModel {
  const _$DataStateModelImpl(
      {this.dataStateId,
      this.dataStateName,
      this.type,
      this.colorCode,
      this.order});

  factory _$DataStateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataStateModelImplFromJson(json);

  @override
  final int? dataStateId;
  @override
  final String? dataStateName;
  @override
  final String? type;
  @override
  final String? colorCode;
  @override
  final int? order;

  @override
  String toString() {
    return 'DataStateModel(dataStateId: $dataStateId, dataStateName: $dataStateName, type: $type, colorCode: $colorCode, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataStateModelImpl &&
            (identical(other.dataStateId, dataStateId) ||
                other.dataStateId == dataStateId) &&
            (identical(other.dataStateName, dataStateName) ||
                other.dataStateName == dataStateName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, dataStateId, dataStateName, type, colorCode, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataStateModelImplCopyWith<_$DataStateModelImpl> get copyWith =>
      __$$DataStateModelImplCopyWithImpl<_$DataStateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataStateModelImplToJson(
      this,
    );
  }
}

abstract class _DataStateModel implements DataStateModel {
  const factory _DataStateModel(
      {final int? dataStateId,
      final String? dataStateName,
      final String? type,
      final String? colorCode,
      final int? order}) = _$DataStateModelImpl;

  factory _DataStateModel.fromJson(Map<String, dynamic> json) =
      _$DataStateModelImpl.fromJson;

  @override
  int? get dataStateId;
  @override
  String? get dataStateName;
  @override
  String? get type;
  @override
  String? get colorCode;
  @override
  int? get order;
  @override
  @JsonKey(ignore: true)
  _$$DataStateModelImplCopyWith<_$DataStateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
