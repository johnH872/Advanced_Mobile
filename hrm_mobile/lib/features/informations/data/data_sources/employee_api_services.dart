import 'package:dio/dio.dart';
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/features/informations/data/models/user_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'employee_api_services.g.dart';

@RestApi(baseUrl: '$baseUrl/EmployeeManagement/')
abstract class EmployeeApiService {
  factory EmployeeApiService(Dio dio, {String baseUrl}) = _EmployeeApiService;

  @GET('GetEmployeePaging')
  Future<HttpResponse<ServiceResponse<List<UserModel>>>> getEmployeePaging();

  @GET('getEmployeeById/{userId}')
  Future<HttpResponse<ServiceResponse<UserModel>>> getEmployeeById(@Path('userId') String userId);

  @POST('saveEmployee')
  Future<HttpResponse<ServiceResponse<UserModel>>> saveEmployee(@Body() UserModel userModel);
}