// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_entitlement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaveEntitlementModel _$LeaveEntitlementModelFromJson(
    Map<String, dynamic> json) {
  return _LeaveEntitlementModel.fromJson(json);
}

/// @nodoc
mixin _$LeaveEntitlementModel {
  int? get leaveEntitlementId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  int? get leaveTypeId => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  double? get availableLeave => throw _privateConstructorUsedError;
  double? get usableLeave => throw _privateConstructorUsedError;
  double? get usedLeave => throw _privateConstructorUsedError;
  int? get affectedYear => throw _privateConstructorUsedError;
  LeaveTypeModel? get LeaveType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveEntitlementModelCopyWith<LeaveEntitlementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveEntitlementModelCopyWith<$Res> {
  factory $LeaveEntitlementModelCopyWith(LeaveEntitlementModel value,
          $Res Function(LeaveEntitlementModel) then) =
      _$LeaveEntitlementModelCopyWithImpl<$Res, LeaveEntitlementModel>;
  @useResult
  $Res call(
      {int? leaveEntitlementId,
      String? userId,
      int? leaveTypeId,
      DateTime? startDate,
      DateTime? endDate,
      double? availableLeave,
      double? usableLeave,
      double? usedLeave,
      int? affectedYear,
      LeaveTypeModel? LeaveType});

  $LeaveTypeModelCopyWith<$Res>? get LeaveType;
}

/// @nodoc
class _$LeaveEntitlementModelCopyWithImpl<$Res,
        $Val extends LeaveEntitlementModel>
    implements $LeaveEntitlementModelCopyWith<$Res> {
  _$LeaveEntitlementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leaveEntitlementId = freezed,
    Object? userId = freezed,
    Object? leaveTypeId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? availableLeave = freezed,
    Object? usableLeave = freezed,
    Object? usedLeave = freezed,
    Object? affectedYear = freezed,
    Object? LeaveType = freezed,
  }) {
    return _then(_value.copyWith(
      leaveEntitlementId: freezed == leaveEntitlementId
          ? _value.leaveEntitlementId
          : leaveEntitlementId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      leaveTypeId: freezed == leaveTypeId
          ? _value.leaveTypeId
          : leaveTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      availableLeave: freezed == availableLeave
          ? _value.availableLeave
          : availableLeave // ignore: cast_nullable_to_non_nullable
              as double?,
      usableLeave: freezed == usableLeave
          ? _value.usableLeave
          : usableLeave // ignore: cast_nullable_to_non_nullable
              as double?,
      usedLeave: freezed == usedLeave
          ? _value.usedLeave
          : usedLeave // ignore: cast_nullable_to_non_nullable
              as double?,
      affectedYear: freezed == affectedYear
          ? _value.affectedYear
          : affectedYear // ignore: cast_nullable_to_non_nullable
              as int?,
      LeaveType: freezed == LeaveType
          ? _value.LeaveType
          : LeaveType // ignore: cast_nullable_to_non_nullable
              as LeaveTypeModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LeaveTypeModelCopyWith<$Res>? get LeaveType {
    if (_value.LeaveType == null) {
      return null;
    }

    return $LeaveTypeModelCopyWith<$Res>(_value.LeaveType!, (value) {
      return _then(_value.copyWith(LeaveType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeaveEntitlementModelImplCopyWith<$Res>
    implements $LeaveEntitlementModelCopyWith<$Res> {
  factory _$$LeaveEntitlementModelImplCopyWith(
          _$LeaveEntitlementModelImpl value,
          $Res Function(_$LeaveEntitlementModelImpl) then) =
      __$$LeaveEntitlementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? leaveEntitlementId,
      String? userId,
      int? leaveTypeId,
      DateTime? startDate,
      DateTime? endDate,
      double? availableLeave,
      double? usableLeave,
      double? usedLeave,
      int? affectedYear,
      LeaveTypeModel? LeaveType});

  @override
  $LeaveTypeModelCopyWith<$Res>? get LeaveType;
}

/// @nodoc
class __$$LeaveEntitlementModelImplCopyWithImpl<$Res>
    extends _$LeaveEntitlementModelCopyWithImpl<$Res,
        _$LeaveEntitlementModelImpl>
    implements _$$LeaveEntitlementModelImplCopyWith<$Res> {
  __$$LeaveEntitlementModelImplCopyWithImpl(_$LeaveEntitlementModelImpl _value,
      $Res Function(_$LeaveEntitlementModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leaveEntitlementId = freezed,
    Object? userId = freezed,
    Object? leaveTypeId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? availableLeave = freezed,
    Object? usableLeave = freezed,
    Object? usedLeave = freezed,
    Object? affectedYear = freezed,
    Object? LeaveType = freezed,
  }) {
    return _then(_$LeaveEntitlementModelImpl(
      leaveEntitlementId: freezed == leaveEntitlementId
          ? _value.leaveEntitlementId
          : leaveEntitlementId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      leaveTypeId: freezed == leaveTypeId
          ? _value.leaveTypeId
          : leaveTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      availableLeave: freezed == availableLeave
          ? _value.availableLeave
          : availableLeave // ignore: cast_nullable_to_non_nullable
              as double?,
      usableLeave: freezed == usableLeave
          ? _value.usableLeave
          : usableLeave // ignore: cast_nullable_to_non_nullable
              as double?,
      usedLeave: freezed == usedLeave
          ? _value.usedLeave
          : usedLeave // ignore: cast_nullable_to_non_nullable
              as double?,
      affectedYear: freezed == affectedYear
          ? _value.affectedYear
          : affectedYear // ignore: cast_nullable_to_non_nullable
              as int?,
      LeaveType: freezed == LeaveType
          ? _value.LeaveType
          : LeaveType // ignore: cast_nullable_to_non_nullable
              as LeaveTypeModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveEntitlementModelImpl implements _LeaveEntitlementModel {
  const _$LeaveEntitlementModelImpl(
      {this.leaveEntitlementId,
      this.userId,
      this.leaveTypeId,
      this.startDate,
      this.endDate,
      this.availableLeave,
      this.usableLeave,
      this.usedLeave,
      this.affectedYear,
      this.LeaveType});

  factory _$LeaveEntitlementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveEntitlementModelImplFromJson(json);

  @override
  final int? leaveEntitlementId;
  @override
  final String? userId;
  @override
  final int? leaveTypeId;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final double? availableLeave;
  @override
  final double? usableLeave;
  @override
  final double? usedLeave;
  @override
  final int? affectedYear;
  @override
  final LeaveTypeModel? LeaveType;

  @override
  String toString() {
    return 'LeaveEntitlementModel(leaveEntitlementId: $leaveEntitlementId, userId: $userId, leaveTypeId: $leaveTypeId, startDate: $startDate, endDate: $endDate, availableLeave: $availableLeave, usableLeave: $usableLeave, usedLeave: $usedLeave, affectedYear: $affectedYear, LeaveType: $LeaveType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveEntitlementModelImpl &&
            (identical(other.leaveEntitlementId, leaveEntitlementId) ||
                other.leaveEntitlementId == leaveEntitlementId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.leaveTypeId, leaveTypeId) ||
                other.leaveTypeId == leaveTypeId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.availableLeave, availableLeave) ||
                other.availableLeave == availableLeave) &&
            (identical(other.usableLeave, usableLeave) ||
                other.usableLeave == usableLeave) &&
            (identical(other.usedLeave, usedLeave) ||
                other.usedLeave == usedLeave) &&
            (identical(other.affectedYear, affectedYear) ||
                other.affectedYear == affectedYear) &&
            (identical(other.LeaveType, LeaveType) ||
                other.LeaveType == LeaveType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      leaveEntitlementId,
      userId,
      leaveTypeId,
      startDate,
      endDate,
      availableLeave,
      usableLeave,
      usedLeave,
      affectedYear,
      LeaveType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveEntitlementModelImplCopyWith<_$LeaveEntitlementModelImpl>
      get copyWith => __$$LeaveEntitlementModelImplCopyWithImpl<
          _$LeaveEntitlementModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveEntitlementModelImplToJson(
      this,
    );
  }
}

abstract class _LeaveEntitlementModel implements LeaveEntitlementModel {
  const factory _LeaveEntitlementModel(
      {final int? leaveEntitlementId,
      final String? userId,
      final int? leaveTypeId,
      final DateTime? startDate,
      final DateTime? endDate,
      final double? availableLeave,
      final double? usableLeave,
      final double? usedLeave,
      final int? affectedYear,
      final LeaveTypeModel? LeaveType}) = _$LeaveEntitlementModelImpl;

  factory _LeaveEntitlementModel.fromJson(Map<String, dynamic> json) =
      _$LeaveEntitlementModelImpl.fromJson;

  @override
  int? get leaveEntitlementId;
  @override
  String? get userId;
  @override
  int? get leaveTypeId;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  double? get availableLeave;
  @override
  double? get usableLeave;
  @override
  double? get usedLeave;
  @override
  int? get affectedYear;
  @override
  LeaveTypeModel? get LeaveType;
  @override
  @JsonKey(ignore: true)
  _$$LeaveEntitlementModelImplCopyWith<_$LeaveEntitlementModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
