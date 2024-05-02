import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/features/notification/presentation/provider/notification_provider.dart';
import 'package:hrm_mobile/features/notification/presentation/widget/notification_tile.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(fontSize: 17),
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                backgroundColor: kTransparent,
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: () => {notificationProvider.markRead(context)},
              child: RichText(
                text: const TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.done_all,
                        size: 14,
                        color: Color.fromARGB(255, 26, 101, 230),
                      ),
                    ),
                    TextSpan(
                        text: " Mark all as read  ",
                        style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 26, 101, 230))),
                  ],
                ),
              ))
        ],
      ),
      body: ListView.separated(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: notificationProvider.allNotifications.length,
          itemBuilder: (context, index) {
            return NotificationTiles(
              title: notificationProvider.allNotifications[index].title ?? '',
              subtitle: notificationProvider.allNotifications[index].content ?? '',
              trailing: DateFormat('HH:mm dd/MM/yy')
                  .format(notificationProvider.allNotifications[index].createdAt ?? DateTime.now()),
              isRead: notificationProvider.allNotifications[index].isRead ?? true,
              enable: false,
              onTap: () => {},
              key: null,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 0,
            );
          }),
    );
  }
}
