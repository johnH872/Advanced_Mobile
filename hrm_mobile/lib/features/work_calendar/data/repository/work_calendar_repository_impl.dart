import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/work_calendar/data/data_sources/work_calendar_api_services.dart';
import 'package:hrm_mobile/features/work_calendar/data/models/work_calendar_detail_model.dart';
import 'package:hrm_mobile/features/work_calendar/data/models/work_calendars_model.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/work_calendar_detail_entity.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/work_calendar_entity.dart';
import 'package:hrm_mobile/features/work_calendar/domain/repository/work_calendar_repository.dart';

class WorkCalendarRepositoryImpl extends WorkCalendarRepository {
  final WorkCalendarApiService workCalendarApiService;
  WorkCalendarRepositoryImpl({
    required this.workCalendarApiService,
  });
  
  @override
  Future<DataState<ServiceResponse<List<WorkCalendarEntity>>>> getWorkCalendarByUserId(List<String> userId, DateTimeRange dateRangeModel) async{
    try {
      Map<String, dynamic> dataFilter = {
        'userIds': userId,
        'fromDate': dateRangeModel.start.toString(),
        'toDate': dateRangeModel.end.toString()
      };
      final httpResponse = await workCalendarApiService.getWorkCalendarByUserId(dataFilter);
      
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
    } catch(error) {
      print(error);
      return DataFailed(DioException(requestOptions: RequestOptions()));
    } 
  }

  @override
  Future<DataState<ServiceResponse<WorkCalendarEntity>>> saveWorkCalendar(WorkCalendarEntity workCalendarEntity) async{
    try {
      final httpResponse = await workCalendarApiService.saveWorkCalendar(WorkCalendarsModel.fromEntity(workCalendarEntity).toJson());
      
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
  Future<DataState<ServiceResponse<WorkCalendarDetailEntity>>> saveWorkCalendarDetail(WorkCalendarDetailEntity workCalendarDetailEntity) async{
    try {
      final httpResponse = await workCalendarApiService.saveWorkCalendarDetail(WorkCalendarDetailModel.fromEntity(workCalendarDetailEntity).toJson());
      
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
