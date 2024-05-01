import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/notification/domain/entity/notification_entity.dart';

abstract class NotificationRepository {
  Future<DataState<ServiceResponse<List<NotificationEntity>>>> getAllNotification(String userId);
  Future<DataState<ServiceResponse<bool>>> saveFCMToken(String userId, String token);
  Future<DataState<ServiceResponse<bool>>> markRead(String userId, String notificationId);
}
