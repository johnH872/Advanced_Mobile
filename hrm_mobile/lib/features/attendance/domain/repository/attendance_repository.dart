import 'package:hrm_mobile/core/models/date_range_model.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/attendance/domain/entity/attendance_entity.dart';

abstract class AttendanceRepository {
  Future<DataState<ServiceResponse<List<AttendanceEntity>>>> getAttendanceByEmployeeId(DateRangeModel dateRangeModel, String userId);
  Future<DataState<ServiceResponse<bool>>> punchInOutMobile(AttendanceEntity attendanceEntity, bool isPunchIn, String userId);
  Future<DataState<ServiceResponse<List<AttendanceEntity>>>> getAttendanceRange(DateRangeModel dateRangeModel, String userId);
}