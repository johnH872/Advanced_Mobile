import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hrm_mobile/config/theme/color_schemes.g.dart';
import 'package:hrm_mobile/core/util/payload_util.dart';
import 'package:hrm_mobile/core/widgets/app_bar_widget.dart';
import 'package:hrm_mobile/features/attendance/presentation/provider/attendance_provider.dart';
import 'package:hrm_mobile/features/attendance/presentation/widget/bar_chart.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AttendanceDashboardScreen extends StatefulHookWidget {
  const AttendanceDashboardScreen({super.key});

  @override
  State<AttendanceDashboardScreen> createState() => _AttendanceDashboardScreenState();
}

class _AttendanceDashboardScreenState extends State<AttendanceDashboardScreen> {
  late DateTimeRange globalDateRangePicked;
  final payloadUtil = PayloadUtil();
  final TextEditingController filterDateRangeController = TextEditingController();

  @override
  void initState() {
    initData();
    super.initState();
  }

  Future<void> initData() async {
    var userId = await payloadUtil.getUserId();
    if (!context.mounted) return;
    final attendanceProvider = Provider.of<AttendanceProvider>(context, listen: false);
    filterDateRangeController.text =
        '${DateFormat('dd/MM/yyyy').format(attendanceProvider.listFilterRange.start)} - ${DateFormat('dd/MM/yyyy').format(attendanceProvider.listFilterRange.end)}';
    await attendanceProvider.initialAttendanceFilter(userId, context);
  }

  Future<void> selectDate(AttendanceProvider attendanceProvider) async {
    var userId = await payloadUtil.getUserId();
    if (!context.mounted) return;
    DateTimeRange? dateRangePick =
        await showDateRangePicker(context: context, firstDate: DateTime(2020), lastDate: DateTime(2030));
    if (dateRangePick == null) return;

    dateRangePick = DateTimeRange(
        start: DateTime(dateRangePick.start.year, dateRangePick.start.month, dateRangePick.start.day, 0, 00),
        end: DateTime(dateRangePick.end.year, dateRangePick.end.month, dateRangePick.end.day, 23, 59));
    filterDateRangeController.text =
        '${DateFormat('dd/MM/yyyy').format(dateRangePick.start)} - ${DateFormat('dd/MM/yyyy').format(dateRangePick.end)}';

    if (mounted) attendanceProvider.changeListFilter(userId, dateRangePick.start, dateRangePick.end, context);
  }

  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context, listen: true);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Timesheet",
        leadingIcon: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Card(
                        color: Colors.white,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Timesheet Period",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          var userId = await payloadUtil.getUserId();
                                          if (context.mounted) {
                                            attendanceProvider.changeWeekFilter(false, userId, context);
                                          }
                                        },
                                        icon: const Icon(Icons.keyboard_arrow_left)),
                                    GestureDetector(
                                      child: Chip(
                                        label: Text(
                                          '${DateFormat("EE, dd MMM yyyy").format(attendanceProvider.weekFilterRange.start)} - ${DateFormat("EE, dd MMM yyyy").format(attendanceProvider.weekFilterRange.end)}',
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          var userId = await payloadUtil.getUserId();
                                          if (context.mounted) {
                                            attendanceProvider.changeWeekFilter(true, userId, context);
                                          }
                                        },
                                        icon: const Icon(Icons.keyboard_arrow_right)),
                                  ],
                                ),
                              ],
                            ))),
                  ),
                  const Flexible(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  Flexible(
                    child: Card(
                        // color: Colors.white,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Timesheet Period",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          color: Color(0xff0A672A),
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Hours required: ",
                                          style: TextStyle(fontSize: 14),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "49.55h",
                                      style: TextStyle(
                                          fontSize: 14, color: Color(0xff0A672A), fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          color: lightColorScheme.primary,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "Hours Worked: ",
                                          style: TextStyle(fontSize: 14),
                                        )
                                      ],
                                    ),
                                    Text(
                                      '${attendanceProvider.thisWeekDuration.reduce((value, element) => value + element).toStringAsFixed(2).padLeft(5, '0')}h',
                                      style: TextStyle(
                                          fontSize: 14, color: lightColorScheme.primary, fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Hours on Leave: ",
                                          style: TextStyle(fontSize: 14),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "00.00h",
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )
                              ],
                            ))),
                  ),
                  const Flexible(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  const Flexible(
                    child: Card(
                        // color: Colors.white,
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Daily hours",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                                BarChartAttendance()
                              ],
                            ))),
                  ),
                  const Flexible(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  const Flexible(
                    child: Text(
                      "Attendance History",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: TextField(
                          controller: filterDateRangeController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Filter by date',
                            suffixIcon: Icon(Icons.calendar_month_outlined),
                          ),
                          onTap: () {
                            selectDate(attendanceProvider);
                          },
                      ),
                    ),
                  ),
                  const Flexible(
                    flex: 0,
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: ListTile(
                        tileColor: Colors.grey[300],
                        onTap: null,
                        leading: null,
                        title: const Row(children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                "Punchin Date",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                              )),
                          Expanded(
                              flex: 1,
                              child:
                                  Text("Punchout Date", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
                          Flexible(
                              flex: 0,
                              child: Text("Duration", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
                        ]),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: attendanceProvider.listAttendances.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
                              onTap: () {},
                              title: Row(children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      DateFormat('dd MMM, yy').format(
                                          attendanceProvider.listAttendances[index].punchinDate ?? DateTime.now()),
                                      style: const TextStyle(color: Colors.black, fontSize: 15),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                        DateFormat('dd MMM, yy').format(
                                            attendanceProvider.listAttendances[index].punchoutDate ?? DateTime.now()),
                                        style: const TextStyle(color: Colors.black, fontSize: 15))),
                                Flexible(
                                    flex: 0,
                                    child: Text(
                                        attendanceProvider.listAttendances[index].duration?.toStringAsFixed(2).padLeft(5, '0') ?? '0',
                                        style: const TextStyle(color: Colors.black, fontSize: 15)))
                              ]));
                        },
                        separatorBuilder: (BuildContext context, int index) => const Divider(
                          height: 0.0,
                        ),
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
