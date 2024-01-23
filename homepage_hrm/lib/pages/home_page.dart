import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      bottomNavigationBar: _builderNavigationBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              _buildHeaderWidget(),
              _builderPunchInOutCard()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderWidget() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Colors.black
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundColor: Colors.brown,
              minRadius: 24,
              child: Text('MD',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold 
                  ),),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Monica Jamesss',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold 
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'R&D Manager',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                )
              ]
            ),
          ],
        ),
        Icon(
          Icons.notifications,
          color: Colors.black
        )
      ],
    );
  }

  Widget _builderPunchInOutCard() {
    return const Row(
      children: [
        Card (
          child: SizedBox(
            width: 300,
            height: 100,
            child: Center(child: Text('Elevated Card'))
          ),
        ),
      ],
    );
  }

  Widget _builderNavigationBar() {
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
}