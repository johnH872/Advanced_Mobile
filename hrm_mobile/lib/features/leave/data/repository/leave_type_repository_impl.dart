import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/leave/data/data_sources/leave_type_api_services.dart';
import 'package:hrm_mobile/features/leave/data/models/leave_type_model.dart';
import 'package:hrm_mobile/features/leave/domain/entity/leave_type_entity.dart';
import 'package:hrm_mobile/features/leave/domain/repository/leave_type_repository.dart';

class LeaveTypeRepositoryImpl extends LeaveTypeRepository {
  final LeaveTypeApiService leaveTypeApiService;
  LeaveTypeRepositoryImpl({
    required this.leaveTypeApiService,
  });

  @override
  Future<DataState<ServiceResponse<List<LeaveTypeEntity>>>> getAllLeaveType() async {
    try {
      final httpResponse = await leaveTypeApiService.getAllLeaveType();
      
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
  Future<DataState<ServiceResponse<LeaveTypeEntity>>> saveLeaveType(LeaveTypeEntity leaveTypeEntity) async {
    try {
      final httpResponse = await leaveTypeApiService.saveLeaveType(LeaveTypeModel.fromEntity(leaveTypeEntity).toJson());
      
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

}
