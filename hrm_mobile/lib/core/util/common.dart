import 'package:flutter/material.dart';

class CommonUtil {
  Color hexToColor(String? code) {
    try {
      code ??= "000000";
      return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    } catch (error) {
      return Colors.black;
    }
  }

  String capitalizeFirstLettere(String s) {
    s = s.toLowerCase().trim();
    if (s.isEmpty) {
      return s;
    }
    return s[0].toUpperCase() + s.substring(1);
  }
}
