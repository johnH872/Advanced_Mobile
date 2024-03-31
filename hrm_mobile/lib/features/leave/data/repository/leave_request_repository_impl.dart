import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/models/date_range_model.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/leave/data/data_sources/leave_request_api_services.dart';
import 'package:hrm_mobile/features/leave/data/models/leave_request_model.dart';
import 'package:hrm_mobile/features/leave/domain/entity/leave_request_entity.dart';
import 'package:hrm_mobile/features/leave/domain/repository/leave_request_repository.dart';

class LeaveRequestRepositoryImpl extends LeaveRequestRepository {
  final LeaveRequestApiService leaveRequestApiService;
  LeaveRequestRepositoryImpl({
    required this.leaveRequestApiService,
  });

  @override
  Future<DataState<ServiceResponse<List<LeaveRequestEntity>>>> getAllLeaveRequest() async {
    try {
      final httpResponse = await leaveRequestApiService.getAllLeaveRequest();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          message: "Error",
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<ServiceResponse<List<LeaveRequestEntity>>>> getLeaveRequestByEmployeeId(String userId) async {
    try {
      final httpResponse = await leaveRequestApiService.getLeaveRequestByEmployeeId(userId);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          message: "Error",
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<ServiceResponse<LeaveRequestEntity>>> saveLeaveRequest(LeaveRequestEntity leaveRequestEntity) async {
    try {
      final httpResponse =
          await leaveRequestApiService.saveLeaveRequest(LeaveRequestModel.fromEntity(leaveRequestEntity).toJson());

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          message: "Error",
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<ServiceResponse<List<LeaveRequestEntity>>>> getLeaveRequestByFilter(String userId, DateTimeRange dateRangeModel) async {
    try {
      var dateTimeRangeModel = DateRangeModel(start: dateRangeModel.start, end: dateRangeModel.end);
      final httpResponse = await leaveRequestApiService.getLeaveRequestByFilter(userId, dateTimeRangeModel.toJson());
      
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
