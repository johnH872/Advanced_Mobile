// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaveRequestModel _$LeaveRequestModelFromJson(Map<String, dynamic> json) {
  return _LeaveRequestModel.fromJson(json);
}

/// @nodoc
mixin _$LeaveRequestModel {
  int? get leaveRequestId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  int? get leaveEntitlementId => throw _privateConstructorUsedError;
  DateTime? get leaveDateFrom => throw _privateConstructorUsedError;
  DateTime? get leaveDateTo => throw _privateConstructorUsedError;
  String? get session => throw _privateConstructorUsedError;
  double? get numberOfHour => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  DataStateModel? get DataState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveRequestModelCopyWith<LeaveRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveRequestModelCopyWith<$Res> {
  factory $LeaveRequestModelCopyWith(
          LeaveRequestModel value, $Res Function(LeaveRequestModel) then) =
      _$LeaveRequestModelCopyWithImpl<$Res, LeaveRequestModel>;
  @useResult
  $Res call(
      {int? leaveRequestId,
      String? userId,
      int? leaveEntitlementId,
      DateTime? leaveDateFrom,
      DateTime? leaveDateTo,
      String? session,
      double? numberOfHour,
      int? status,
      String? note,
      String? reason,
      DataStateModel? DataState});

  $DataStateModelCopyWith<$Res>? get DataState;
}

/// @nodoc
class _$LeaveRequestModelCopyWithImpl<$Res, $Val extends LeaveRequestModel>
    implements $LeaveRequestModelCopyWith<$Res> {
  _$LeaveRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leaveRequestId = freezed,
    Object? userId = freezed,
    Object? leaveEntitlementId = freezed,
    Object? leaveDateFrom = freezed,
    Object? leaveDateTo = freezed,
    Object? session = freezed,
    Object? numberOfHour = freezed,
    Object? status = freezed,
    Object? note = freezed,
    Object? reason = freezed,
    Object? DataState = freezed,
  }) {
    return _then(_value.copyWith(
      leaveRequestId: freezed == leaveRequestId
          ? _value.leaveRequestId
          : leaveRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      leaveEntitlementId: freezed == leaveEntitlementId
          ? _value.leaveEntitlementId
          : leaveEntitlementId // ignore: cast_nullable_to_non_nullable
              as int?,
      leaveDateFrom: freezed == leaveDateFrom
          ? _value.leaveDateFrom
          : leaveDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      leaveDateTo: freezed == leaveDateTo
          ? _value.leaveDateTo
          : leaveDateTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfHour: freezed == numberOfHour
          ? _value.numberOfHour
          : numberOfHour // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      DataState: freezed == DataState
          ? _value.DataState
          : DataState // ignore: cast_nullable_to_non_nullable
              as DataStateModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataStateModelCopyWith<$Res>? get DataState {
    if (_value.DataState == null) {
      return null;
    }

    return $DataStateModelCopyWith<$Res>(_value.DataState!, (value) {
      return _then(_value.copyWith(DataState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeaveRequestModelImplCopyWith<$Res>
    implements $LeaveRequestModelCopyWith<$Res> {
  factory _$$LeaveRequestModelImplCopyWith(_$LeaveRequestModelImpl value,
          $Res Function(_$LeaveRequestModelImpl) then) =
      __$$LeaveRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? leaveRequestId,
      String? userId,
      int? leaveEntitlementId,
      DateTime? leaveDateFrom,
      DateTime? leaveDateTo,
      String? session,
      double? numberOfHour,
      int? status,
      String? note,
      String? reason,
      DataStateModel? DataState});

  @override
  $DataStateModelCopyWith<$Res>? get DataState;
}

/// @nodoc
class __$$LeaveRequestModelImplCopyWithImpl<$Res>
    extends _$LeaveRequestModelCopyWithImpl<$Res, _$LeaveRequestModelImpl>
    implements _$$LeaveRequestModelImplCopyWith<$Res> {
  __$$LeaveRequestModelImplCopyWithImpl(_$LeaveRequestModelImpl _value,
      $Res Function(_$LeaveRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leaveRequestId = freezed,
    Object? userId = freezed,
    Object? leaveEntitlementId = freezed,
    Object? leaveDateFrom = freezed,
    Object? leaveDateTo = freezed,
    Object? session = freezed,
    Object? numberOfHour = freezed,
    Object? status = freezed,
    Object? note = freezed,
    Object? reason = freezed,
    Object? DataState = freezed,
  }) {
    return _then(_$LeaveRequestModelImpl(
      leaveRequestId: freezed == leaveRequestId
          ? _value.leaveRequestId
          : leaveRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      leaveEntitlementId: freezed == leaveEntitlementId
          ? _value.leaveEntitlementId
          : leaveEntitlementId // ignore: cast_nullable_to_non_nullable
              as int?,
      leaveDateFrom: freezed == leaveDateFrom
          ? _value.leaveDateFrom
          : leaveDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      leaveDateTo: freezed == leaveDateTo
          ? _value.leaveDateTo
          : leaveDateTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfHour: freezed == numberOfHour
          ? _value.numberOfHour
          : numberOfHour // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      DataState: freezed == DataState
          ? _value.DataState
          : DataState // ignore: cast_nullable_to_non_nullable
              as DataStateModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveRequestModelImpl implements _LeaveRequestModel {
  const _$LeaveRequestModelImpl(
      {this.leaveRequestId,
      this.userId,
      this.leaveEntitlementId,
      this.leaveDateFrom,
      this.leaveDateTo,
      this.session,
      this.numberOfHour,
      this.status,
      this.note,
      this.reason,
      this.DataState});

  factory _$LeaveRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveRequestModelImplFromJson(json);

  @override
  final int? leaveRequestId;
  @override
  final String? userId;
  @override
  final int? leaveEntitlementId;
  @override
  final DateTime? leaveDateFrom;
  @override
  final DateTime? leaveDateTo;
  @override
  final String? session;
  @override
  final double? numberOfHour;
  @override
  final int? status;
  @override
  final String? note;
  @override
  final String? reason;
  @override
  final DataStateModel? DataState;

  @override
  String toString() {
    return 'LeaveRequestModel(leaveRequestId: $leaveRequestId, userId: $userId, leaveEntitlementId: $leaveEntitlementId, leaveDateFrom: $leaveDateFrom, leaveDateTo: $leaveDateTo, session: $session, numberOfHour: $numberOfHour, status: $status, note: $note, reason: $reason, DataState: $DataState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveRequestModelImpl &&
            (identical(other.leaveRequestId, leaveRequestId) ||
                other.leaveRequestId == leaveRequestId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.leaveEntitlementId, leaveEntitlementId) ||
                other.leaveEntitlementId == leaveEntitlementId) &&
            (identical(other.leaveDateFrom, leaveDateFrom) ||
                other.leaveDateFrom == leaveDateFrom) &&
            (identical(other.leaveDateTo, leaveDateTo) ||
                other.leaveDateTo == leaveDateTo) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.numberOfHour, numberOfHour) ||
                other.numberOfHour == numberOfHour) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.DataState, DataState) ||
                other.DataState == DataState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      leaveRequestId,
      userId,
      leaveEntitlementId,
      leaveDateFrom,
      leaveDateTo,
      session,
      numberOfHour,
      status,
      note,
      reason,
      DataState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveRequestModelImplCopyWith<_$LeaveRequestModelImpl> get copyWith =>
      __$$LeaveRequestModelImplCopyWithImpl<_$LeaveRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveRequestModelImplToJson(
      this,
    );
  }
  
  @override
  set leaveDateFrom(DateTime? _leaveDateFrom) {
    // TODO: implement leaveDateFrom
  }
  
  @override
  set leaveDateTo(DateTime? _leaveDateTo) {
    // TODO: implement leaveDateTo
  }
  
  @override
  set leaveEntitlementId(int? _leaveEntitlementId) {
    // TODO: implement leaveEntitlementId
  }
  
  @override
  set leaveRequestId(int? _leaveRequestId) {
    // TODO: implement leaveRequestId
  }
  
  @override
  set note(String? _note) {
    // TODO: implement note
  }
  
  @override
  set numberOfHour(double? _numberOfHour) {
    // TODO: implement numberOfHour
  }
  
  @override
  set reason(String? _reason) {
    // TODO: implement reason
  }
  
  @override
  set session(String? _session) {
    // TODO: implement session
  }
  
  @override
  set status(int? _status) {
    // TODO: implement status
  }
  
  @override
  set userId(String? _userId) {
    // TODO: implement userId
  }
}

abstract class _LeaveRequestModel implements LeaveRequestModel {
  const factory _LeaveRequestModel(
      {final int? leaveRequestId,
      final String? userId,
      final int? leaveEntitlementId,
      final DateTime? leaveDateFrom,
      final DateTime? leaveDateTo,
      final String? session,
      final double? numberOfHour,
      final int? status,
      final String? note,
      final String? reason,
      final DataStateModel? DataState}) = _$LeaveRequestModelImpl;

  factory _LeaveRequestModel.fromJson(Map<String, dynamic> json) =
      _$LeaveRequestModelImpl.fromJson;

  @override
  int? get leaveRequestId;
  @override
  String? get userId;
  @override
  int? get leaveEntitlementId;
  @override
  DateTime? get leaveDateFrom;
  @override
  DateTime? get leaveDateTo;
  @override
  String? get session;
  @override
  double? get numberOfHour;
  @override
  int? get status;
  @override
  String? get note;
  @override
  String? get reason;
  @override
  DataStateModel? get DataState;
  @override
  @JsonKey(ignore: true)
  _$$LeaveRequestModelImplCopyWith<_$LeaveRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
