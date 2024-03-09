import 'package:dio/dio.dart' hide Headers;
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/models/paged_data.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/features/informations/data/models/user_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'employee_api_services.g.dart';

@RestApi(baseUrl: '$baseUrl/EmployeeManagement/')
abstract class EmployeeApiService {
  factory EmployeeApiService(Dio dio, {String baseUrl}) = _EmployeeApiService;

  @POST('GetEmployeePaging')
  Future<HttpResponse<ServiceResponse<PagedData<List<UserModel>>>>> getEmployeePaging(@Body() Map<String, dynamic> pageModelJson);

  @GET('getEmployeeById/{userId}')
  Future<HttpResponse<ServiceResponse<UserModel>>> getEmployeeById(@Path('userId') String userId);

  @POST('saveEmployee')
  Future<HttpResponse<ServiceResponse<UserModel>>> saveEmployee(@Body() Map<String, dynamic> userModelJson);
}