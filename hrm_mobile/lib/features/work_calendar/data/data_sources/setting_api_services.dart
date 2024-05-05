import 'package:dio/dio.dart' hide Headers;
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/features/work_calendar/data/models/setting_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'setting_api_services.g.dart';

@RestApi(baseUrl: '$baseUrl/SettingManagement/')
abstract class SettingApiService {
  factory SettingApiService(Dio dio, {String baseUrl}) = _SettingApiService;

  @GET('GetAllSetting')
  Future<HttpResponse<ServiceResponse<List<SettingModel>>>> getAllSetting();

  @GET('GetSettingByKeyAndGroup')
  Future<HttpResponse<ServiceResponse<SettingModel>>> getSettingByKeyAndGroup(@Query('key') String key, @Query('group') String group);

  @GET('GetSettingByGroup')
  Future<HttpResponse<ServiceResponse<List<SettingModel>>>> getSettingByGroup(@Query('group') String group);
}