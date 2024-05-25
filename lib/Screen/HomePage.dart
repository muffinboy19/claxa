import 'package:flutter/material.dart';
import 'package:gleo_x/style/colour.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';
import 'page5.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
    Page5(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(

          decoration: BoxDecoration(
            color: Colors.red,
            // Background color
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BottomNavigationBar(
              backgroundColor: Colors.red, // Make background transparent to show Container's color
              elevation: 0,
              currentIndex: _selectedIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Page 1',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Page 2',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.pets),
                  label: 'Page 3',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.directions_walk),
                  label: 'Page 4',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Page 5',
                ),
              ],
              selectedItemColor: deepPurple, // Selected icon color
              unselectedItemColor: greyBlack,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
