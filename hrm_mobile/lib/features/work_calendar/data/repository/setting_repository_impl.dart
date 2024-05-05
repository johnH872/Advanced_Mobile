import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/work_calendar/data/data_sources/setting_api_services.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/setting_entity.dart';
import 'package:hrm_mobile/features/work_calendar/domain/repository/setting_repository.dart';

class SettingRepositoryImpl extends SettingRepository {
  final SettingApiService settingApiService;
  SettingRepositoryImpl({
    required this.settingApiService,
  });

  @override
  Future<DataState<ServiceResponse<List<SettingEntity>>>> getAllSetting() async {
    try {
      final httpResponse = await settingApiService.getAllSetting();

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
    } catch (error) {
      print(error);
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }

  @override
  Future<DataState<ServiceResponse<List<SettingEntity>>>> getSettingByGroup(String group) async {
    try {
      final httpResponse = await settingApiService.getSettingByGroup(group);

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
    } catch (error) {
      print(error);
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }

  @override
  Future<DataState<ServiceResponse<SettingEntity>>> getSettingByKeyAndGroup(String key, String group) async {
    try {
      final httpResponse = await settingApiService.getSettingByKeyAndGroup(key, group);

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
    } catch (error) {
      print(error);
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }
}
