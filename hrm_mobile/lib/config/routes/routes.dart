import 'package:flutter/material.dart';
import 'package:hrm_mobile/features/auth/presentation/pages/app_navigator.dart';
import 'package:hrm_mobile/features/auth/presentation/pages/auth/change_password_screen.dart';
import 'package:hrm_mobile/features/auth/presentation/pages/auth/login_screen.dart';
import 'package:hrm_mobile/features/auth/presentation/pages/auth/request_password_screen.dart';
import 'package:hrm_mobile/features/auth/presentation/pages/auth/validate_otp_screen.dart';
import 'package:hrm_mobile/features/informations/presentation/pages/employee_list_screen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {

    switch (settings.name) {
      // Auth routes
      case '/login':
        return _materialRoute(const LoginScreen());
      
      case '/forgot-password':
        return _materialRoute(const RequestPasswordScreen());
      
      case '/validate-otp':
        var listArgs = settings.arguments as List;
        var email = listArgs[0].toString();
        return _materialRoute(ValidateOTPScreen(email: email));

      case '/change-password':
        var listArgs = settings.arguments as List;
        var email = listArgs[0].toString();
        return _materialRoute(ChangePasswordScreen(email: email,));

      // App routes
      case '/home':
        return _materialRoute(const AppNavigator());

      case '/list-employee':
        return _materialRoute(const ListEmployeeScreen());


      default:
        return _materialRoute(const LoginScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}