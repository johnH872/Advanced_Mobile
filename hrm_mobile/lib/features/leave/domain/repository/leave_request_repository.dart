import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/leave/domain/entity/leave_request_entity.dart';

abstract class LeaveRequestRepository {
  Future<DataState<ServiceResponse<List<LeaveRequestEntity>>>> getAllLeaveRequest();
  Future<DataState<ServiceResponse<LeaveRequestEntity>>> saveLeaveRequest(LeaveRequestEntity leaveRequestEntity);
  Future<DataState<ServiceResponse<List<LeaveRequestEntity>>>> getLeaveRequestByEmployeeId(String userId);
  Future<DataState<ServiceResponse<List<LeaveRequestEntity>>>> getLeaveRequestByFilter(String userId, DateTimeRange dateRangeModel);
}