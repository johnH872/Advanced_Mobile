import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hrm_mobile/config/theme/color_schemes.g.dart';
import 'package:hrm_mobile/core/widgets/app_bar_widget.dart';
import 'package:hrm_mobile/features/attendance/presentation/widget/bar_chart.dart';
import 'package:intl/intl.dart';

class AttendanceDashboardScreen extends StatefulHookWidget {
  const AttendanceDashboardScreen({super.key});

  @override
  State<AttendanceDashboardScreen> createState() => _AttendanceDashboardScreenState();
}

class _AttendanceDashboardScreenState extends State<AttendanceDashboardScreen> {
  late DateTimeRange globalDateRangePicked;
  @override
  void initState() {
    var currentDate = DateTime.now();
    var monday = currentDate.subtract(Duration(days: currentDate.weekday - 1));
    var sunday = currentDate.add(const Duration(days: DateTime.sunday - 1));

    globalDateRangePicked = DateTimeRange(
        start: DateTime(monday.year, monday.month, monday.day, 0, 00),
        end: DateTime(sunday.year, sunday.month, sunday.day, 23, 59));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var glolbalDateState = useState(globalDateRangePicked);
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  Card(
                      // color: Colors.white,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Timesheet Period",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(onPressed: () {
                                    var previousMonday = glolbalDateState.value.start.subtract(const Duration(days: 7));
                                        var previousSunday = glolbalDateState.value.end.subtract(const Duration(days: 7));
                                        glolbalDateState.value = DateTimeRange(start: previousMonday, end: previousSunday);
                                  }, icon: const Icon(Icons.keyboard_arrow_left)),
                                  GestureDetector(
                                    child: Chip(
                                      label: Text(
                                          '${DateFormat("EE, dd MMM yyyy").format(glolbalDateState.value.start)} - ${DateFormat("EE, dd MMM yyyy").format(glolbalDateState.value.end)}'),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        var nextMonday = glolbalDateState.value.start.add(const Duration(days: 7));
                                        var nextSunday = glolbalDateState.value.end.add(const Duration(days: 7));
                                        glolbalDateState.value = DateTimeRange(start: nextMonday, end: nextSunday);
                                      },
                                      icon: const Icon(Icons.keyboard_arrow_right)),
                                ],
                              ),
                            ],
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
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
                                height: 10,
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
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "49.55h",
                                    style:
                                        TextStyle(fontSize: 16, color: Color(0xff0A672A), fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
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
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "49.55h",
                                    style: TextStyle(
                                        fontSize: 16, color: lightColorScheme.primary, fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
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
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "00.00h",
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            ],
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                  const Card(
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
                              BarChartSample8()
                            ],
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ))),
    );
  }
}
