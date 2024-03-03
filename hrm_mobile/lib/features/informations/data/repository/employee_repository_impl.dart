import 'dart:io';

import 'package:dio/dio.dart';
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
  Future<DataState<ServiceResponse<List<UserModel>>>> getEmployeePaging() async {
    try {
      final httpResponse = await employeeApiService.getEmployeePaging();
      
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
      final httpResponse = await employeeApiService.saveEmployee(UserModel.fromEntity(userEntity));
      
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
