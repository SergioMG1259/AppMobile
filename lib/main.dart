import 'package:e_rent_car/screens/car-details-client.dart';
import 'package:e_rent_car/screens/client.dart';
import 'package:e_rent_car/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:e_rent_car/screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ERentcar',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/client': (context) => ClientNavigationScreen(),
        '/car-details-client':(context)=>CarDetailsClientScreen()
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Redirige a la pantalla de registro
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Pantalla de Inicio'),
      ),
    );
  }
}