import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kuis_124200077/page/help.dart';
import 'package:kuis_124200077/page/listGroc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final screens = [HomeList(), HelpPage()];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(size: 30),
          selectedItemColor: Colors.lightGreen,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help),
              label: 'About',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        ),
        body: screens[_selectedIndex],
      ),
    );
  }
}
