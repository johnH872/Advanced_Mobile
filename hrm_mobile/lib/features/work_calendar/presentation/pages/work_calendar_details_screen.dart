// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/util/payload_util.dart';
import 'package:hrm_mobile/core/widgets/app_bar_widget.dart';
import 'package:hrm_mobile/features/attendance/presentation/provider/attendance_provider.dart';
import 'package:hrm_mobile/features/leave/presentation/provider/datastate_provider.dart';
import 'package:hrm_mobile/features/leave/presentation/provider/leave_provider.dart';
import 'package:hrm_mobile/features/work_calendar/data/models/work_calendar_detail_model.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/work_calendar_detail_entity.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/work_calendar_entity.dart';
import 'package:hrm_mobile/features/work_calendar/presentation/provider/setting_provider.dart';
import 'package:hrm_mobile/features/work_calendar/presentation/provider/work_calendar_provider.dart';
import 'package:hrm_mobile/features/work_calendar/presentation/widget/add_edit_work_calendar_detail_dialog.dart';
import 'package:hrm_mobile/features/work_calendar/presentation/widget/work_calendar_detail_tile.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class WorkCalendarDetailScreen extends StatefulWidget {
  final WorkCalendarEntity workCalendarEntity;
  const WorkCalendarDetailScreen({required this.workCalendarEntity, super.key});

  @override
  State<WorkCalendarDetailScreen> createState() => _WorkCalendarDetailState();
}

class _WorkCalendarDetailState extends State<WorkCalendarDetailScreen> {
  PayloadUtil payloadUtil = PayloadUtil();
  List<WorkCalendarDetailEntity> workCalendarDetails = [];
  @override
  void initState() {
    workCalendarDetails = [...widget.workCalendarEntity.WorkCalendarDetails ?? []];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Work details",
        leadingIcon: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () async {
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
              if (context.mounted) Navigator.of(context).pop();
            }),
        isDisableBellIcon: true,
        button_1: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => {},
        ),
      ),
      body: ListView.separated(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: workCalendarDetails.length,
        itemBuilder: (context, index) {
          return WorkCalendarDetailTiles(
            title: '${workCalendarDetails[index].from ?? ''} - ${workCalendarDetails[index].to ?? ''}',
            subtitle: workCalendarDetails[index].description ?? '',
            codeColor: workCalendarDetails[index].codeColor ?? '',
            enable: true,
            onTap: () => {
              showDialog<FormGroup>(
                context: context,
                builder: (BuildContext context) => AddEditWorkCalendarDetailDialog(
                  entity: workCalendarDetails[index],
                ),
              ).then(
                (form) {
                  var newWorkCalendarDetail = WorkCalendarDetailModel(
                      workCalendarId: workCalendarDetails[index].workCalendarId,
                      createdAt: workCalendarDetails[index].createdAt,
                      updatedAt: workCalendarDetails[index].updatedAt,
                      workCalendarDetailId: workCalendarDetails[index].workCalendarDetailId,
                      from: DateFormat('hh:mm a').format(form?.control('start').value),
                      to: DateFormat('hh:mm a').format(form?.control('end').value),
                      description: form?.control('description').value,
                      codeColor: form?.control('codeColor').value);
                  setState(() {
                    workCalendarDetails[index] = newWorkCalendarDetail;
                  });
                },
              )
            },
            key: null,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
          );
        },
      ),
    );
  }
}
