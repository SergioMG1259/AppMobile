import 'package:e_rent_car/screens/rents-client.dart';
import 'package:e_rent_car/screens/reservations-client.dart';
import 'package:flutter/material.dart';

import 'search_cars.dart';
class ClientNavigationScreen extends StatefulWidget {
  @override
  _ClientNavigationScreenState createState() => _ClientNavigationScreenState();
}

class _ClientNavigationScreenState extends State<ClientNavigationScreen> {
  int _currentIndex = 0;

  List<Widget> _screens = [
    SearchCarsScreen(),
    ReservationsClientScreen(),
    RentsClientScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.lightBlue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: _screens[_currentIndex],
          ),
          BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.search,color: Color(0xFF527DAA)),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month,color: Color(0xFF527DAA)),
                label: 'Reservations',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.key,color: Color(0xFF527DAA)),
                label: 'Rents',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,color: Color(0xFF527DAA)),
                label: 'User',
              ),
            ],
          ),
        ],
      ),
    );
  }
}