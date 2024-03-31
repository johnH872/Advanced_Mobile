// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaveTypeModelImpl _$$LeaveTypeModelImplFromJson(Map<String, dynamic> json) =>
    _$LeaveTypeModelImpl(
      leaveTypeId: json['leaveTypeId'] as int?,
      leaveTypeName: json['leaveTypeName'] as String?,
      defaultStartDay: json['defaultStartDay'] as int?,
      defaultStartMonth: json['defaultStartMonth'] as int?,
      defaultEndDay: json['defaultEndDay'] as int?,
      defaultEndMonth: json['defaultEndMonth'] as int?,
      defaultBudget: json['defaultBudget'] as int?,
      isPaidSalary: json['isPaidSalary'] as bool?,
    );

Map<String, dynamic> _$$LeaveTypeModelImplToJson(
        _$LeaveTypeModelImpl instance) =>
    <String, dynamic>{
      'leaveTypeId': instance.leaveTypeId,
      'leaveTypeName': instance.leaveTypeName,
      'defaultStartDay': instance.defaultStartDay,
      'defaultStartMonth': instance.defaultStartMonth,
      'defaultEndDay': instance.defaultEndDay,
      'defaultEndMonth': instance.defaultEndMonth,
      'defaultBudget': instance.defaultBudget,
      'isPaidSalary': instance.isPaidSalary,
    };
