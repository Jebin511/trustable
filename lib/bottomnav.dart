import 'package:flutter/material.dart';
import 'package:trustable/Eauction.dart';
import 'package:trustable/home.dart';
import 'package:trustable/mychits.dart';
import 'package:trustable/newchit_screen.dart';

class BottomNavExample extends StatefulWidget {
  const BottomNavExample({super.key});

  @override
  State<BottomNavExample> createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
   MyChitsPage(),
    NewChitScreen(),
    EauctionScreen(),
    const Center(child: Text("Notifications Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          // Blue container as nav background
          Container(
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _navItem(Icons.bar_chart, 1),
                _navItem(Icons.add, 2),
                _navItem(Icons.build, 3),
                _navItem(Icons.notifications, 4),
              ],
            ),
          ),

          // Floating Home Button
          Positioned(
            top: -25,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.home,
                  size: 28,
                  color: _currentIndex == 0 ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Icon(
        icon,
        size: 28,
        color: _currentIndex == index ? Colors.black : Colors.white,
      ),
    );
  }
}