import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/constants/constants.dart';

class NotificationTiles extends StatelessWidget {
  final String title, subtitle, trailing;
  final Function()? onTap;
  final bool enable;
  final bool isRead;
  const NotificationTiles({
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.onTap,
    required this.enable,
    required this.isRead,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: isRead ? Colors.white : kAccentColor,
      dense: true, 
      visualDensity: const VisualDensity(horizontal: 0, vertical: -1),
      // minVerticalPadding: 0,
      leading: Container(
          height: 35.0,
          width: 35.0,
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(logo), fit: BoxFit.cover))),
      title: Text(title, style: const TextStyle(color: kDarkColor, fontSize: 14)),
      subtitle: Text(subtitle, style: const TextStyle(color: kLightColor, fontSize: 12)),
      trailing: Text(trailing, style: const TextStyle(color: kDarkColor, fontSize: 12)),
      onTap: onTap,
      enabled: enable,
    );
  }
}
