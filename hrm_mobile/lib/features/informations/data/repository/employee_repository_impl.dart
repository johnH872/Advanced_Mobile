import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hrm_mobile/core/models/page_model.dart';
import 'package:hrm_mobile/core/models/paged_data.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/informations/data/data_sources/employee_api_services.dart';
import 'package:hrm_mobile/features/informations/data/models/user_model.dart';
import 'package:hrm_mobile/features/informations/domain/entity/user_entity.dart';
import 'package:hrm_mobile/features/informations/domain/repository/employee_repository.dart';

class EmployeeRepositoryImpl extends EmployeeRepository {
  final EmployeeApiService employeeApiService;
  EmployeeRepositoryImpl({
    required this.employeeApiService,
  });

  @override
  Future<DataState<ServiceResponse<PagedData<List<UserModel>>>>> getEmployeePaging(PageModel page) async {
    try {
      final httpResponse = await employeeApiService.getEmployeePaging(page.toJson());
      
      if(httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            message: "Error",
            requestOptions: httpResponse.response.requestOptions,
          )
        );
      }
    } on DioException catch(error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<ServiceResponse<UserEntity>>> getEmployeeById(String id) async {
    try {
      final httpResponse = await employeeApiService.getEmployeeById(id);
      
      if(httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            message: httpResponse.data.message,
            requestOptions: httpResponse.response.requestOptions,
          )
        );
      }
    } on DioException catch(error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<ServiceResponse<UserEntity>>> saveEmployee(UserEntity userEntity) async{
    try {
      final httpResponse = await employeeApiService.saveEmployee(UserModel.fromEntity(userEntity).toJson());
      
      if(httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            message: httpResponse.data.message,
            requestOptions: httpResponse.response.requestOptions,
          )
        );
      }
    } on DioException catch(error) {
      return DataFailed(error);
    }
  }

}
