// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:hrm_mobile/features/attendance/presentation/pages/attendance_dashboard_screen.dart';
import 'package:hrm_mobile/features/auth/presentation/pages/home_page.dart';
import 'package:hrm_mobile/features/informations/presentation/pages/employee_detail_screen.dart';
import 'package:hrm_mobile/features/leave/presentation/pages/leave_request_history_screen.dart';

const baseUrl = 'http://$baseIpAddress:5000/api';
const baseIpAddress = "10.0.2.2";
const defaultImageUrl = "https://img.favpng.com/3/21/23/computer-icons-mobile-app-development-android-png-favpng-9xKBGkE07CG2VqArV2AVqGNHk.jpg";
enum SocketEventNames { PUNCHINOUT }
const socketEvents = {
  SocketEventNames.PUNCHINOUT: 'PUNCHINOUT',
};

enum NotificationType { ATTENDANCE_REMINDER, LEAVE_REQUEST, ATTENDANCE_REPORT }

/// Bottom navigation configuration.
List<Widget> bottomNavigationScreens() =>
    const [HomePage(), AttendanceDashboardScreen(), LeaveRequestHistoryScreen(), EmployeeDetailScreen(isMyProfile: true,)];

List<NavigationDestination> bottomNavigationItems(BuildContext context) => [
      const NavigationDestination(
        selectedIcon: Icon(Icons.home),
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      const NavigationDestination(
        selectedIcon: Icon(Icons.timer),
        icon: Icon(Icons.timer_outlined),
        label: 'Attendance',
      ),
      const NavigationDestination(
        selectedIcon: Icon(Icons.calendar_month),
        icon: Icon(Icons.calendar_month_outlined),
        label: 'Leave',
      ),
      const NavigationDestination(
        selectedIcon: Icon(Icons.person_2),
        icon: Icon(Icons.person_2_outlined),
        label: 'Profile',
      ),
];

Map<String, double> get leaveSessions => {
  "Entire day": 8.0,
  "Morning": 4,
  "Afternoon": 4
};

const kPrimaryColor = Color(0xFFFF8084);
const kAccentColor = Color(0xFFF1F1F1);
const kWhiteColor = Color(0xFFFFFFFF);
const kLightColor = Color(0xFF808080);
const kDarkColor = Color(0xFF303030);
const kTransparent = Colors.transparent;
const String logo = './assets/images/processing-time.png';


