// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrm_mobile/features/leave/data/models/leave_type_model.dart';
import 'package:hrm_mobile/features/leave/domain/entity/leave_etitlement_entity.dart';
part 'leave_entitlement_model.freezed.dart';
part 'leave_entitlement_model.g.dart';

@freezed
class LeaveEntitlementModel extends LeaveEntitlementEntity with _$LeaveEntitlementModel {
  const factory LeaveEntitlementModel({
    int? leaveEntitlementId,
    String? userId,
    int? leaveTypeId,
    DateTime? startDate,
    DateTime? endDate,
    double? availableLeave,
    double? usableLeave,
    double? usedLeave,
    int? affectedYear,
    LeaveTypeModel? LeaveType
  }) = _LeaveEntitlementModel;

  factory LeaveEntitlementModel.fromJson(Map<String, Object?> json) => _$LeaveEntitlementModelFromJson(json);

  factory LeaveEntitlementModel.fromEntity(LeaveEntitlementEntity entity) {
    return LeaveEntitlementModel(
      leaveEntitlementId: entity.leaveEntitlementId,
      userId: entity.userId,
      leaveTypeId: entity.leaveTypeId,
      startDate: entity.startDate,
      endDate: entity.endDate,
      availableLeave: entity.availableLeave,
      usableLeave: entity.usableLeave,
      usedLeave: entity.usedLeave,
      affectedYear: entity.affectedYear
    );
  }
}
