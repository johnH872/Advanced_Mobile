import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm_mobile/config/theme/color_schemes.g.dart';
import 'package:hrm_mobile/features/auth/presentation/bloc/auth_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[50],
        bottomNavigationBar: _buildNavigationBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 370,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 254,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: lightColorScheme.primaryContainer,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              right: 25, top: 40, left: 25, bottom: 20),
                          child: _buildHeaderWidget()),
                    ),
                    Positioned(
                      top: 80.0,
                      left: 0.0,
                      right: 0.0,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              right: 25, top: 40, left: 25, bottom: 20),
                          child: _builderPunchInOutCard()),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: _builderButtonList(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: _builderLeaveEntitlement(),
              )
            ],
          ),
        ));
  }

  Widget _buildHeaderWidget() {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is LoggedOutState) {
          Navigator.of(context).pushNamedAndRemoveUntil('/login',(r) => false);
        }
      },
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.brown,
                  radius: 24,
                  child: Text(
                    'MD',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Hoang Ta',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'HR Manager',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      )
                    ]),
              ],
            ),
            const Icon(Icons.notifications, color: Colors.black)
          ],
        ),
      ]),
    );
  }

  Widget _builderPunchInOutCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Card(
            color: Colors.white,
            child: SizedBox(
              width: 100,
              height: 240,
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Today\'s overview',
                                style: TextStyle(
                                    color: Color.fromRGBO(72, 68, 67, 40),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '24 Junary 2024',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Icon(Icons.more_horiz, color: Colors.black)
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _builderPunchedStatus(),
                    ],
                  )),
            ),
          ),
        )
      ],
    );
  }

  Widget _builderPunchedStatus() {
    return Container(
        width: 340,
        height: 144,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color.fromRGBO(206, 198, 180, 32)),
          color: const Color.fromRGBO(255, 248, 239, 100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Clock in',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      '08:00 AM',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'Done at 07:58',
                          style: TextStyle(fontSize: 12),
                        ))
                  ],
                ),
              ),
            ),
            const VerticalDivider(
              thickness: 1,
              indent: 30,
              endIndent: 30,
              color: Colors.grey,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Clock out',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      '05:00 PM',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ButtonTheme(
                        minWidth: 300,
                        height: 100,
                        child: FilledButton(
                            onPressed: () {},
                            child: const Text('Not yet',
                                style: TextStyle(fontSize: 12)))),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildNavigationBar() {
    int currentPageIndex = 0;
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      indicatorColor: Colors.amber,
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.timer),
          icon: Icon(Icons.timer_rounded),
          label: 'Attendance',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.calendar_month),
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Leave',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.person),
          icon: Icon(Icons.person_2_outlined),
          label: 'Profile',
        ),
      ],
    );
  }

  Widget _builderButtonList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          spacing: 30,
          alignment: WrapAlignment.spaceBetween,
          children: [
            _builderButtonFab(
                "Time off",
                const Icon(
                  Icons.next_week,
                  color: Color(0xff389151),
                )),
            _builderButtonFab(
                "Apply leave",
                const Icon(
                  Icons.flight_takeoff,
                  color: Color(0xff1A3BE7),
                )),
            _builderButtonFab(
                "News",
                const Icon(
                  Icons.document_scanner,
                  color: Color(0xffC47D29),
                )),
            _builderButtonFab(
                "Timesheet",
                const Icon(
                  Icons.calendar_month,
                  color: Color(0xffCA5858),
                )),
            _builderButtonFab(
                "Employee",
                const Icon(
                  Icons.group,
                  color: Color(0xff6EA1EC),
                )),
            _builderButtonFab(
                "Assign leave",
                const Icon(
                  Icons.assignment_ind,
                  color: Color(0xff5457A7),
                )),
            _builderButtonFab(
                "Recruitment",
                const Icon(
                  Icons.person_add,
                  color: Color(0xffAB933F),
                )),
            _builderButtonFab(
                "Others",
                const Icon(
                  Icons.more_horiz,
                  color: Color(0xff389151),
                )),
          ],
        )
      ],
    );
  }

  Widget _builderButtonFab(String name, Icon icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            elevation: 1,
            foregroundColor: Colors.black,
            heroTag: name,
            child: icon,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget _builderLeaveEntitlement() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Card(
            color: Colors.white,
            child: SizedBox(
              width: 100,
              height: 208,
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.timelapse),
                              Text(
                                'Leave balance ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '(days)',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          FilledButton(
                            onPressed: () {},
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Color(0xff389151)),
                            ),
                            child: const Text('Submit leave',
                                style: TextStyle(fontSize: 12)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _builderLeaveEntitlementCard(),
                    ],
                  )),
            ),
          ),
        )
      ],
    );
  }

  Widget _builderLeaveEntitlementCard() {
    return Container(
        width: 340,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xff0A672A),
        ),
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Leave entitilement',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Total',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Wrap(
                    spacing: 10,
                    children: [
                      Text(
                        'Usable',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Used',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Remain',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Budget',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 30,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
