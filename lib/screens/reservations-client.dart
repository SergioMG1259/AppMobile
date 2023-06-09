import 'package:e_rent_car/api-services/api-rent.dart';
import 'package:e_rent_car/api-services/api-reservation.dart';
import 'package:e_rent_car/models/global.dart';
import 'package:flutter/material.dart';

import '../models/reservation-client.dart';

class ReservationsClientScreen extends StatefulWidget {
  const ReservationsClientScreen({Key? key}) : super(key: key);
  @override
  State<ReservationsClientScreen> createState() => _ReservationsClientScreenState();
}

class _ReservationsClientScreenState extends State<ReservationsClientScreen> {
  List<ReservationClient> reservations = [];
  ApiReservationService apiReservationService=new ApiReservationService();
  ApiRentService apiRentService=new ApiRentService();

  bool isLoading = true;
  bool payed=false;
  @override
  void initState() {
    super.initState();
    fetchReservations();
  }
  Future<void> fetchReservations() async {
    try {
      final fetchedCars = await apiReservationService.getReservationsClient(Globals.userId);
      setState(() {
        reservations = fetchedCars;
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }
  Future<void> addRent(int reservationId) async {
    try {
      final added = await apiRentService.pay(reservationId);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }else{
      return Scaffold(
        body: Column(
          children: [
            SizedBox(height: 40.0),
            Text(
              'Reservations',
              style: TextStyle(
                color: Color(0xFF527DAA),
                fontFamily: 'OpenSans',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: reservations.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4.0,
                    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Color(0xFF527DAA).withOpacity(0.5),
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                reservations[index].car.brand+" "+reservations[index].car.model+" "+reservations[index].car.year.toString(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                reservations[index].state,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Text(
                                reservations[index].reserveDate.day.toString()+"/"+reservations[index].reserveDate.month.toString()+"/"+reservations[index].reserveDate.year.toString()+" - ",
                                style: TextStyle(fontSize: 14.0),
                              ),
                              Text(
                                reservations[index].returnDate.day.toString()+"/"+reservations[index].returnDate.month.toString()+"/"+reservations[index].returnDate.year.toString(),
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            children: [
                              if (reservations[index].state == 'ACCEPTED')
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(
                                        0xFFD7095B)), // Color de fondo del botón
                                  ),
                                  onPressed: () {
                                  },
                                  child: Text('Cancel'),
                                ),
                              SizedBox(width: 10.0),
                              if (reservations[index].state == 'ACCEPTED')
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF527DAA)), // Color de fondo del botón
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      addRent(reservations[index].id);
                                    });
                                    reservations[index].state="PAYED";
                                  },
                                  child: Text('Pay'),
                                ),
                              SizedBox(width: 10.0),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF527DAA)), // Color de fondo del botón
                                ),
                                onPressed: () {
                                  // Acción para dar una calificación
                                },
                                child: Text('View Details'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

  }
}
