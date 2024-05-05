// ignore_for_file: empty_catches, avoid_print

import 'package:flutter/material.dart';
import 'package:hrm_mobile/features/leave/domain/entity/datastate_entity.dart';
import 'package:hrm_mobile/features/leave/domain/repository/datastate_repository.dart';
import 'package:hrm_mobile/injection_container.dart';

class DataStateProvider with ChangeNotifier {
  final DataStateRepository dataStateRepository = sl<DataStateRepository>();

  List<DataStateEntity> _leaveStates = [];
  List<DataStateEntity> get leaveStates => _leaveStates;

  Future<void> getLeaveDataStates() async {
    try {
      final response = await dataStateRepository.getDataStateByType('LEAVE_REQUEST');
      if (response.data != null) {
          _leaveStates = response.data?.result ?? [];
        }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  notifyChanges() {
    notifyListeners();
  }
}
