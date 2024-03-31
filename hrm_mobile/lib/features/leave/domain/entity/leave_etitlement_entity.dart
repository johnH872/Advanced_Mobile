// ignore_for_file: non_constant_identifier_names

import 'package:hrm_mobile/features/leave/domain/entity/leave_type_entity.dart';

class LeaveEntitlementEntity {
  final int? leaveEntitlementId;
  final String? userId;
  final int? leaveTypeId;
  final DateTime? startDate;
  final DateTime? endDate;
  final double? availableLeave;
  final double? usableLeave;
  final double? usedLeave;
  final int? affectedYear;
  final LeaveTypeEntity? LeaveType;

  LeaveEntitlementEntity({
    this.leaveEntitlementId,
    this.userId,
    this.leaveTypeId,
    this.startDate,
    this.endDate,
    this.availableLeave,
    this.usableLeave,
    this.usedLeave,
    this.affectedYear,
    this.LeaveType
  });
}
