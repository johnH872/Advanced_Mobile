import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrm_mobile/features/leave/domain/entity/leave_type_entity.dart';
part 'leave_type_model.freezed.dart';
part 'leave_type_model.g.dart';

@freezed
class LeaveTypeModel extends LeaveTypeEntity with _$LeaveTypeModel {
  const factory LeaveTypeModel({
    int? leaveTypeId,
    String? leaveTypeName,
    int? defaultStartDay,
    int? defaultStartMonth,
    int? defaultEndDay,
    int? defaultEndMonth,
    int? defaultBudget,
    bool? isPaidSalary,
  }) = _LeaveTypeModel;

  factory LeaveTypeModel.fromJson(Map<String, Object?> json) => _$LeaveTypeModelFromJson(json);

  factory LeaveTypeModel.fromEntity(LeaveTypeEntity entity) {
    return LeaveTypeModel(
      leaveTypeId: entity.leaveTypeId,
      leaveTypeName: entity.leaveTypeName,
      defaultStartDay: entity.defaultStartDay,
      defaultStartMonth: entity.defaultStartMonth,
      defaultEndDay: entity.defaultEndMonth,
      defaultBudget: entity.defaultBudget,
      isPaidSalary: entity.isPaidSalary,
    );
  }
}
