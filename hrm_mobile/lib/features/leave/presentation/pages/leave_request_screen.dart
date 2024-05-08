import 'package:flutter/material.dart';
import 'package:hrm_mobile/config/theme/color_schemes.g.dart';
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/constants/enums.dart';
import 'package:hrm_mobile/core/widgets/app_bar_widget.dart';
import 'package:hrm_mobile/features/informations/domain/entity/user_entity.dart';
import 'package:hrm_mobile/features/leave/domain/entity/leave_request_entity.dart';
import 'package:hrm_mobile/features/leave/presentation/provider/leave_provider.dart';
import 'package:hrm_mobile/features/leave/presentation/widget/date_time_range_picker_dialog.dart';
import 'package:hrm_mobile/features/leave/presentation/widget/radio_list_dialog.dart';
import 'package:hrm_mobile/features/leave/presentation/widget/text_area_dialog.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaveRequestScreen extends StatefulWidget {
  final UserEntity? userEntity;
  final LeaveRequestEntity? leaveRequestEntity;
  const LeaveRequestScreen({super.key, this.userEntity, this.leaveRequestEntity});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  late SharedPreferences prefs;
  late LeaveActionType leaveActionType;
  late bool isEditOption;
  @override
  void initState() {
    if (widget.userEntity == null) {
      leaveActionType = LeaveActionType.submitLeave;
    } else {
      leaveActionType = LeaveActionType.assignLeave;
    }
    isEditOption = widget.leaveRequestEntity != null;
    initData();
    super.initState();
  }

  Future<void> initData() async {
    final leaveProvider = Provider.of<LeaveProvider>(context, listen: false);
    leaveProvider.setUpInitProviderData( widget.leaveRequestEntity);
    await leaveProvider.setUpData(widget.userEntity, widget.leaveRequestEntity, context);
}

  @override
  Widget build(BuildContext context) {
    final leaveProvider = Provider.of<LeaveProvider>(context, listen: true);
    Future<void> onEditDateRange() async {
      showDialog<FormGroup>(
        context: context,
        builder: (BuildContext context) => DateTimeRangePickerDialog(
            title: "Leave type",
            start: leaveProvider.leaveRequestEntity.leaveDateFrom ?? DateTime.now(),
            end: leaveProvider.leaveRequestEntity.leaveDateTo ?? DateTime.now()),
      ).then((formRes) {
        if (formRes != null) {
          leaveProvider.leaveRequestEntity.leaveDateFrom = formRes.control('start').value;
          leaveProvider.leaveRequestEntity.leaveDateTo = formRes.control('end').value;
          // Duration difference = (_form.control('leaveDateFrom').value as DateTime).difference(_form.control('leaveDateTo').value);
          leaveProvider.notifyChanges();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something wrong happened!")));
        }
      });
    }

    void onEditSession() {
      DateTime currentDate = DateTime.now();
      List<String> allKeys = leaveSessions.keys.toList();
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => RadioList(
            title: "Leave type", list: allKeys, selectedValue: leaveProvider.leaveRequestEntity.session ?? allKeys[0]),
      ).then((value) {
        if (value == null) return;
        leaveProvider.leaveRequestEntity.session = value;
        leaveProvider.leaveRequestEntity.numberOfHour = leaveSessions[value];
        switch (value) {
          case ("Morning"):
            leaveProvider.leaveRequestEntity.leaveDateFrom =
                DateTime(currentDate.year, currentDate.month, currentDate.day, 8, 30);
            leaveProvider.leaveRequestEntity.leaveDateTo =
                DateTime(currentDate.year, currentDate.month, currentDate.day, 13, 30);
            break;
          case ("Afternoon"):
            leaveProvider.leaveRequestEntity.leaveDateFrom =
                DateTime(currentDate.year, currentDate.month, currentDate.day, 13, 00);
            leaveProvider.leaveRequestEntity.leaveDateTo =
                DateTime(currentDate.year, currentDate.month, currentDate.day, 17, 30);
            break;
          default:
            leaveProvider.leaveRequestEntity.leaveDateFrom =
                DateTime(currentDate.year, currentDate.month, currentDate.day, 8, 30);
            leaveProvider.leaveRequestEntity.leaveDateTo =
                DateTime(currentDate.year, currentDate.month, currentDate.day, 17, 30);
            break;
        }
        leaveProvider.notifyChanges();
      });
    }

    return Scaffold(
        backgroundColor: const Color.fromRGBO(249, 248, 244, 11),
        appBar: CustomAppBar(
          title: leaveActionType == LeaveActionType.submitLeave ? isEditOption ? "Edit leave": "Submit leave" : "Assign leave",
          leadingIcon: null,
          button_1: isEditOption
              ? null
              : IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: 'refresh',
                  onPressed: () {
                    leaveProvider.setUpInitProviderData(widget.leaveRequestEntity);
                    leaveProvider.notifyChanges();
                  }),
          isDisableBellIcon: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                leaveActionType == LeaveActionType.submitLeave
                    ? Flexible(
                        child: Container(
                            color: Colors.white,
                            child: const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.next_week_rounded,
                                    color: Color(0xff389151),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Leave budget",
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                            )))
                    : Container(),
                leaveActionType == LeaveActionType.assignLeave
                    ? Flexible(
                        child: Container(
                            color: Colors.white,
                            child: const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.account_circle_rounded,
                                    size: 27,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Employee",
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                            )))
                    : Container(),
                const SizedBox(
                  height: 2,
                ),
                leaveActionType == LeaveActionType.assignLeave
                    ? Flexible(
                        child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 40),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  CircleAvatar(
                                      radius: 12,
                                      backgroundImage: NetworkImage(widget.userEntity?.avatarUrl ?? defaultImageUrl)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${widget.userEntity?.firstName ?? ""} ${widget.userEntity?.middleName ?? ""} ${widget.userEntity?.lastName ?? ""}',
                                    style: const TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            )))
                    : Container(),
                Flexible(
                    child: Container(
                  margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  height: 98,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: leaveProvider.listLeaveType.length,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            Card(
                                color: Colors.white,
                                surfaceTintColor: Colors.white,
                                elevation: 2,
                                child: SizedBox(
                                  width: 100,
                                  height: 85,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        leaveProvider.listLeaveType[index].leaveTypeName ?? "",
                                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                                      ),
                                      Text(
                                          leaveProvider.myListLeaveEntilement
                                                  .where((element) =>
                                                      element.leaveTypeId ==
                                                      leaveProvider.listLeaveType[index].leaveTypeId)
                                                  .firstOrNull
                                                  ?.usableLeave
                                                  .toString() ??
                                              "0",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              color: lightColorScheme.primary)),
                                      const Text("Day(s) available", style: TextStyle(fontSize: 10))
                                    ],
                                  ),
                                ))
                          ],
                        );
                      }),
                )),
                Flexible(
                    child: GestureDetector(
                        onTap: () {
                          if (leaveProvider.availableListTypeNames.isEmpty ||
                              leaveProvider.leaveTypeName == "No available") return;
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => RadioList(
                                title: "Leave type",
                                list: leaveProvider.availableListTypeNames,
                                selectedValue: leaveProvider.leaveTypeName),
                          ).then((value) {
                            if (value == null) return;
                            setState(() {
                              leaveProvider.leaveTypeName = value;
                            });
                            var index = leaveProvider.availableListTypeNames.indexOf(value);
                            leaveProvider.leaveRequestEntity.leaveEntitlementId = leaveProvider.myListLeaveEntilement
                                .where((element) => element.leaveTypeId == leaveProvider.availableListTypeIds[index])
                                .first
                                .leaveEntitlementId;
                          });
                        },
                        child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(Icons.content_paste_go_rounded),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Leave type",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    leaveProvider.leaveTypeName,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            )))),
                const SizedBox(
                  height: 4,
                ),
                Flexible(
                    child: GestureDetector(
                        onTap: () {
                          onEditSession();
                        },
                        child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.access_time),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Duration: ",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.av_timer_rounded),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Number of Hours:",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        leaveProvider.leaveRequestEntity.session ?? leaveSessions.keys.first,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 37,
                                      ),
                                      Text(
                                        '${leaveProvider.leaveRequestEntity.numberOfHour}h',
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  const Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            )))),
                const SizedBox(
                  height: 6,
                ),
                Flexible(
                    child: GestureDetector(
                        onTap: () async {
                          onEditDateRange();
                        },
                        child: Container(
                            color: Colors.white,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.today),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Request Days(s)",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            )))),
                const SizedBox(
                  height: 4,
                ),
                Flexible(
                    child: GestureDetector(
                        onTap: () {
                          onEditDateRange();
                        },
                        child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 55),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "From: ",
                                        style: TextStyle(fontSize: 14, color: Color(0xff787777)),
                                      ),
                                      Text(
                                        "To: ",
                                        style: TextStyle(fontSize: 14, color: Color(0xff787777)),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        DateFormat('EEE, dd MMM yyyy HH:mm')
                                            .format(leaveProvider.leaveRequestEntity.leaveDateFrom as DateTime),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF705D00)),
                                      ),
                                      Text(
                                        DateFormat('EEE, dd MMM yyyy HH:mm')
                                            .format(leaveProvider.leaveRequestEntity.leaveDateTo as DateTime),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF705D00)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )))),
                const SizedBox(
                  height: 4,
                ),
                Flexible(
                    child: GestureDetector(
                        onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                TextArea(title: "Note", value: leaveProvider.leaveRequestEntity.note ?? ""),
                          ).then((value) {
                            leaveProvider.leaveRequestEntity.note = value ?? leaveProvider.leaveRequestEntity.note;
                            leaveProvider.notifyChanges();
                          });
                        },
                        child: Container(
                            color: Colors.white,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.note_outlined),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Note",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            )))),
                const SizedBox(
                  height: 2,
                ),
                Flexible(
                    child: GestureDetector(
                        onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                TextArea(title: "Note", value: leaveProvider.leaveRequestEntity.note ?? ""),
                          ).then((value) {
                            leaveProvider.leaveRequestEntity.note = value ?? leaveProvider.leaveRequestEntity.note;
                            leaveProvider.notifyChanges();
                          });
                        },
                        child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                      child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    leaveProvider.leaveRequestEntity.note ?? "...",
                                    style: const TextStyle(fontSize: 14),
                                    maxLines: 4,
                                  )),
                                ],
                              ),
                            )))),
                const SizedBox(
                  height: 6,
                ),
                Flexible(
                    child: GestureDetector(
                        onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                TextArea(title: "Reason", value: leaveProvider.leaveRequestEntity.reason ?? ""),
                          ).then((value) {
                            leaveProvider.leaveRequestEntity.reason = value ?? leaveProvider.leaveRequestEntity.reason;
                            leaveProvider.notifyChanges();
                          });
                        },
                        child: Container(
                            color: Colors.white,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.chat_outlined),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Reason",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            )))),
                const SizedBox(
                  height: 2,
                ),
                Flexible(
                    child: GestureDetector(
                        onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                TextArea(title: "Reason", value: leaveProvider.leaveRequestEntity.reason ?? ""),
                          ).then((value) {
                            leaveProvider.leaveRequestEntity.reason = value ?? leaveProvider.leaveRequestEntity.reason;
                            leaveProvider.notifyChanges();
                          });
                        },
                        child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                      child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    leaveProvider.leaveRequestEntity.reason ?? "...",
                                    style: const TextStyle(fontSize: 14),
                                    maxLines: 4,
                                  )),
                                ],
                              ),
                            )))),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
            child: leaveProvider.isSaving
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : FilledButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(40),
                    ),
                    onPressed: () async {
                      await leaveProvider.saveLeaveRequest(context);
                    },
                    child: Text( leaveActionType == LeaveActionType.submitLeave ? isEditOption ? "Change leave info" : "Submit leave" : "Assign leave"),
                  )));
  }
}
