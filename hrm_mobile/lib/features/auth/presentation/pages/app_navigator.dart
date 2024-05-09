import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/features/auth/presentation/bloc/cubit/app_cubit.dart';
import 'package:hrm_mobile/features/notification/presentation/provider/notification_provider.dart';
import 'package:hrm_mobile/injection_container.dart' as di;
import 'package:provider/provider.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> _firbaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('_firbaseMessagingBackgroundHandler: ${message.data}');
}

class _AppNavigatorState extends State<AppNavigator> {
  @override
  void initState() {
    initData();
    initFirebase();
    super.initState();
  }

  Future<void> initData() async {
    final notificationProvider = Provider.of<NotificationProvider>(context, listen: false);
    notificationProvider.getAllNotifications(context);
  }

  initFirebase() async {
    final notificationProvider = Provider.of<NotificationProvider>(context, listen: false);
    FirebaseMessaging.instance.getToken().then((value) {
      notificationProvider.saveFcmToken(context, value ?? '');
      print('getToken: $value');
    });

    FirebaseMessaging.onMessage.listen((event) async{
      print('Got a message whilst in the foreground!');
      if (event.notification != null) {
        print('Notification Title: ${event.notification!.title ?? ""}');
        print('Notification Body: ${event.notification!.body ?? ""}');
        await notificationProvider.getAllNotifications(context);
      }
      // Navigator.pushNamed(navigatorKey.currentState!.context, '/home');
    });

    // If application is in background.
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print('onMessageOpenedApp: $event');
      Navigator.pushNamed(navigatorKey.currentState!.context, '/home');
      notificationProvider.getAllNotifications(context);
    });

    // If application is closed or terminated
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print('onMessageOpenedApp: $message');
        Navigator.pushNamed(navigatorKey.currentState!.context, '/home');
      }
    });

    FirebaseMessaging.onBackgroundMessage(_firbaseMessagingBackgroundHandler);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => di.sl<AppCubit>(),
        child: BlocBuilder<AppCubit, AppState>(builder: (context, stt) {
          return Scaffold(
            // backgroundColor: Colors.amber[50],
            body: AnimatedSwitcher(
              duration: const Duration(microseconds: 300),
              child: bottomNavigationScreens().elementAt(stt.pageIndex),
            ),
            bottomNavigationBar: NavigationBar(
                onDestinationSelected: (value) => {BlocProvider.of<AppCubit>(context).changePageIndex(index: value)},
                destinations: bottomNavigationItems(context),
                selectedIndex: stt.pageIndex),
          );
        }));
  }
}
