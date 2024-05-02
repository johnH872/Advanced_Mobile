import 'package:flutter/material.dart';
import 'package:hrm_mobile/features/notification/presentation/provider/notification_provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leadingIcon;
  final IconButton? button_1;
  final bool? isDisableBellIcon;
  const CustomAppBar(
      {required this.title, required this.leadingIcon, this.button_1, this.isDisableBellIcon, super.key});

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context, listen: true);
    return AppBar(
        backgroundColor: const Color(0xFFFBE186),
        leading: leadingIcon,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        actions: <Widget>[
          button_1 ?? Container(),
          isDisableBellIcon == null
              ? IconButton(
                  tooltip: "Notifications",
                  onPressed: () {
                    Navigator.of(context).pushNamed('/notifications');
                  },
                  icon: Badge(
                    label: notificationProvider.totalUnreadNoti > 0
                        ? Text(notificationProvider.totalUnreadNoti.toString())
                        : null,
                    child: const Icon(Icons.notifications, color: Colors.black),
                  ))
              : Container(),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
