// ignore_for_file: empty_catches, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/util/payload_util.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/setting_entity.dart';
import 'package:hrm_mobile/features/work_calendar/domain/repository/setting_repository.dart';
import 'package:hrm_mobile/injection_container.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SettingProvider with ChangeNotifier {
  final SettingRepository settingRepository = sl<SettingRepository>();

  List<SettingEntity> _allSetting = [];
  List<SettingEntity> get allSetting => _allSetting;
  final PayloadUtil payloadUtil = PayloadUtil();
  String morningStartTime = "00:00";
  String morningEndTime = "00:00";
  String afternoonStartTime = "00:00";
  String afternoonEndTime = "00:00";

  getAllSetting(BuildContext context) async {
    if (context.mounted) context.loaderOverlay.show();
    final response = await settingRepository.getAllSetting();
    if (response.data != null) {
      _allSetting = response.data?.result ?? [];
    }
    if (context.mounted) context.loaderOverlay.hide();
    notifyListeners();
  }

  Future<SettingEntity?> getSettingByKeyAndGroup(BuildContext context, String key, String group) async {
    if (context.mounted) context.loaderOverlay.show();
    final response = await settingRepository.getSettingByKeyAndGroup(key, group);
    if (response.data != null) {
      return response.data?.result;
    }
    if (context.mounted) context.loaderOverlay.hide();
    notifyListeners();
    return null;
  }

  Future<List<SettingEntity>?> getSettingByGroup(BuildContext context, String group) async {
    if (context.mounted) context.loaderOverlay.show();
    final response = await settingRepository.getSettingByGroup(group);
    if (response.data != null) {
      return response.data?.result;
    }
    if (context.mounted) context.loaderOverlay.hide();
    notifyListeners();
    return [];
  }

  getGlobalWorkingTimes(BuildContext context) async {
    if (context.mounted) context.loaderOverlay.show();
    var workingTimes = await getSettingByGroup(context, 'WORKING_TIME');
    if(workingTimes!.isNotEmpty) {
      morningStartTime = workingTimes.firstWhere((element) => element.key == 'MORNING_START').value ?? "00:00";
      morningEndTime = workingTimes.firstWhere((element) => element.key == 'MORNING_END').value ?? "00:00";
      afternoonStartTime = workingTimes.firstWhere((element) => element.key == 'AFTERNOON_START').value ?? "00:00";
      afternoonEndTime = workingTimes.firstWhere((element) => element.key == 'AFTERNOON_END').value ?? "00:00";
    }
    if (context.mounted) context.loaderOverlay.hide();
    notifyListeners();
  }
}
