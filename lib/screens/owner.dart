import 'package:e_rent_car/screens/my-cars.dart';
import 'package:e_rent_car/screens/profile.dart';
import 'package:e_rent_car/screens/rents-owner.dart';
import 'package:e_rent_car/screens/reservations-owner.dart';
import 'package:flutter/material.dart';

class OwnerNavigationScreen extends StatefulWidget {
  const OwnerNavigationScreen({Key? key}) : super(key: key);

  @override
  State<OwnerNavigationScreen> createState() => _OwnerNavigationScreenState();
}

class _OwnerNavigationScreenState extends State<OwnerNavigationScreen> {
  int _currentIndex = 0;
  List<Widget> _screens = [
    MyCarsScreen(),
    ReservationsOwnerScreen(),
    RentsOwnerScreen(),
    ProfileScreen()
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
                icon: Icon(Icons.car_rental,color: Color(0xFF527DAA)),
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
