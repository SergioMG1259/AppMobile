import 'package:flutter/material.dart';

import '../api-services/api-reservation.dart';
import '../models/global.dart';
import '../models/reservation-owner.dart';

class ReservationsOwnerScreen extends StatefulWidget {
  const ReservationsOwnerScreen({Key? key}) : super(key: key);

  @override
  State<ReservationsOwnerScreen> createState() => _ReservationsOwnerScreenState();
}

class _ReservationsOwnerScreenState extends State<ReservationsOwnerScreen> {
  List<ReservationOwner> reservations = [];

  ApiReservationService apiReservationService=new ApiReservationService();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchReservations();
  }
  Future<void> fetchReservations() async {
    try {
      final fetchedCars = await apiReservationService.getReservationsOwner(Globals.userId);
      setState(() {
        reservations = fetchedCars;
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }
  Future<void> acceptReservation(int reservationId,int index) async {
    try {
      final fetchedCars = await apiReservationService.acceptReservation(reservationId);
      reservations[index].state="ACCEPTED";
    } catch (e) {
      print(e);
    }
  }
  Future<void> declineReservation(int reservationId, int index) async {
    try {
      final fetchedCars = await apiReservationService.declineReservation(reservationId);
      reservations[index].state="DECLINED";
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
                              Text(
                                reservations[index].user.name+" "+reservations[index].user.lastName,
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFF527DAA),
                              ),
                              Text(
                                reservations[index].user.score.toString()+'/5',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            children: [
                              if (reservations[index].state == 'WAITING')
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(
                                        0xFFD7095B)), // Color de fondo del botón
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      declineReservation(reservations[index].id,index);
                                    });
                                    reservations[index].state='DECLINED';
                                  },
                                  child: Text('Decline'),
                                ),
                              SizedBox(width: 10.0),
                              if (reservations[index].state == 'WAITING')
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF527DAA)), // Color de fondo del botón
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      acceptReservation(reservations[index].id,index);
                                    });
                                    reservations[index].state='ACCEPTED';
                                  },
                                  child: Text('Accept'),
                                ),
                              SizedBox(width: 10.0),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF527DAA)), // Color de fondo del botón
                                ),
                                onPressed: () {

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
