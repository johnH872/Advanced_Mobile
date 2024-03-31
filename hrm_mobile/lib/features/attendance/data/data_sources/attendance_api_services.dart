import 'package:dio/dio.dart' hide Headers;
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/features/attendance/data/models/attendance_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'attendance_api_services.g.dart';

@RestApi(baseUrl: '$baseUrl/AttendanceManagement/')
abstract class AttendanceApiService {
  factory AttendanceApiService(Dio dio, {String baseUrl}) = _AttendanceApiService;

  @POST('GetAttendanceByEmployeeId/{id}')
  Future<HttpResponse<ServiceResponse<List<AttendanceModel>>>> getAttendanceByEmployeeId(@Body() Map<String, dynamic> dateRangeModelJson, @Path('id') String userId);

  @POST('PunchInOutMobile/{isPunchIn}/{id}')
  Future<HttpResponse<ServiceResponse<bool>>> punchInOutMobile(@Body() Map<String, dynamic> attendanceEntityJson, @Path('isPunchIn') bool isPunchIn, @Path('id') String userId);
}