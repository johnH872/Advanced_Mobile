import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/notification/data/data_sources/notification_api_services.dart';
import 'package:hrm_mobile/features/notification/domain/entity/notification_entity.dart';
import 'package:hrm_mobile/features/notification/domain/repository/notification_repository.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final NotificationApiService notificationApiService;
  NotificationRepositoryImpl({
    required this.notificationApiService,
  });
  
  @override
  Future<DataState<ServiceResponse<List<NotificationEntity>>>> getAllNotification(String userId) async{
     try {
      final httpResponse = await notificationApiService.getAllNotification(userId);
      
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
  Future<DataState<ServiceResponse<bool>>> markRead(String userId, String notificationId) async{
    try {
      final httpResponse = await notificationApiService.markRead(userId, notificationId);
      
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
  Future<DataState<ServiceResponse<bool>>> saveFCMToken(String userId, String token) async {
    try {
      Map<String, dynamic> body = {
        'token': token
      };
      final httpResponse = await notificationApiService.saveFCMToken(body, userId);
      
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
