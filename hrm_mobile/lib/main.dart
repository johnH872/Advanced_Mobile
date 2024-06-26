import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm_mobile/config/routes/routes.dart';
import 'package:hrm_mobile/config/theme/color_schemes.g.dart';
import 'package:hrm_mobile/config/theme/typography.dart';
import 'package:hrm_mobile/features/attendance/presentation/provider/attendance_provider.dart';
import 'package:hrm_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:hrm_mobile/features/auth/presentation/pages/app_navigator.dart';
import 'package:hrm_mobile/features/auth/presentation/pages/auth/login_screen.dart';
import 'package:hrm_mobile/features/informations/presentation/provider/user_provider.dart';
import 'package:hrm_mobile/features/leave/presentation/provider/datastate_provider.dart';
import 'package:hrm_mobile/features/leave/presentation/provider/leave_provider.dart';
import 'package:hrm_mobile/features/notification/presentation/provider/notification_provider.dart';
import 'package:hrm_mobile/features/work_calendar/presentation/provider/setting_provider.dart';
import 'package:hrm_mobile/features/work_calendar/presentation/provider/work_calendar_provider.dart';
import 'package:hrm_mobile/injection_container.dart' as di;
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.initializeDependencies();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Remove top bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    // Custom messages
    return ReactiveFormConfig(
        validationMessages: {
          'required': (error) => 'This field is required',
          'email': (error) => 'Email is not valid',
          'alpha': (error) => 'Only alphabets are allowed',
          'alphaNumeric': (error) => 'Only alphabet and numbers are allowed',
          'compare': (error) => 'Wrong input',
          'contains': (error) => 'Value is not contained in the input',
          'creditcard': (error) => 'Credit card number is not correct',
          'digit': (error) => 'Only digits are allowed',
          'greaterThanEqualTo': (error) => 'Please enter greater than or equal to the joining age',
          'greaterThan': (error) => 'Please enter greater than the joining age',
          'hexColor': (error) => 'Please enter hex code',
          'json': (error) => 'Please enter valid JSON',
          'lessThanEqualTo': (error) => 'Please enter less than or equal to the current experience',
          'lessThan': (error) => 'Please enter less than the current experience',
          'lowerCase': (error) => 'Only lowercase is allowed',
          'maxLength': (error) => 'Maximum length is ${(error as Map)['requiredLength']} characters',
          'maxNumber': (error) => 'Enter value less than or equal to ${(error as Map)['max']}',
          'minNumber': (error) => 'Enter value greater than or equal to ${(error as Map)['min']}',
          'password': (error) => 'Please enter a valid password',
          'pattern': (error) => 'Please enter a valid ZIP code',
          'range': (error) => 'Please enter a value between ${(error as Map)['min']} and ${(error)['max']}',
          'time': (error) => 'Only time format is allowed',
          'upperCase': (error) => 'Only uppercase is allowed',
          'url': (error) => 'Only URL format is allowed',
          'zipCode': (error) => 'Enter valid ZIP code',
          'minLength': (error) => 'Minimum length is ${(error as Map)['requiredLength']} characters',
          'numberic': (error) => 'Only numeric is allowed',
          'musMatch': (error) => 'This field is not match'
        },
        child: BlocProvider(
            create: (context) => di.sl<AuthBloc>()..add(CheckLoggingInEvent()),
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider<UserProvider>(
                  create: (_) => di.sl<UserProvider>(),
                ),
                ChangeNotifierProvider<AttendanceProvider>(
                  create: (_) => di.sl<AttendanceProvider>(),
                ),
                ChangeNotifierProvider<LeaveProvider>(
                  create: (_) => di.sl<LeaveProvider>(),
                ),
                ChangeNotifierProvider<NotificationProvider>(
                  create: (_) => di.sl<NotificationProvider>(),
                ),
                ChangeNotifierProvider<WorkCalendarProvider>(
                  create: (_) => di.sl<WorkCalendarProvider>(),
                ),
                ChangeNotifierProvider<SettingProvider>(
                  create: (_) => di.sl<SettingProvider>(),
                ),
                ChangeNotifierProvider<DataStateProvider>(
                  create: (_) => di.sl<DataStateProvider>(),
                ),
              ],
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is LoggedInState) {
                    return GlobalLoaderOverlay(
                        overlayColor: Colors.black.withOpacity(0.3),
                        overlayWidgetBuilder: (_) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: lightColorScheme.primary,
                          ));
                        },
                        useDefaultLoading: false,
                        child: MaterialApp(
                            theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
                            darkTheme:
                                ThemeData(useMaterial3: true, colorScheme: darkColorScheme, textTheme: textTheme),
                            debugShowCheckedModeBanner: false,
                            onGenerateRoute: AppRoutes.onGenerateRoutes,
                            home: const AppNavigator()));
                  } else {
                    return GlobalLoaderOverlay(
                        overlayColor: Colors.black.withOpacity(0.3),
                        overlayWidgetBuilder: (_) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: lightColorScheme.primary,
                          ));
                        },
                        useDefaultLoading: false,
                        child: MaterialApp(
                            navigatorKey: navigatorKey,
                            theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
                            darkTheme:
                                ThemeData(useMaterial3: true, colorScheme: darkColorScheme, textTheme: textTheme),
                            debugShowCheckedModeBanner: false,
                            onGenerateRoute: AppRoutes.onGenerateRoutes,
                            home: const LoginScreen()));
                  }
                },
              ),
            )));
  }
}
