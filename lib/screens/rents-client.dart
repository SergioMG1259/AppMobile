import 'package:flutter/material.dart';

class RentsClient {
  final String date;
  final String status;

  RentsClient({required this.date, required this.status});
}

class RentsClientScreen extends StatefulWidget {
  const RentsClientScreen({Key? key}) : super(key: key);

  @override
  State<RentsClientScreen> createState() => _RentsClientScreenState();
}

class _RentsClientScreenState extends State<RentsClientScreen> {
  final List<RentsClient> reservations = [
    RentsClient(
      date: '10-06-2023',
      status: 'In Progress',
    ),RentsClient(
      date: '10-06-2023',
      status: 'Finalized',
    ),RentsClient(
      date: '10-06-2023',
      status: 'Finalized',
    ),RentsClient(
      date: '10-06-2023',
      status: 'Finalized',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40.0),
          Text(
            'Rents',
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
                            if (reservations[index].status == 'In Progress')
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF527DAA)), // Color de fondo del botón
                                ),
                                onPressed: () {
                                  // Acción para cancelar reserva
                                },
                                child: Text('End Rent'),
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
