import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/informations/data/data_sources/media_api_serivices.dart';
import 'package:hrm_mobile/features/informations/data/models/user_model.dart';
import 'package:hrm_mobile/features/informations/domain/repository/media_repository.dart';

class MediaRepositoryImpl extends MediaRepository {
  final MediaApiService mediaApiService;
  MediaRepositoryImpl({
    required this.mediaApiService,
  });
  
  @override
  Future<DataState<ServiceResponse<UserModel>>> uploadProfileAvatar(String userId, File image) async {
    try {
      final httpResponse = await mediaApiService.uploadProfileAvatar(userId, image);
      
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
