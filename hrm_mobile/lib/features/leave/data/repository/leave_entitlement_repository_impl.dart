import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/leave/data/data_sources/leave_entitlement_api_services.dart';
import 'package:hrm_mobile/features/leave/data/models/leave_entitlement_model.dart';
import 'package:hrm_mobile/features/leave/domain/entity/leave_etitlement_entity.dart';
import 'package:hrm_mobile/features/leave/domain/repository/leave_entitlement_repository.dart';

class LeaveEntitlementRepositoryImpl extends LeaveEntitlementRepository {
  final LeaveEntitlementApiService leaveEntitlementApiService;
  LeaveEntitlementRepositoryImpl({
    required this.leaveEntitlementApiService,
  });

  @override
  Future<DataState<ServiceResponse<List<LeaveEntitlementEntity>>>> getAllLeaveEntitlement() async {
    try {
      final httpResponse = await leaveEntitlementApiService.getAllLeaveEntitlement();
      
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
  Future<DataState<ServiceResponse<List<LeaveEntitlementEntity>>>> getLeaveEntitlementByEmployeeId(String userId) async {
    try {
      final httpResponse = await leaveEntitlementApiService.getLeaveEntitlementByEmployeeId(userId);
      
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
  Future<DataState<ServiceResponse<LeaveEntitlementEntity>>> saveLeaveEntitlement(LeaveEntitlementEntity leaveEntitlementEntity) async {
    try {
      final httpResponse = await leaveEntitlementApiService.saveLeaveEntitlement(LeaveEntitlementModel.fromEntity(leaveEntitlementEntity).toJson());
      
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
