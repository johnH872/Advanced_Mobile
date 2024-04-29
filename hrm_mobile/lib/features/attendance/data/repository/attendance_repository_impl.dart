import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hrm_mobile/core/models/date_range_model.dart';
import 'package:hrm_mobile/core/models/range_date_value.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/attendance/data/data_sources/attendance_api_services.dart';
import 'package:hrm_mobile/features/attendance/data/models/attendance_model.dart';
import 'package:hrm_mobile/features/attendance/domain/entity/attendance_entity.dart';
import 'package:hrm_mobile/features/attendance/domain/repository/attendance_repository.dart';

class AttendanceRepositoryImpl extends AttendanceRepository {
  final AttendanceApiService attendanceApiService;
  AttendanceRepositoryImpl({
    required this.attendanceApiService,
  });
  
  @override
  Future<DataState<ServiceResponse<List<AttendanceEntity>>>> getAttendanceByEmployeeId(DateRangeModel dateRangeModel, String userId) async {
    try {
      final httpResponse = await attendanceApiService.getAttendanceByEmployeeId(dateRangeModel.toJson(), userId);
      
      if (httpResponse.response.statusCode == HttpStatus.ok) {
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
  Future<DataState<ServiceResponse<bool>>> punchInOutMobile(AttendanceEntity attendanceEntity, bool isPunchIn, String userId) async{
    try {
      final httpResponse = await attendanceApiService.punchInOutMobile(AttendanceModel.fromEntity(attendanceEntity).toJson(), isPunchIn, userId);
      
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
  Future<DataState<ServiceResponse<List<AttendanceEntity>>>> getAttendanceRange(DateRangeModel dateRangeModel, String userId) async {
    try {
      var filterData = RangeDateValue(startDate: dateRangeModel.start, endDate: dateRangeModel.end);
      final httpResponse = await attendanceApiService.getAttendanceRange(filterData.toJson(), userId, 7);
      
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
