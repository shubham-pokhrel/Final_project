import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'home_page.dart';
import 'offer_page.dart';
import 'profile_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  List<Widget> _Options = <Widget>[
    home_page(),
    cart_page(),
    offer_page(),
    profile_page(),
  ];
  void _tapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(204, 206, 217, 250),
      body: Center(
        child: _Options.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        mouseCursor: SystemMouseCursors.grab,
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(size: 30),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            //1st
            backgroundColor: Color.fromARGB(255, 59, 54, 54),
            icon: Icon(
              Icons.home_outlined,
              color: Colors.green,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 59, 54, 54),
            //2nd
            icon: Icon(
              Icons.local_mall_outlined,
              color: Colors.green,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 59, 54, 54),
            //3rd
            icon: Icon(
              Icons.local_offer_outlined,
              color: Colors.green,
            ),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 59, 54, 54),
            //4th
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.green,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _tapped,
      ),
    );
  }
}
