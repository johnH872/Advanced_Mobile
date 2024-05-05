// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/util/payload_util.dart';
import 'package:hrm_mobile/core/widgets/app_bar_widget.dart';
import 'package:hrm_mobile/features/attendance/domain/entity/attendance_entity.dart';
import 'package:hrm_mobile/features/attendance/presentation/provider/attendance_provider.dart';
import 'package:hrm_mobile/features/leave/domain/entity/leave_request_entity.dart';
import 'package:hrm_mobile/features/leave/presentation/provider/datastate_provider.dart';
import 'package:hrm_mobile/features/leave/presentation/provider/leave_provider.dart';
import 'package:hrm_mobile/features/work_calendar/data/models/work_calendars_model.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/work_calendar_entity.dart';
import 'package:hrm_mobile/features/work_calendar/presentation/pages/work_calendar_details_screen.dart';
import 'package:hrm_mobile/features/work_calendar/presentation/provider/setting_provider.dart';
import 'package:hrm_mobile/features/work_calendar/presentation/provider/work_calendar_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class WorkCalendarScreen extends StatefulWidget {
  const WorkCalendarScreen({super.key});

  @override
  State<WorkCalendarScreen> createState() => _WorkCalendarScreenState();
}

class _WorkCalendarScreenState extends State<WorkCalendarScreen> {
  final payloadUtil = PayloadUtil();
  @override
  void initState() {
    initData();
    super.initState();
  }

  Future<void> initData() async {
    final workCalendarProvider = Provider.of<WorkCalendarProvider>(context, listen: false);
    final attendanceProvider = Provider.of<AttendanceProvider>(context, listen: false);
    final leaveProvider = Provider.of<LeaveProvider>(context, listen: false);
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);
    final dataStateProvider = Provider.of<DataStateProvider>(context, listen: false);

    var userId = await payloadUtil.getUserId();
    await workCalendarProvider.getWorkCalendarByUserId(context);
    await settingProvider.getGlobalWorkingTimes(context);
    await attendanceProvider.getAttendanceRange(userId, workCalendarProvider.dayFilterRange, true, false);
    await leaveProvider.getLeaveRequestByFilter(context, workCalendarProvider.dayFilterRange);
    await dataStateProvider.getLeaveDataStates();
    workCalendarProvider.updateCalendarData(
        leaveProvider.myListLeaveRequest, attendanceProvider.listAttendances, dataStateProvider.leaveStates);
  }

  @override
  Widget build(BuildContext context) {
    final workCalendarProvider = Provider.of<WorkCalendarProvider>(context, listen: true);
    final settingProvider = Provider.of<SettingProvider>(context, listen: true);
    final attendanceProvider = Provider.of<AttendanceProvider>(context, listen: true);
    final leaveProvider = Provider.of<LeaveProvider>(context, listen: true);
    final dataStateProvider = Provider.of<DataStateProvider>(context, listen: true);
    final CalendarController calendarcontroller = CalendarController();
    return Scaffold(
      appBar: CustomAppBar(
        title: "Calendar",
        leadingIcon: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SfCalendar(
        view: CalendarView.month,
        dataSource: WorkCalendarDataSource(workCalendarProvider.calendarDataSource, settingProvider),
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          showAgenda: true,
          showTrailingAndLeadingDates: false,
        ),
        showNavigationArrow: true,
        allowedViews: const [
          CalendarView.week,
          CalendarView.workWeek,
          CalendarView.month,
        ],
        controller: calendarcontroller,
        onViewChanged: (ViewChangedDetails details) async {
          List<DateTime> dates = details.visibleDates;
          workCalendarProvider.changeDateRange(context, dates[0], dates[dates.length - 1]);
          var userId = await payloadUtil.getUserId();
          await workCalendarProvider.getWorkCalendarByUserId(context);
          await settingProvider.getGlobalWorkingTimes(context);
          await attendanceProvider.getAttendanceRange(userId, workCalendarProvider.dayFilterRange, true, false);
          await leaveProvider.getLeaveRequestByFilter(context, workCalendarProvider.dayFilterRange);
          await dataStateProvider.getLeaveDataStates();
          workCalendarProvider.updateCalendarData(
              leaveProvider.myListLeaveRequest, attendanceProvider.listAttendances, dataStateProvider.leaveStates);
        },
        onTap: (calendarTapDetails) => {onClickWorkingTimeAppoitment(calendarTapDetails, context)},
      ),
    );
  }
}

onClickWorkingTimeAppoitment(CalendarTapDetails calendarTapDetails, BuildContext context) async {
  if (calendarTapDetails.appointments == null || calendarTapDetails.appointments!.isEmpty) return;
  if (calendarTapDetails.appointments![0] is WorkCalendarEntity &&
      calendarTapDetails.targetElement == CalendarElement.appointment) {
        print(calendarTapDetails.appointments![0]);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WorkCalendarDetailScreen(
          workCalendarEntity: calendarTapDetails.appointments![0],
        ),
      ),
    );
  }
}

class WorkCalendarDataSource extends CalendarDataSource {
  SettingProvider settingProvider;
  WorkCalendarDataSource(List<dynamic> source, this.settingProvider) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    DateTime result = DateTime.now();
    if (appointments![index] is WorkCalendarsModel) {
      var morningStartHour =
          settingProvider.morningStartTime != '' ? int.parse(settingProvider.morningStartTime.split(':')[0]) : 0;
      var morningStartMinute =
          settingProvider.morningStartTime != '' ? int.parse(settingProvider.morningStartTime.split(':')[1]) : 0;
      var localDate = appointments![index].workingDate.toLocal();
      result = DateTime(localDate.year, localDate.month, localDate.day, morningStartHour, morningStartMinute);
    }
    if (appointments![index] is LeaveRequestEntity) {
      result = appointments![index].leaveDateFrom.toLocal();
    }
    if (appointments![index] is AttendanceEntity) {
      result = appointments![index].punchinDate.toLocal();
    }
    return result;
  }

  @override
  DateTime getEndTime(int index) {
    DateTime result = DateTime.now();
    if (appointments![index] is WorkCalendarEntity) {
      var lunchHour = int.parse(settingProvider.afternoonStartTime.split(':')[0]) -
          int.parse(settingProvider.morningEndTime.split(':')[0]);
      var morningStartHour =
          settingProvider.morningStartTime != '' ? int.parse(settingProvider.morningStartTime.split(':')[0]) : 0;
      var morningStartMinute =
          settingProvider.morningStartTime != '' ? int.parse(settingProvider.morningStartTime.split(':')[1]) : 0;
      var localDate = appointments![index].workingDate.toLocal();
      result = DateTime(localDate.year, localDate.month, localDate.day, morningStartHour, morningStartMinute);
      var workingMinutes = (appointments![index].workingHour * 60).toInt() + (lunchHour * 60);
      result = result.add(Duration(minutes: workingMinutes));
    }
    if (appointments![index] is LeaveRequestEntity) {
      result = appointments![index].leaveDateTo.toLocal();
    }
    if (appointments![index] is AttendanceEntity) {
      var punchinDate = appointments![index].punchinDate;
      result = appointments![index].punchoutDate?.toLocal() ??
          DateTime(punchinDate.year, punchinDate.month, punchinDate.day, 23, 59);
    }
    return result;
  }

  @override
  String getSubject(int index) {
    var subject = '';
    if (appointments![index] is WorkCalendarEntity) {
      subject = "Working time";
    }
    if (appointments![index] is LeaveRequestEntity) {
      subject = "Leave time";
    }
    if (appointments![index] is AttendanceEntity) {
      subject = "Attendance time";
    }
    return subject;
  }

  @override
  Color getColor(int index) {
    Color color = Colors.blueAccent;
    if (appointments![index] is WorkCalendarEntity) {
      color = Colors.blueAccent;
    }
    if (appointments![index] is LeaveRequestEntity) {
      color = const Color.fromARGB(255, 129, 129, 5);
    }
    if (appointments![index] is AttendanceEntity) {
      color = const Color(0xff32a852);
    }
    return color;
  }

  @override
  bool isAllDay(int index) {
    return false;
  }
}
