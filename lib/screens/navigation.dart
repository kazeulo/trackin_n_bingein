import 'package:flutter/material.dart';
import 'package:trackin_n_bingein/screens/homepage.dart';
import 'package:trackin_n_bingein/screens/profile.dart';
import 'package:trackin_n_bingein/screens/statistics.dart';
import 'package:trackin_n_bingein/styling/styling.dart';
import 'package:trackin_n_bingein/screens/media.dart';

// contains the bar 
// separate file for centralization purposes
class Navigation extends StatefulWidget {
  final String username;

  const Navigation({Key? key, required this.username}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    Homepage(username: '',),
    Statistics(),
    Media(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, 
              color: _currentIndex == 0 ? Styling.textColor3 : Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics, 
              color: _currentIndex == 1 ? Styling.textColor3 : Colors.black),
            label: 'Media',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list,
                color: _currentIndex == 2 ? Styling.textColor3 : Colors.black),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, 
              color: _currentIndex == 3 ? Styling.textColor3 : Colors.black),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
