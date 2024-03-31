import 'package:dio/dio.dart' hide Headers;
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/features/leave/data/models/datastate_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'datastate_api_services.g.dart';

@RestApi(baseUrl: '$baseUrl/DataStateManagement/')
abstract class DataStateApiService {
  factory DataStateApiService(Dio dio, {String baseUrl}) = _DataStateApiService;

  @GET('getDataStateByType')
  Future<HttpResponse<ServiceResponse<List<DataStateModel>>>> getDataStateByType(@Query("type") String type);

  @POST('getDataStateByTypeAndName')
  Future<HttpResponse<ServiceResponse<DataStateModel>>> getDataStateByTypeAndName(@Query("type") String type, @Query("name") String name);
}