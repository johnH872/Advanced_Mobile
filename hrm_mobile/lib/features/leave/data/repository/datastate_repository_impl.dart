import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/leave/data/data_sources/datastate_api_services.dart';
import 'package:hrm_mobile/features/leave/domain/entity/datastate_entity.dart';
import 'package:hrm_mobile/features/leave/domain/repository/datastate_repository.dart';

class DataStateRepositoryImpl extends DataStateRepository {
  final DataStateApiService dataStateApiService;
  DataStateRepositoryImpl({
    required this.dataStateApiService,
  });

  @override
  Future<DataState<ServiceResponse<List<DataStateEntity>>>> getDataStateByType(String type) async {
    try {
      final httpResponse = await dataStateApiService.getDataStateByType(type);

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
  Future<DataState<ServiceResponse<DataStateEntity>>> getDataStateByTypeAndName(String type, String name) async {
    try {
      final httpResponse = await dataStateApiService.getDataStateByTypeAndName(type, name);

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
}
