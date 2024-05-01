// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:hrm_mobile/features/attendance/presentation/pages/attendance_dashboard_screen.dart';
import 'package:hrm_mobile/features/auth/presentation/pages/home_page.dart';
import 'package:hrm_mobile/features/informations/presentation/pages/employee_detail_screen.dart';
import 'package:hrm_mobile/features/leave/presentation/pages/leave_request_history_screen.dart';

const baseUrl = 'http://$baseIpAddress:5000/api';
const baseIpAddress = "192.168.1.7";
const defaultImageUrl = "https://img.favpng.com/3/21/23/computer-icons-mobile-app-development-android-png-favpng-9xKBGkE07CG2VqArV2AVqGNHk.jpg";
enum SocketEventNames { PUNCHINOUT }
const socketEvents = {
  SocketEventNames.PUNCHINOUT: 'PUNCHINOUT',
};

enum NotificationType { ATTENDANCE_REMINDER }

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



