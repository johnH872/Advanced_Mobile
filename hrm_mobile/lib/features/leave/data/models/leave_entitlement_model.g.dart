// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_entitlement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaveEntitlementModelImpl _$$LeaveEntitlementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaveEntitlementModelImpl(
      leaveEntitlementId: json['leaveEntitlementId'] as int?,
      userId: json['userId'] as String?,
      leaveTypeId: json['leaveTypeId'] as int?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      availableLeave: (json['availableLeave'] as num?)?.toDouble(),
      usableLeave: (json['usableLeave'] as num?)?.toDouble(),
      usedLeave: (json['usedLeave'] as num?)?.toDouble(),
      affectedYear: json['affectedYear'] as int?,
      LeaveType: json['LeaveType'] == null
          ? null
          : LeaveTypeModel.fromJson(json['LeaveType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LeaveEntitlementModelImplToJson(
        _$LeaveEntitlementModelImpl instance) =>
    <String, dynamic>{
      'leaveEntitlementId': instance.leaveEntitlementId,
      'userId': instance.userId,
      'leaveTypeId': instance.leaveTypeId,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'availableLeave': instance.availableLeave,
      'usableLeave': instance.usableLeave,
      'usedLeave': instance.usedLeave,
      'affectedYear': instance.affectedYear,
      'LeaveType': instance.LeaveType,
    };
