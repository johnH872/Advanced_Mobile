// ignore_for_file: empty_catches, avoid_print, use_build_context_synchronously

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
  int totalUnreadNoti = 0;
  final PayloadUtil payloadUtil = PayloadUtil();

  getAllNotifications(BuildContext context) async {
    if (context.mounted) context.loaderOverlay.show();
    var userId = await payloadUtil.getUserId();
    final response = await attendanceRepository.getAllNotification(userId);
    if (response.data != null) {
      _allNotifications = response.data?.result ?? [];
      totalUnreadNoti = _allNotifications.where((element) => element.isRead == false).length;
    }
    if (context.mounted) context.loaderOverlay.hide();
    notifyListeners();
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

  markRead(BuildContext context) async {
    if (context.mounted) context.loaderOverlay.show();
    var userId = await payloadUtil.getUserId();
    final response = await attendanceRepository.markRead(userId, 'mark-all');
    if (response.data != null && context.mounted) {
      await getAllNotifications(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Marked all successfully!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 44, 142, 48),
        ),
      );
    }
    if (context.mounted) context.loaderOverlay.hide();
  }
}
