import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/leave/domain/entity/leave_type_entity.dart';

abstract class LeaveTypeRepository {
  Future<DataState<ServiceResponse<List<LeaveTypeEntity>>>> getAllLeaveType();
  Future<DataState<ServiceResponse<LeaveTypeEntity>>> saveLeaveType(LeaveTypeEntity leaveTypeEntity);
}