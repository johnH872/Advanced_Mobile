// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrm_mobile/features/leave/data/models/datastate_model.dart';
import 'package:hrm_mobile/features/leave/domain/entity/leave_request_entity.dart';
part 'leave_request_model.freezed.dart';
part 'leave_request_model.g.dart';

@freezed
class LeaveRequestModel extends LeaveRequestEntity with _$LeaveRequestModel {
  const factory LeaveRequestModel({
    int? leaveRequestId,
    String? userId,
    int? leaveEntitlementId,
    DateTime? leaveDateFrom,
    DateTime? leaveDateTo,
    String? session,
    double? numberOfHour,
    int? status,
    String? note,
    String? reason,
    DataStateModel? DataState,
  }) = _LeaveRequestModel;

  factory LeaveRequestModel.fromJson(Map<String, Object?> json) => _$LeaveRequestModelFromJson(json);

  factory LeaveRequestModel.fromEntity(LeaveRequestEntity entity) {
    return LeaveRequestModel(
      leaveRequestId: entity.leaveRequestId,
      userId: entity.userId,
      leaveEntitlementId: entity.leaveEntitlementId,
      leaveDateFrom: entity.leaveDateFrom,
      leaveDateTo: entity.leaveDateTo,
      session: entity.session,
      numberOfHour: entity.numberOfHour,
      status: entity.status,
      note: entity.note,
      reason: entity.reason
    );
  }
}
