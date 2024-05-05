// ignore_for_file: empty_catches, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/util/payload_util.dart';
import 'package:hrm_mobile/features/attendance/domain/entity/attendance_entity.dart';
import 'package:hrm_mobile/features/leave/domain/entity/datastate_entity.dart';
import 'package:hrm_mobile/features/leave/domain/entity/leave_request_entity.dart';
import 'package:hrm_mobile/features/leave/domain/repository/datastate_repository.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/work_calendar_entity.dart';
import 'package:hrm_mobile/features/work_calendar/domain/repository/work_calendar_repository.dart';
import 'package:hrm_mobile/injection_container.dart';
import 'package:loader_overlay/loader_overlay.dart';

class WorkCalendarProvider with ChangeNotifier {
  final WorkCalendarRepository workCalendarRepository = sl<WorkCalendarRepository>();
  final DataStateRepository dataStateRepository = sl<DataStateRepository>();

  List<WorkCalendarEntity> _allWorkCalendar = [];
  List<WorkCalendarEntity> get allWorkCalendar => _allWorkCalendar;

  List<dynamic> _calendarDataSource = [];
  List<dynamic> get calendarDataSource => _calendarDataSource;

  final PayloadUtil payloadUtil = PayloadUtil();

  DateTimeRange dayFilterRange = DateTimeRange(
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

  getWorkCalendarByUserId(BuildContext context) async {
    if (context.mounted) context.loaderOverlay.show();
    var userId = await payloadUtil.getUserId();
    final response = await workCalendarRepository.getWorkCalendarByUserId([userId], dayFilterRange);
    if (response.data != null) {
      _allWorkCalendar = response.data?.result ?? [];
    }
    if (context.mounted) context.loaderOverlay.hide();
    notifyListeners();
  }

  changeDateRange(BuildContext context, DateTime start, DateTime end) async {
    dayFilterRange = DateTimeRange(start: start, end: end);
    await getWorkCalendarByUserId(context);
  }

  updateCalendarData(List<LeaveRequestEntity> leaveRequests, List<AttendanceEntity> attendances, List<DataStateEntity> leaveStates) {
    int approvedLeaveStateId = leaveStates.firstWhere((element) => element.dataStateName == 'APPROVED').dataStateId ?? 2;
    var approvedLeaves = leaveRequests.where((element) => element.status == approvedLeaveStateId).toList();
    _calendarDataSource.clear();
    _calendarDataSource = [...allWorkCalendar, ...approvedLeaves, ...attendances];
  }
}
