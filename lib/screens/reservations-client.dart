import 'package:flutter/material.dart';

class ReservationsClient {
  final String date;
  final String status;

ReservationsClient({required this.date, required this.status});
}

class ReservationsClientScreen extends StatefulWidget {
  const ReservationsClientScreen({Key? key}) : super(key: key);
  @override
  State<ReservationsClientScreen> createState() => _ReservationsClientScreenState();
}

class _ReservationsClientScreenState extends State<ReservationsClientScreen> {
  final List<ReservationsClient> reservations = [
    ReservationsClient(
      date: '10-06-2023',
      status: 'Paid',
    ),ReservationsClient(
      date: '10-06-2023',
      status: 'Paid',
    ),ReservationsClient(
      date: '10-06-2023',
      status: 'Paid',
    ),ReservationsClient(
      date: '10-06-2023',
      status: 'Paid',
    )
  ];
  @override
  Widget build(BuildContext context) {
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
                              'Toyota Camry 2020',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              reservations[index].status,
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
                              '10/05/2023',
                              style: TextStyle(fontSize: 14.0),
                            ),
                            Text(
                              '-15/05/2023',
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            if (reservations[index].status == 'Waiting')
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(
                                      0xFFD7095B)), // Color de fondo del botón
                                ),
                                onPressed: () {
                                  // Acción para cancelar reserva
                                },
                                child: Text('Cancel'),
                              ),
                              SizedBox(width: 10.0),
                            if (reservations[index].status == 'Waiting')
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF527DAA)), // Color de fondo del botón
                                ),
                                onPressed: () {
                                  // Acción para finalizar reserva
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
