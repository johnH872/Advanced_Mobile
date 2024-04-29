// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/models/date_range_model.dart';
import 'package:hrm_mobile/features/attendance/domain/entity/attendance_entity.dart';
import 'package:hrm_mobile/features/attendance/domain/repository/attendance_repository.dart';
import 'package:hrm_mobile/injection_container.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AttendanceProvider with ChangeNotifier {
  final AttendanceRepository attendanceRepository = sl<AttendanceRepository>();

  List<AttendanceEntity> _todayAttendance = [];
  List<AttendanceEntity> get todayAttendance => _todayAttendance;
  List<AttendanceEntity> weekAttendances = [];
  List<AttendanceEntity> listAttendances = [];
  List<DateTime> punchInRecords = [];
  List<DateTime> punchoutRecords = [];
  bool isLoading = false;
  bool isPunchIn = true;

  List<double> thisWeekDuration = List.generate(7, (index) => 0);

  DateTimeRange weekFilterRange = DateTimeRange(
      start: DateTime(
          DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)).year,
          DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)).month,
          DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)).day,
          0,
          00),
      end: DateTime(
          DateTime.now().add(Duration(days: DateTime.daysPerWeek - DateTime.now().weekday)).year,
          DateTime.now().add(Duration(days: DateTime.daysPerWeek - DateTime.now().weekday)).month,
          DateTime.now().add(Duration(days: DateTime.daysPerWeek - DateTime.now().weekday)).day,
          23,
          59));
  DateTimeRange listFilterRange = DateTimeRange(
      start: DateTime(
          DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)).year,
          DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)).month,
          DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)).day,
          0,
          00),
      end: DateTime(
          DateTime.now().add(Duration(days: DateTime.daysPerWeek - DateTime.now().weekday)).year,
          DateTime.now().add(Duration(days: DateTime.daysPerWeek - DateTime.now().weekday)).month,
          DateTime.now().add(Duration(days: DateTime.daysPerWeek - DateTime.now().weekday)).day,
          23,
          59));

  initialAttendanceFilter(String? userId, BuildContext context) async {
    if (context.mounted) context.loaderOverlay.show();
    await getAttendanceRange(userId, weekFilterRange, true, true);
    if (context.mounted) context.loaderOverlay.hide();
  }

  changeWeekFilter(bool isNext, String userId, BuildContext context) async {
    if (context.mounted) context.loaderOverlay.show();
    var previousMonday = isNext
        ? weekFilterRange.start.add(const Duration(days: 7))
        : weekFilterRange.start.subtract(const Duration(days: 7));
    var previousSunday = isNext
        ? weekFilterRange.end.add(const Duration(days: 7))
        : weekFilterRange.end.subtract(const Duration(days: 7));
    weekFilterRange = DateTimeRange(start: previousMonday, end: previousSunday);
    // filter data
    await getAttendanceRange(userId, weekFilterRange, false, true);
    if (context.mounted) context.loaderOverlay.hide();
  }

  Future<void> getCurrentAttendance(String? userId) async {
    try {
      isLoading = true;
      DateTime currentDateTime = DateTime.now();
      DateTime startDate = DateTime(currentDateTime.year, currentDateTime.month, currentDateTime.day, 0, 00);
      DateTime endDate = DateTime(currentDateTime.year, currentDateTime.month, currentDateTime.day, 23, 59);
      DateRangeModel dateRangeModel = DateRangeModel(start: startDate, end: endDate);
      final response = await attendanceRepository.getAttendanceByEmployeeId(dateRangeModel, userId!);
      if (response.data != null) {
        _todayAttendance = response.data?.result ?? [];
        punchInRecords = [];
        punchoutRecords = [];
        for (var attendance in _todayAttendance) {
          if (attendance.punchinDate != null) punchInRecords.add(attendance.punchinDate!.toLocal());
          if (attendance.punchoutDate != null) punchoutRecords.add(attendance.punchoutDate!.toLocal());
        }
        if (_todayAttendance[0].punchoutDate != null) isPunchIn = false;
      }
    } catch (e) {}
    isLoading = false;
    notifyListeners();
  }

  changeListFilter(String userId, DateTime startDate, DateTime endDate, BuildContext context) async {
    if (context.mounted) context.loaderOverlay.show();
    listFilterRange = DateTimeRange(start: startDate, end: endDate);
    // filter data
    await getAttendanceRange(userId, listFilterRange, false, false);
    if (context.mounted) context.loaderOverlay.hide();
  }

  Future<void> getAttendanceRange(String? userId, DateTimeRange dateTimeRange, bool isBoth, bool isWeek) async {
    try {
      DateRangeModel dateRangeModel = DateRangeModel(start: dateTimeRange.start, end: dateTimeRange.end);
      final response = await attendanceRepository.getAttendanceRange(dateRangeModel, userId!);
      if (response.data != null) {
        if (isBoth || isWeek) {
          weekAttendances = response.data?.result ?? [];
          for (var i = 0; i < 7; i++) {
            var checkDate = dateTimeRange.start.add(Duration(days: i));
            var startDate = DateTime(checkDate.year, checkDate.month, checkDate.day, 00, 00);
            var endDate = DateTime(checkDate.year, checkDate.month, checkDate.day, 23, 59);
            thisWeekDuration[i] = weekAttendances
                .where((element) =>
                    element.punchinDate!.toLocal().isAfter(startDate) &&
                    element.punchinDate!.toLocal().isBefore(endDate))
                .fold(0.0, (sum, next) => double.parse((sum + (next.duration as num)).toStringAsFixed(2)));
          }
        }
        if(isBoth || !isWeek) {
          listAttendances =response.data?.result ?? [];
        }
      }
    } catch (e) {}
    notifyListeners();
  }
}
