// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaveRequestModelImpl _$$LeaveRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaveRequestModelImpl(
      leaveRequestId: json['leaveRequestId'] as int?,
      userId: json['userId'] as String?,
      leaveEntitlementId: json['leaveEntitlementId'] as int?,
      leaveDateFrom: json['leaveDateFrom'] == null
          ? null
          : DateTime.parse(json['leaveDateFrom'] as String),
      leaveDateTo: json['leaveDateTo'] == null
          ? null
          : DateTime.parse(json['leaveDateTo'] as String),
      session: json['session'] as String?,
      numberOfHour: (json['numberOfHour'] as num?)?.toDouble(),
      status: json['status'] as int?,
      note: json['note'] as String?,
      reason: json['reason'] as String?,
      DataState: json['DataState'] == null
          ? null
          : DataStateModel.fromJson(json['DataState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LeaveRequestModelImplToJson(
        _$LeaveRequestModelImpl instance) =>
    <String, dynamic>{
      'leaveRequestId': instance.leaveRequestId,
      'userId': instance.userId,
      'leaveEntitlementId': instance.leaveEntitlementId,
      'leaveDateFrom': instance.leaveDateFrom?.toIso8601String(),
      'leaveDateTo': instance.leaveDateTo?.toIso8601String(),
      'session': instance.session,
      'numberOfHour': instance.numberOfHour,
      'status': instance.status,
      'note': instance.note,
      'reason': instance.reason,
      'DataState': instance.DataState,
    };
