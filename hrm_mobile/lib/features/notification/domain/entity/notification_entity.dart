import 'package:hrm_mobile/core/constants/constants.dart';

class NotificationEntity {
  final int? notificationId;
  final String? userId;
  final NotificationType? type;
  final bool? isRead;
  final String? title;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  
  NotificationEntity({
    this.notificationId,
    this.userId,
    this.type,
    this.isRead,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
  });
}
