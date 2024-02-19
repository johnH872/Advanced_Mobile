import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrm_mobile/constants/color_schemes.g.dart';
import 'package:hrm_mobile/constants/typography.dart';
import 'package:hrm_mobile/features/auth/login/login_screen.dart';
import 'package:hrm_mobile/features/home/home_page.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(token: prefs.getString('accessToken'),));
}

class MyApp extends StatelessWidget {
  final token;
  const MyApp({@required this.token, super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          textTheme: textTheme),
      debugShowCheckedModeBanner: false,
      routes: {
        '/homepage': (context) => HomePage(acccessToken: token),
        '/login': (context) => const LoginScreen(),
        '/main':(context) => MyApp(token: token)
      },
      home:(JwtDecoder.tryDecode(token ?? "") != null) ? (JwtDecoder.isExpired(token ?? "")==false) ? HomePage(acccessToken: token) : 
      const LoginScreen() : const LoginScreen()
    );
  }
}
