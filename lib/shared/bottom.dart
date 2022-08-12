import 'package:flutter/material.dart';
import 'package:firebase/screens/home/home.dart';
import 'package:firebase/shared/profileView.dart';
import 'package:firebase/shared/notification.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;
  final screens = [
    Home(),
    ProfileVeiw(),
    NotificationScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue,
          backgroundColor: Colors.grey[200],
          height: 60,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
            NavigationDestination(
                icon: Icon(Icons.notifications), label: "Notification"),
          ],
        ),
      ),
      body: screens[index],
    );
  }
}
