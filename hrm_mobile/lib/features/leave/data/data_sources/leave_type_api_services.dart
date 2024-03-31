import 'package:dio/dio.dart' hide Headers;
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/features/leave/data/models/leave_type_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'leave_type_api_services.g.dart';

@RestApi(baseUrl: '$baseUrl/LeaveTypeManagement/')
abstract class LeaveTypeApiService {
  factory LeaveTypeApiService(Dio dio, {String baseUrl}) = _LeaveTypeApiService;

  @GET('GetAllLeaveType')
  Future<HttpResponse<ServiceResponse<List<LeaveTypeModel>>>> getAllLeaveType();

  @POST('SaveLeaveType')
  Future<HttpResponse<ServiceResponse<LeaveTypeModel>>> saveLeaveType(@Body() Map<String, dynamic> leaveRequestJson);
}