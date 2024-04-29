import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/util/payload_util.dart';
import 'package:hrm_mobile/features/attendance/presentation/provider/attendance_provider.dart';
import 'package:provider/provider.dart';

class BarChartAttendance extends StatefulWidget {
  const BarChartAttendance({super.key});

  final Color barBackgroundColor = Colors.white;
  final Color barColor = const Color(0xff0A672A);

  @override
  State<StatefulWidget> createState() => BarChartAttendanceState();
}

class BarChartAttendanceState extends State<BarChartAttendance> {
  final payloadUtil = PayloadUtil();

  @override
  void initState() {
    super.initState();
  }

  Future<void> initData() async {
  }

  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context, listen: true);
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: BarChart(
                showData(attendanceProvider.thisWeekDuration),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y,
  ) {
    return BarChartGroupData(
      showingTooltipIndicators: [0, 0, 0],
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color:  widget.barColor,
          borderRadius: BorderRadius.zero,
          // borderDashArray: x == 0 ? [7, 7] : null,
          width: 22,
          borderSide: BorderSide(color: widget.barColor, width: 2.0),
        ),
      ],
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];

    Widget text = Text(
      days[value.toInt()],
      style: style,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  BarChartData showData(List<double> data) {
    return BarChartData(
      maxY: 24.0,
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,  
          tooltipMargin: 1,
        ),
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(reservedSize: 30, showTitles: true, interval: 3),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
      barGroups: List.generate(
        7,
        (i) => makeGroupData(
          i,
          data[i]
        ),
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 3,
        getDrawingHorizontalLine: (value) => FlLine(
          color: Colors.black.withOpacity(0.2),
          strokeWidth: 1,
        ),
      ),
    );
  }
}
