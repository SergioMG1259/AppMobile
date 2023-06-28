import 'package:e_rent_car/api-services/api-rent.dart';
import 'package:e_rent_car/api-services/api-reservation.dart';
import 'package:e_rent_car/models/global-car-reserv.dart';
import 'package:e_rent_car/models/global-owner-reserv.dart';
import 'package:e_rent_car/models/global.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class Location{
  final String location;
  Location({required this.location});
}
class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  DateTime _selectedDayStart = DateTime.now();
  DateTime _selectedDayFinal = DateTime.now().add(Duration(days: 1));

  ApiReservationService apiReservationService=new ApiReservationService();
  ApiRentService apiRentService=new ApiRentService();
  bool completed=false;

  String selectedLocation = '';
  void handleLocationSelection(String location) {
    setState(() {
      selectedLocation = location;
    });
  }

  Future<void> addReservation(
      String location,String date1,String date2,double amount) async {
    try {
      final response = await apiReservationService.createReservation(location, date1, date2, amount, GlobalOwnerReserv.ownerId, Globals.userId, GlobalCarReserv.carId);
      setState(() {
        completed=response;
        print(completed);
        Navigator.pop(context, true);
      });
    } catch (e) {
      print(e);
    }
  }
  String formatDate(DateTime date) {
    String year = date.year.toString();
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.0),
            // Barra de navegación personalizada
            Container(
              height: 40,
              child: Row(
                children: [
                  // Icono de flecha para regresar
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xFF527DAA), // Color del icono
                      ),
                    ),
                  ),
                  // Título centrado
                  Expanded(
                    child: Center(
                      child: Text(
                        'Reservation',
                        style: TextStyle(
                          color: Color(0xFF527DAA), // Color del texto
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            Padding(
              padding: EdgeInsets.only(left: 16.0,right: 16.0),
              child: Text(
                'Start Date',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _selectedDayStart,
              calendarFormat: CalendarFormat.month,
              enabledDayPredicate: (DateTime day) {
                final now = DateTime.now();
                return day.isAfter(now.subtract(Duration(days: 1))); // Solo habilita los días a partir de ayer
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF527DAA), // Cambia el color del círculo de selección aquí
                ),
              ),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDayStart, day);
                },
              onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDayStart = selectedDay;
                  });},
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 16.0,right: 16.0),
              child: Text(
                'Final Date',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _selectedDayFinal,
              calendarFormat: CalendarFormat.month,
              enabledDayPredicate: (DateTime day) {
                final afterStart = _selectedDayStart;
                return day.isAfter(afterStart.subtract(Duration(days: 1)));
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF527DAA), // Cambia el color del círculo de selección aquí
                ),
              ),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDayFinal, day);
              },
              onDaySelected: (selectedDayF, focusedDay) {
                setState(() {
                  _selectedDayFinal = selectedDayF;
                });},
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 16.0,right: 16.0),
              child: Text(
                'Locations',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: GlobalCarReserv.locations.map((location) {
                String locationAux = location.location;
                return CheckboxListTile(
                  title: Text(locationAux, style: TextStyle(fontSize: 18)),
                  value: selectedLocation == locationAux,
                  onChanged: (value) {
                    handleLocationSelection(locationAux);
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Color(0xFF527DAA), // Color del checkbox seleccionado

                  checkColor: Colors.white, // Color de la marca del checkbox
                  tileColor: Colors.transparent, // Color de fondo del ListTile (transparente en este caso)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0), // Tamaño de borde del checkbox
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 16.0,right: 16.0),
              child: Text(
                'Cost',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 16.0,right: 16.0),
              child: Text(
                'Total: \$'+((_selectedDayFinal.difference(_selectedDayStart)).inDays*GlobalCarReserv.price).toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 21.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 16.0,right: 16.0),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF527DAA),
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    addReservation(selectedLocation, formatDate(_selectedDayStart),  formatDate(_selectedDayFinal), ((_selectedDayFinal.difference(_selectedDayStart)).inDays*GlobalCarReserv.price));
                  },
                  child: Text('Book',
                    style: TextStyle(
                      color: Colors.white, // Color del texto del botón
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
