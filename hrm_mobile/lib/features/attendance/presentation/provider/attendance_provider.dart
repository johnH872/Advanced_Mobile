// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/models/date_range_model.dart';
import 'package:hrm_mobile/features/attendance/domain/entity/attendance_entity.dart';
import 'package:hrm_mobile/features/attendance/domain/repository/attendance_repository.dart';
import 'package:hrm_mobile/injection_container.dart';

class AttendanceProvider with ChangeNotifier {
  final AttendanceRepository attendanceRepository = sl<AttendanceRepository>();

  List<AttendanceEntity> _todayAttendance = [];
  List<AttendanceEntity> get todayAttendance => _todayAttendance;
  List<DateTime> punchInRecords = [];
  List<DateTime> punchoutRecords = [];
  bool isLoading = false;
  bool isPunchIn = true;

  Future<void> getCurrentAttendance(String? userId) async {
    try {
      isLoading = true;
      DateTime currentDateTime = DateTime.now();
      DateRangeModel dateRangeModel = DateRangeModel(start: currentDateTime, end: currentDateTime);
      final response = await attendanceRepository.getAttendanceByEmployeeId(dateRangeModel, userId!);
      if (response.data != null) {
        _todayAttendance = response.data?.result ?? [];
        punchInRecords = [];
        punchoutRecords = [];
        for (var attendance in _todayAttendance) {
          if(attendance.punchinDate != null) punchInRecords.add(attendance.punchinDate!);
          if(attendance.punchoutDate != null) punchoutRecords.add(attendance.punchoutDate!);
        }
        if(_todayAttendance[0].punchoutDate != null) isPunchIn = false;
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}