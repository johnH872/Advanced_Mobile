import 'package:dio/dio.dart' hide Headers;
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/features/work_calendar/data/models/work_calendar_detail_model.dart';
import 'package:hrm_mobile/features/work_calendar/data/models/work_calendars_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'work_calendar_api_services.g.dart';

@RestApi(baseUrl: '$baseUrl/WorkCalendarManagement/')
abstract class WorkCalendarApiService {
  factory WorkCalendarApiService(Dio dio, {String baseUrl}) = _WorkCalendarApiService;

  @POST('SaveWorkCalendar')
  Future<HttpResponse<ServiceResponse<WorkCalendarsModel>>> saveWorkCalendar(@Body() Map<String, dynamic> workCalendarJson);

  @POST('SaveWorkCalendarDetail')
  Future<HttpResponse<ServiceResponse<WorkCalendarDetailModel>>> saveWorkCalendarDetail(@Body() Map<String, dynamic> workCalendarDetailJson);

  @POST('GetWorkCalendarByUserId')
  Future<HttpResponse<ServiceResponse<List<WorkCalendarsModel>>>> getWorkCalendarByUserId(@Body() Map<String, dynamic> dataFilter);

  @POST('RemoveWorkCalendarDetails')
  Future<HttpResponse<ServiceResponse<bool>>> removeWorkCalendarDetails(@Body() String ids);
}