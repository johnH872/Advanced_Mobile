import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm_mobile/config/routes/routes.dart';
import 'package:hrm_mobile/config/theme/color_schemes.g.dart';
import 'package:hrm_mobile/config/theme/typography.dart';
import 'package:hrm_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:hrm_mobile/features/auth/presentation/pages/auth/login_screen.dart';
import 'package:hrm_mobile/features/auth/presentation/pages/home_page.dart';
import 'package:hrm_mobile/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initializeDependencies();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return BlocProvider(
      create: (context) => di.sl<AuthBloc>()..add(CheckLoggingInEvent()),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if(state is LoggedInState) {
             return MaterialApp(
              theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
              darkTheme: ThemeData(
                  useMaterial3: true,
                  colorScheme: darkColorScheme,
                  textTheme: textTheme),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRoutes.onGenerateRoutes,
              home: const HomePage()
            );
          } else {
            return MaterialApp(
              theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
              darkTheme: ThemeData(
                  useMaterial3: true,
                  colorScheme: darkColorScheme,
                  textTheme: textTheme),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRoutes.onGenerateRoutes,
              home: const LoginScreen()
            );
          }
        },
      ),
    );
  }
}
