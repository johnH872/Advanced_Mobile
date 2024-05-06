// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/util/payload_util.dart';
import 'package:hrm_mobile/core/widgets/app_bar_widget.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/work_calendar_detail_entity.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/work_calendar_entity.dart';
import 'package:hrm_mobile/features/work_calendar/presentation/provider/work_calendar_provider.dart';
import 'package:hrm_mobile/features/work_calendar/presentation/widget/add_edit_work_calendar_detail_dialog.dart';
import 'package:hrm_mobile/features/work_calendar/presentation/widget/confirm_dialog.dart';
import 'package:hrm_mobile/features/work_calendar/presentation/widget/work_calendar_detail_tile.dart';
import 'package:provider/provider.dart';

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
    final workCalendarProvider = Provider.of<WorkCalendarProvider>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Work details",
        leadingIcon: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              if (context.mounted) Navigator.of(context).pop(true);
            }),
        isDisableBellIcon: true,
        button_1: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => {
            showDialog<WorkCalendarDetailEntity>(
              context: context,
              builder: (BuildContext context) => AddEditWorkCalendarDetailDialog(
                workCalendarEntity: widget.workCalendarEntity,
              ),
            ).then(
              (model) {
                if (model != null) {
                  setState(() {
                    workCalendarDetails = [...workCalendarDetails, model];
                  });
                }
              },
            ),
          },
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
              showDialog<WorkCalendarDetailEntity>(
                context: context,
                builder: (BuildContext context) => AddEditWorkCalendarDetailDialog(
                  workCalendarDetailEntity: workCalendarDetails[index],
                  workCalendarEntity: widget.workCalendarEntity,
                ),
              ).then(
                (model) {
                  if (model != null) {
                    setState(() {
                      workCalendarDetails[index] = model;
                    });
                  }
                },
              ),
            },
            onLongPress: () => {
              showDialog<bool>(
                context: context,
                builder: (BuildContext context) => ConfirmDialog(
                  title: 'Action',
                  content: 'Do you wish to delete this record?',
                  onClickOk: () async {
                    await workCalendarProvider.removeWorkCalendarDetails(
                        context, workCalendarDetails[index].workCalendarDetailId ?? 0);
                  },
                ),
              ).then(
                (isSuccess) {
                  if (isSuccess != null && isSuccess) {
                    setState(() {
                      workCalendarDetails.removeAt(index);
                    });
                  }
                },
              ),
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
