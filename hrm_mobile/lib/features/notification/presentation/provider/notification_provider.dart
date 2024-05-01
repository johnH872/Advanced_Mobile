// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/util/payload_util.dart';
import 'package:hrm_mobile/features/notification/domain/entity/notification_entity.dart';
import 'package:hrm_mobile/features/notification/domain/repository/notification_repository.dart';
import 'package:hrm_mobile/injection_container.dart';
import 'package:loader_overlay/loader_overlay.dart';

class NotificationProvider with ChangeNotifier {
  final NotificationRepository attendanceRepository = sl<NotificationRepository>();

  List<NotificationEntity> _allNotifications = [];
  List<NotificationEntity> get allNotifications => _allNotifications;
  String fcmToken = '';
  final PayloadUtil payloadUtil = PayloadUtil();

  getAllNotifications(BuildContext context) async {
    if (context.mounted) context.loaderOverlay.show();
    var userId = await payloadUtil.getUserId();
    final response = await attendanceRepository.getAllNotification(userId);
    if (response.data != null) {
      _allNotifications = response.data?.result ?? [];
    }
    if (context.mounted) context.loaderOverlay.hide();
  }

  saveFcmToken(BuildContext context, String token) async {
    if (token.isEmpty) return;
    var userId = await payloadUtil.getUserId();
    fcmToken = token;
    final response = await attendanceRepository.saveFCMToken(userId, token);
    if (response.data != null) {
      print('Save FCM token successfully!');
    }
  }
}
