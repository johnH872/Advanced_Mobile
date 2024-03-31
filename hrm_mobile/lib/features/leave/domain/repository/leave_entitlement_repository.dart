import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/leave/domain/entity/leave_etitlement_entity.dart';

abstract class LeaveEntitlementRepository {
  Future<DataState<ServiceResponse<List<LeaveEntitlementEntity>>>> getAllLeaveEntitlement();
  Future<DataState<ServiceResponse<LeaveEntitlementEntity>>> saveLeaveEntitlement(LeaveEntitlementEntity leaveEntitlementEntity);
  Future<DataState<ServiceResponse<List<LeaveEntitlementEntity>>>> getLeaveEntitlementByEmployeeId(String userId);
}