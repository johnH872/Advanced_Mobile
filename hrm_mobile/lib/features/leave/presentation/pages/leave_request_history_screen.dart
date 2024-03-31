import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/widgets/app_bar_widget.dart';
import 'package:hrm_mobile/features/leave/presentation/pages/leave_request_screen.dart';
import 'package:hrm_mobile/features/leave/presentation/provider/leave_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaveRequestHistoryScreen extends StatefulWidget {
  const LeaveRequestHistoryScreen({super.key});

  @override
  State<LeaveRequestHistoryScreen> createState() => _LeaveRequestHistoryScreenState();
}

class _LeaveRequestHistoryScreenState extends State<LeaveRequestHistoryScreen> {
  late SharedPreferences prefs;
  final TextEditingController filterDateRangeController = TextEditingController();
  late DateTimeRange? globalDateRangePicked;

  @override
  void initState() {
    var currentDate = DateTime.now();
    globalDateRangePicked = DateTimeRange(
        start: DateTime(currentDate.year, currentDate.month, currentDate.day, 0, 00),
        end: DateTime(currentDate.year, currentDate.month, currentDate.day, 23, 59));
    filterDateRangeController.text =
        '${DateFormat('dd/MM/yyyy').format(globalDateRangePicked!.start)} - ${DateFormat('dd/MM/yyyy').format(globalDateRangePicked!.end)}';
    initData(globalDateRangePicked);
    super.initState();
  }

  Future<void> initData(DateTimeRange? dateTimeRange) async {
    final leaveProvider = Provider.of<LeaveProvider>(context, listen: false);
    await leaveProvider.getLeaveRequestByFilter(context, dateTimeRange);
  }

  @override
  Widget build(BuildContext context) {
    final leaveProvider = Provider.of<LeaveProvider>(context, listen: true);

    Future<void> selectDate() async {
      globalDateRangePicked =
          await showDateRangePicker(context: context, firstDate: DateTime(2020), lastDate: DateTime(2030));

      if (globalDateRangePicked != null) {
        globalDateRangePicked = DateTimeRange(
            start: DateTime(globalDateRangePicked!.start.year, globalDateRangePicked!.start.month,
                globalDateRangePicked!.start.day, 0, 00),
            end: DateTime(globalDateRangePicked!.end.year, globalDateRangePicked!.end.month,
                globalDateRangePicked!.end.day, 23, 59));
        filterDateRangeController.text =
            '${DateFormat('dd/MM/yyyy').format(globalDateRangePicked!.start)} - ${DateFormat('dd/MM/yyyy').format(globalDateRangePicked!.end)}';

        if (mounted) leaveProvider.getLeaveRequestByFilter(context, globalDateRangePicked);
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(112, 234, 233, 228),
      appBar: CustomAppBar(
        title: "My leave request",
        leadingIcon: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        button_1: IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'refresh',
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const LeaveRequestScreen()))
                  .then((value) => {leaveProvider.getLeaveRequestByFilter(context, globalDateRangePicked)});
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Flexible(
              flex: 0,
              child: Text(
                "Leave Request Info",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              flex: 0,
              child: TextField(
                controller: filterDateRangeController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Filter by date',
                  suffixIcon: Icon(Icons.calendar_month_outlined),
                ),
                onTap: () {
                  selectDate();
                },
              ),
            ),
            const Flexible(
                flex: 0,
                child: SizedBox(
                  height: 30,
                )),
            Flexible(
                flex: 0,
                child: ListTile(
                  tileColor: Colors.grey[300],
                  onTap: null,
                  leading: null,
                  title: const Row(children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                          "From",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Expanded(flex: 1, child: Text("To", style: TextStyle(fontWeight: FontWeight.bold))),
                    Flexible(flex: 0, child: Text("Status   ", style: TextStyle(fontWeight: FontWeight.bold))),
                  ]),
                )),
            Expanded(
              flex: 1,
              child: ListView.separated(
                itemCount: leaveProvider.myListLeaveRequest.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: (_) =>
                                    LeaveRequestScreen(leaveRequestEntity: leaveProvider.myListLeaveRequest[index])))
                            .then((value) => {leaveProvider.getLeaveRequestByFilter(context, globalDateRangePicked)});
                      },
                      title: Row(children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Text(
                              DateFormat('dd MMM, yy')
                                  .format(leaveProvider.myListLeaveRequest[index].leaveDateFrom ?? DateTime.now()),
                              style: const TextStyle(color: Colors.black),
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                                DateFormat('dd MMM, yy')
                                    .format(leaveProvider.myListLeaveRequest[index].leaveDateTo ?? DateTime.now()),
                                style: const TextStyle(color: Colors.black))),
                        const Flexible(flex: 0, child: Text("Status   ", style: TextStyle(color: Colors.black))),
                      ]));
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(
                  height: 0.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
