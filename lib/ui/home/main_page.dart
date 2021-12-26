import 'package:flutter/material.dart';
import 'package:techtree/ui/home/home_page.dart';
import 'package:techtree/ui/home/morse_page.dart';
import 'package:techtree/ui/home/weather_page.dart';

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    MorsePage(),
    Weather(),
  ];

  final List<BottomNavigationBarItem> _navigations = [
    BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(Icons.home)
    ),
    BottomNavigationBarItem(
        label: 'Morse',
        icon: Icon(Icons.keyboard)
    ),
    BottomNavigationBarItem(
        label: 'Weather',
        icon: Icon(Icons.wb_sunny)
    ),
  ];

  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[700],
          currentIndex: _selectedIndex,
          onTap: (index) { setState(() { _selectedIndex = index; }); },
          items: _navigations
        ),
        body: SafeArea(
          child: PageStorage(
            bucket: _bucket,
            child: _pages[_selectedIndex],
          ),
        ),
      );
}