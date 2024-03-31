import 'package:dio/dio.dart' hide Headers;
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/features/leave/data/models/leave_entitlement_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'leave_entitlement_api_services.g.dart';

@RestApi(baseUrl: '$baseUrl/LeaveEntitlementManagement/')
abstract class LeaveEntitlementApiService {
  factory LeaveEntitlementApiService(Dio dio, {String baseUrl}) = _LeaveEntitlementApiService;

  @GET('GetAllLeaveEntitlement')
  Future<HttpResponse<ServiceResponse<List<LeaveEntitlementModel>>>> getAllLeaveEntitlement();

  @POST('SaveLeaveEntitlement')
  Future<HttpResponse<ServiceResponse<LeaveEntitlementModel>>> saveLeaveEntitlement(@Body() Map<String, dynamic> leaveEntitlementJson);

  @GET('GetLeaveEntitlementByEmployeeId')
  Future<HttpResponse<ServiceResponse<List<LeaveEntitlementModel>>>> getLeaveEntitlementByEmployeeId( @Query('employeeId') String employeeId);
}