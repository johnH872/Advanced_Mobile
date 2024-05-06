import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/util/common.dart';

class WorkCalendarDetailTiles extends StatelessWidget {
  final String title, subtitle, codeColor;
  final Function()? onTap, onLongPress;
  final bool enable;
  const WorkCalendarDetailTiles(
      {required this.title,
      required this.subtitle,
      required this.codeColor,
      required this.onTap,
      required this.enable,
      required this.onLongPress,
      super.key});

  @override
  Widget build(BuildContext context) {
    final CommonUtil commonUtil = CommonUtil();
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -1),
      title: Text(title, style: const TextStyle(color: kDarkColor, fontSize: 14)),
      subtitle: Text(subtitle, style: const TextStyle(color: kLightColor, fontSize: 12)),
      trailing: CircleAvatar(
        backgroundColor: commonUtil.hexToColor(codeColor),
        radius: 10,
      ),
      onTap: onTap,
      onLongPress: onLongPress,
      enabled: enable,
    );
  }
}
