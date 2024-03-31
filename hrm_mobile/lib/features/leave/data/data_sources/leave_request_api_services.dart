import 'package:dio/dio.dart' hide Headers;
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/features/leave/data/models/leave_request_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'leave_request_api_services.g.dart';

@RestApi(baseUrl: '$baseUrl/LeaveRequestManagement/')
abstract class LeaveRequestApiService {
  factory LeaveRequestApiService(Dio dio, {String baseUrl}) = _LeaveRequestApiService;

  @GET('GetAllLeaveRequest')
  Future<HttpResponse<ServiceResponse<List<LeaveRequestModel>>>> getAllLeaveRequest();

  @POST('SaveLeaveRequest')
  Future<HttpResponse<ServiceResponse<LeaveRequestModel>>> saveLeaveRequest(@Body() Map<String, dynamic> leaveRequestJson);

  @GET('GetLeaveRequestByEmployeeId/{id}')
  Future<HttpResponse<ServiceResponse<List<LeaveRequestModel>>>> getLeaveRequestByEmployeeId( @Path('id') String userId);

  @POST('GetLeaveRequestByFilter/{id}')
  Future<HttpResponse<ServiceResponse<List<LeaveRequestModel>>>> getLeaveRequestByFilter( @Path('id') String userId, @Body() Map<String, dynamic> filterJson);
}