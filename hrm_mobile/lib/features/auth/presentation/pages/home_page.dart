// ignore_for_file: avoid_print, curly_braces_in_flow_control_structures, library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm_mobile/config/theme/color_schemes.g.dart';
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/util/payload_util.dart';
import 'package:hrm_mobile/features/attendance/presentation/provider/attendance_provider.dart';
import 'package:hrm_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:hrm_mobile/features/auth/presentation/widgets/success_dialog.dart';
import 'package:hrm_mobile/features/leave/presentation/provider/leave_provider.dart';
import 'package:hrm_mobile/features/notification/presentation/provider/notification_provider.dart';
import 'package:hrm_mobile/features/work_calendar/presentation/provider/setting_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DateTime globalCurrentDay = DateTime.now();
  final payloadUtil = PayloadUtil();
  late IO.Socket socket;
  @override
  void initState() {
    initSocket();
    initData();
    super.initState();
  }

  @override
  void dispose() {
    socket.disconnect();
    socket.dispose();
    super.dispose();
  }

  initSocket() async {
    final attendanceProvider = Provider.of<AttendanceProvider>(context, listen: false);
    var userId = await payloadUtil.getUserId();
    socket = IO.io('http://$baseIpAddress:5000', <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      print("Socket Connection established");
    });
    socket.onDisconnect((_) => print("Socket connection Disconnected"));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));

    socket.on(socketEvents[SocketEventNames.PUNCHINOUT]!, (data) {
      bool isPunchIn = data['type'] == 'PUNCHIN';
      if (context.mounted && data['employeeId'] == userId) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => SuccessDialog(
            title: 'Success',
            content: '${isPunchIn ? 'Punch in' : 'Punch out'} sucessfully!',
          ),
        );
        attendanceProvider.getCurrentAttendance(userId);
      }
    });
  }

  Future<void> initData() async {
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);
    final attendanceProvider = Provider.of<AttendanceProvider>(context, listen: false);
    final leaveProvider = Provider.of<LeaveProvider>(context, listen: false);
    var userId = await payloadUtil.getUserId();
    if (!context.mounted) return;
    await settingProvider.getGlobalWorkingTimes(context);
    await leaveProvider.setUpData(null, null, context);
    await attendanceProvider.getCurrentAttendance(userId);
  }

  @override
  Widget build(BuildContext context) {
    final leaveProvider = Provider.of<LeaveProvider>(context, listen: true);
    return Scaffold(
        backgroundColor: Colors.amber[50],
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 370,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 254,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                        color: lightColorScheme.primaryContainer,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(right: 25, top: 40, left: 25, bottom: 20),
                          child: _buildHeaderWidget()),
                    ),
                    Positioned(
                      top: 80.0,
                      left: 0.0,
                      right: 0.0,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 25, top: 40, left: 25, bottom: 20),
                          child: _builderPunchInOutCard()),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: _builderButtonList(context),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: _builderLeaveEntitlement(leaveProvider),
              )
            ],
          ),
        ));
  }

  Widget _buildHeaderWidget() {
    final notificationProvider = Provider.of<NotificationProvider>(context, listen: true);
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is LoggedOutState) {
        Navigator.of(context).pushNamedAndRemoveUntil('/login', (r) => false);
      }
    }, builder: (context, state) {
      if (state is! LoggedOutState) {
        return Column(mainAxisSize: MainAxisSize.min, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 24,
                    backgroundImage: NetworkImage(state.tokenPayLoadEntity!.avatarUrl ?? defaultImageUrl),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      '${state.tokenPayLoadEntity!.firstName ?? ""} ${state.tokenPayLoadEntity!.middleName ?? ""} ${state.tokenPayLoadEntity!.lastName ?? ""}',
                      style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      state.tokenPayLoadEntity!.jobTitle ?? "No position",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    )
                  ]),
                ],
              ),
              // badges.Badge(
              //   badgeContent: Text(notificationProvider.totalUnreadNoti.toString(), style: TextStyle(fontSize: 8),),
              //   showBadge: notificationProvider.totalUnreadNoti > 0,
              //   child: const Icon(Icons.notifications, color: Colors.black),
              //   onTap: () {

              //   },
              // ),
              IconButton(
                  tooltip: "Notifications",
                  onPressed: () {
                    Navigator.of(context).pushNamed('/notifications');
                  },
                  icon: Badge(
                    label: notificationProvider.totalUnreadNoti > 0
                        ? Text(notificationProvider.totalUnreadNoti.toString())
                        : null,
                    child: const Icon(Icons.notifications, color: Colors.black),
                  )),
            ],
          ),
        ]);
      } else {
        return Container();
      }
    });
  }

  Widget _builderPunchInOutCard() {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoggedOutState) {
          Navigator.of(context).pushNamedAndRemoveUntil('/login', (r) => false);
        }
      },
      builder: (context, state) {
        if (state is! LoggedOutState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Card(
                  color: Colors.white,
                  child: SizedBox(
                    width: 100,
                    height: 242,
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Today\'s overview',
                                      style: TextStyle(
                                          color: Color.fromRGBO(72, 68, 67, 40),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      DateFormat("dd MMMM yyyy").format(globalCurrentDay),
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                // Ink(
                                //   decoration: const ShapeDecoration(
                                //     color: Color(0xFF44664D),
                                //     shape: CircleBorder(),
                                //   ),
                                //   child: IconButton(
                                //       icon: const Icon(Icons.alarm_add),
                                //       color: Colors.white,
                                //       onPressed: () => ()),
                                // ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _builderPunchedStatus(),
                          ],
                        )),
                  ),
                ),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _builderPunchedStatus() {
    final attendanceProvider = Provider.of<AttendanceProvider>(context, listen: true);
    final settingProvider = Provider.of<SettingProvider>(context, listen: true);
    return Container(
        width: 340,
        height: 144,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color.fromRGBO(206, 198, 180, 32)),
          color: const Color.fromRGBO(255, 248, 239, 100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Punch in',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      settingProvider.morningStartTime,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    attendanceProvider.punchInRecords.isEmpty
                        ? ButtonTheme(
                            minWidth: 300,
                            height: 100,
                            child: FilledButton(
                                onPressed: () {}, child: const Text('Not yet', style: TextStyle(fontSize: 12))))
                        : OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              DateFormat("HH:mm").format(
                                  attendanceProvider.punchInRecords[attendanceProvider.punchInRecords.length - 1]),
                              style: const TextStyle(fontSize: 12),
                            )),
                  ],
                ),
              ),
            ),
            const VerticalDivider(
              thickness: 1,
              indent: 30,
              endIndent: 30,
              color: Colors.grey,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Punch out',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      settingProvider.afternoonEndTime,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    attendanceProvider.punchoutRecords.isEmpty
                        ? ButtonTheme(
                            minWidth: 300,
                            height: 100,
                            child: FilledButton(
                                onPressed: () {}, child: const Text('Not yet', style: TextStyle(fontSize: 12))))
                        : OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              DateFormat("HH:mm").format(
                                  attendanceProvider.punchoutRecords[attendanceProvider.punchoutRecords.length - 1]),
                              style: const TextStyle(fontSize: 12),
                            )),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _builderButtonList(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          spacing: 30,
          alignment: WrapAlignment.spaceBetween,
          children: [
            // _builderButtonFab(
            //     context,
            //     "Reports",
            //     const Icon(
            //       Icons.analytics,
            //       color: Color(0xff389151),
            //     ),
            //     null),
            // _builderButtonFab(
            //     context,
            //     "Apply leave",
            //     const Icon(
            //       Icons.flight_takeoff,
            //       color: Color(0xff1A3BE7),
            //     ),
            //     null),
            // _builderButtonFab(
            //     context,
            //     "News",
            //     const Icon(
            //       Icons.document_scanner,
            //       color: Color(0xffC47D29),
            //     ),
            //     null),
            // _builderButtonFab(
            //     context,
            //     "Timesheet",
            //     const Icon(
            //       Icons.calendar_month,
            //       color: Color(0xffCA5858),
            //     ),
            //     null),
            _builderButtonFab(
                context,
                "Employee",
                const Icon(
                  Icons.group,
                  color: Color(0xff6EA1EC),
                ),
                '/list-employee'),
            _builderButtonFab(
                context,
                "Leave (+)",
                const Icon(
                  Icons.assignment_ind,
                  color: Color(0xff5457A7),
                ),
                '/leave-request'),
            _builderButtonFab(
                context,
                "Work calendar",
                const Icon(
                  Icons.edit_calendar_outlined,
                  color: Color(0xffAB933F),
                ),
                '/work-calendar'),
            _builderButtonFab(
                context,
                "Others",
                const Icon(
                  Icons.more_horiz,
                  color: Color(0xff389151),
                ),
                null),
          ],
        )
      ],
    );
  }

  Widget _builderButtonFab(BuildContext context, String name, Icon icon, String? url) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (url != null) Navigator.of(context).pushNamed(url);
            },
            backgroundColor: Colors.white,
            elevation: 1,
            foregroundColor: Colors.black,
            heroTag: name,
            child: icon,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget _builderLeaveEntitlement(LeaveProvider leaveProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Card(
            color: Colors.white,
            child: SizedBox(
              width: 100,
              height: 208,
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.timelapse),
                              Text(
                                'Leave balance ',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '(days)',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          // FilledButton(
                          //   onPressed: () {},
                          //   style: const ButtonStyle(
                          //     backgroundColor: MaterialStatePropertyAll<Color>(Color(0xff389151)),
                          //   ),
                          //   child: const Text('Submit leave', style: TextStyle(fontSize: 12)),
                          // )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _builderLeaveEntitlementCard(leaveProvider),
                    ],
                  )),
            ),
          ),
        )
      ],
    );
  }

  Widget _builderLeaveEntitlementCard(LeaveProvider leaveProvider) {
    return Container(
        width: 340,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xff0A672A),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Type',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Available',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Used',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Remain',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Wrap(
                    spacing: 20,
                    children: [
                      Text(
                        'Annually',
                        style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Seniority',
                        style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Transfer',
                        style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'UnPaid',
                        style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 35,
                    children: [
                      Text(
                        leaveProvider.myListLeaveEntilement
                                .where((element) => element.LeaveType?.leaveTypeName == 'Annually')
                                .firstOrNull
                                ?.usableLeave
                                ?.toStringAsFixed(1)
                                .padLeft(4, '0')
                                .toString() ??
                            "00.0",
                        style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        leaveProvider.myListLeaveEntilement
                                .where((element) => element.LeaveType?.leaveTypeName == 'Seniority')
                                .firstOrNull
                                ?.usableLeave
                                ?.toStringAsFixed(1)
                                .padLeft(4, '0')
                                .toString() ??
                            "00.0",
                        style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        leaveProvider.myListLeaveEntilement
                                .where((element) => element.LeaveType?.leaveTypeName == 'Transfer')
                                .firstOrNull
                                ?.usableLeave
                                ?.toStringAsFixed(1)
                                .padLeft(4, '0')
                                .toString() ??
                            "00.0",
                        style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        leaveProvider.myListLeaveEntilement
                                .where((element) => element.LeaveType?.leaveTypeName == 'UnPaid')
                                .firstOrNull
                                ?.usableLeave
                                ?.toStringAsFixed(1)
                                .padLeft(4, '0')
                                .toString() ??
                            "00.0",
                        style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 35,
                    children: [
                      Text(
                        leaveProvider.myListLeaveEntilement
                                .where((element) => element.LeaveType?.leaveTypeName == 'Annually')
                                .firstOrNull
                                ?.usedLeave
                                ?.toStringAsFixed(1)
                                .padLeft(4, '0')
                                .toString() ??
                            "00.0",
                        style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        leaveProvider.myListLeaveEntilement
                                .where((element) => element.LeaveType?.leaveTypeName == 'Seniority')
                                .firstOrNull
                                ?.usedLeave
                                ?.toStringAsFixed(1)
                                .padLeft(4, '0')
                                .toString() ??
                            "00.0",
                        style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        leaveProvider.myListLeaveEntilement
                                .where((element) => element.LeaveType?.leaveTypeName == 'Transfer')
                                .firstOrNull
                                ?.usedLeave
                                ?.toStringAsFixed(1)
                                .padLeft(4, '0')
                                .toString() ??
                            "00.0",
                        style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        leaveProvider.myListLeaveEntilement.isNotEmpty
                            ? leaveProvider.myListLeaveEntilement
                                    .where((element) => element.LeaveType?.leaveTypeName == 'UnPaid')
                                    .firstOrNull
                                    ?.usedLeave
                                    ?.toStringAsFixed(1)
                                    .padLeft(4, '0')
                                    .toString() ??
                                "00.0"
                            : "00.0",
                        style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 35,
                    children: [
                      Text(
                        leaveProvider.remainLeaves[0].toStringAsFixed(1).padLeft(4, '0'),
                        style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        leaveProvider.remainLeaves[1].toStringAsFixed(1).padLeft(4, '0'),
                        style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        leaveProvider.remainLeaves[2].toStringAsFixed(1).padLeft(4, '0'),
                        style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        leaveProvider.remainLeaves[3].toStringAsFixed(1).padLeft(4, '0'),
                        style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
