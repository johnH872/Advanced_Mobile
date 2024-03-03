import 'package:flutter/material.dart';
import 'package:hrm_mobile/features/attendance/presentation/pages/anttendance_dashboard_screen.dart';
import 'package:hrm_mobile/features/attendance/presentation/pages/leave_dashboard_screen.dart';
import 'package:hrm_mobile/features/auth/presentation/pages/home_page.dart';
import 'package:hrm_mobile/features/informations/presentation/pages/employee_detail_screen.dart';

const baseUrl = "http://10.0.2.2:5000/api";

/// Bottom navigation configuration.
List<Widget> bottomNavigationScreens() =>
    const [HomePage(), AttendanceDashboardScreen(), LeaveDashboardScreen(), EmployeeDetailScreen(isMyProfile: true,)];

List<NavigationDestination> bottomNavigationItems(BuildContext context) => [
      const NavigationDestination(
        selectedIcon: Icon(Icons.home),
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      const NavigationDestination(
        selectedIcon: Icon(Icons.timer),
        icon: Icon(Icons.timer_rounded),
        label: 'Attendance',
      ),
      const NavigationDestination(
        selectedIcon: Icon(Icons.calendar_month),
        icon: Icon(Icons.calendar_month_outlined),
        label: 'Leave',
      ),
      const NavigationDestination(
        selectedIcon: Icon(Icons.person),
        icon: Icon(Icons.person_2_outlined),
        label: 'Profile',
      ),
];
