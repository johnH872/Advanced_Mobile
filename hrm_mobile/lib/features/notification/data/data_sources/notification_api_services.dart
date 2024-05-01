import 'package:dio/dio.dart' hide Headers;
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/features/notification/data/models/notification_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'notification_api_services.g.dart';

@RestApi(baseUrl: '$baseUrl/Notification/')
abstract class NotificationApiService {
  factory NotificationApiService(Dio dio, {String baseUrl}) = _NotificationApiService;

  @GET('GetAllNotification/{userId}')
  Future<HttpResponse<ServiceResponse<List<NotificationModel>>>> getAllNotification(@Path('userId') String userId);

  @POST('saveFCMToken/{userId}')
  Future<HttpResponse<ServiceResponse<bool>>> saveFCMToken(@Body() Map<String, dynamic> token, @Path('userId') String userId);

  @POST('markRead/{userId}/{notificationId}')
  Future<HttpResponse<ServiceResponse<bool>>> markRead(@Path('userId') String userId, @Path('notificationId') String notificationId);
}