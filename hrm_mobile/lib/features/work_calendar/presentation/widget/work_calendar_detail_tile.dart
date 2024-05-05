import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/util/common.dart';

class WorkCalendarDetailTiles extends StatelessWidget {
  final String title, subtitle, codeColor;
  final Function()? onTap;
  final bool enable;
  const WorkCalendarDetailTiles(
      {required this.title,
      required this.subtitle,
      required this.codeColor,
      required this.onTap,
      required this.enable,
      super.key});

  @override
  Widget build(BuildContext context) {
    final CommonUtil commonUtil = CommonUtil();
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -1),
      // minVerticalPadding: 0,
      // leading: Container(
      //     height: 35.0,
      //     width: 35.0,
      //     decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(logo), fit: BoxFit.cover))),
      title: Text(title, style: const TextStyle(color: kDarkColor, fontSize: 14)),
      subtitle: Text(subtitle, style: const TextStyle(color: kLightColor, fontSize: 12)),
      trailing: CircleAvatar(
        backgroundColor: commonUtil.hexToColor(codeColor),
        radius: 10,
      ),
      onTap: onTap,
      enabled: enable,
    );
  }
}
