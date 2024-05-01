import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/features/notification/domain/entity/notification_entity.dart';
part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel extends NotificationEntity with _$NotificationModel {
  const factory NotificationModel({
    int? notificationId,
    String? userId,
    NotificationType? type,
    bool? isRead,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, Object?> json) => _$NotificationModelFromJson(json);

  factory NotificationModel.fromEntity(NotificationEntity entity) {
    return NotificationModel(
      notificationId: entity.notificationId,
      userId: entity.userId,
      type: entity.type,
      isRead: entity.isRead,
      title: entity.title,
      content: entity.content,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
