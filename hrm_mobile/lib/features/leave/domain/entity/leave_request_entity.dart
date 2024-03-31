// ignore_for_file: non_constant_identifier_names

import 'package:hrm_mobile/features/leave/domain/entity/datastate_entity.dart';

class LeaveRequestEntity {
  int? leaveRequestId;
  String? userId;
  int? leaveEntitlementId;
  DateTime? leaveDateFrom;
  DateTime? leaveDateTo;
  String? session;
  double? numberOfHour;
  int? status;
  String? note;
  String? reason;
  final DataStateEntity? DataState;

  LeaveRequestEntity({
    this.leaveRequestId,
    this.userId,
    this.leaveEntitlementId,
    this.leaveDateFrom,
    this.leaveDateTo,
    this.session,
    this.numberOfHour,
    this.status,
    this.note,
    this.reason,
    this.DataState
  });
  
  
}
