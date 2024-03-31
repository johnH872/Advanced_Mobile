import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/features/auth/presentation/bloc/cubit/app_cubit.dart';
import 'package:hrm_mobile/injection_container.dart' as di;

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AppCubit>(),
      child: BlocBuilder<AppCubit, AppState>(
          builder: (context, stt) {
            return Scaffold(
              // backgroundColor: Colors.amber[50],
              body: AnimatedSwitcher(
                duration: const Duration(microseconds: 300),
                child: bottomNavigationScreens().elementAt(stt.pageIndex),
              ),
              bottomNavigationBar: NavigationBar(
                onDestinationSelected: (value) => {
                  BlocProvider.of<AppCubit>(context).changePageIndex(index: value)
                },
                destinations: bottomNavigationItems(context),
                selectedIndex: stt.pageIndex 
              ),
            );            
          }
        )
    );
  }
}