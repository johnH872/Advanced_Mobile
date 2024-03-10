import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/features/informations/data/models/user_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'media_api_serivices.g.dart';

@RestApi(baseUrl: '$baseUrl/MediaManagement/')
abstract class MediaApiService {
  factory MediaApiService(Dio dio, {String baseUrl}) = _MediaApiService;

  @POST('UploadProfileAvatar/{userId}')
  @MultiPart()
  Future<HttpResponse<ServiceResponse<UserModel>>> uploadProfileAvatar(
    @Path('userId') String userId,
    @Part() File image
  );
}