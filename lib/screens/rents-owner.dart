import 'package:e_rent_car/api-services/api-score.dart';
import 'package:flutter/material.dart';

import '../api-services/api-rent.dart';
import '../models/global.dart';
import '../models/rent-owner.dart';

class RentsOwnerScreen extends StatefulWidget {
  const RentsOwnerScreen({Key? key}) : super(key: key);

  @override
  State<RentsOwnerScreen> createState() => _RentsOwnerScreenState();
}

class _RentsOwnerScreenState extends State<RentsOwnerScreen> {
  double rating = 0.0;
  TextEditingController _comment=TextEditingController();

  ApiScoreService apiScoreService=new ApiScoreService();

  ApiRentService apiRentService=new ApiRentService();

  List<RentOwner> rents = [];
  ApiRentService apiReservationService=new ApiRentService();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchRents();
  }
  Future<void> fetchRents() async {
    try {
      final fetchedRents = await apiReservationService.getRentsOwner(Globals.userId);
      setState(() {
        rents = fetchedRents;
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> scoreClient(int clientId,String comment,double rating) async {
    try {
      final score = await apiScoreService.scoreToClient(clientId,Globals.userId,comment,rating);
      setState(() {
        comment='';
        rating=0;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> endRent(int rentId) async {
    try {
      final end = await apiRentService.endRent(rentId);
      setState(() {

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
                itemCount: rents.length,
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
                                rents[index].reservation.car.brand+" "+rents[index].reservation.car.model+" "+rents[index].reservation.car.year.toString(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                rents[index].state,
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
                                rents[index].reservation.reserveDate.day.toString()+"/"+rents[index].reservation.reserveDate.month.toString()+"/"+rents[index].reservation.reserveDate.year.toString()+" - ",
                                style: TextStyle(fontSize: 14.0),
                              ),
                              Text(
                                rents[index].reservation.returnDate.day.toString()+"/"+rents[index].reservation.returnDate.month.toString()+"/"+rents[index].reservation.returnDate.year.toString(),
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            children: [
                              Text(
                                rents[index].reservation.user.name+" "+rents[index].reservation.user.lastName,
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xFF527DAA),
                              ),
                              Text(
                                rents[index].reservation.user.score.toString()+'/5',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            children: [
                              if (rents[index].state == 'IN PROGRESS')
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF527DAA)), // Color de fondo del botón
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      endRent(rents[index].id);
                                      rents[index].state="FINALIZED";
                                      _showRatingDialog(rents[index].reservation.user.id);
                                    });

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
  void _showRatingDialog(int clientId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Center(child: Text('Rate the customer')),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 1; i <= 5; i++)
                        InkWell(
                          onTap: () {
                            setState(() {
                              rating = i.toDouble();
                            });
                          },
                          child: Icon(
                            Icons.star,
                            color: i <= rating.toInt() ? Colors.amber : Colors.grey,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Color(0xFF6CA8F1), // Color del borde
                        width: 2.0, // Ancho del borde
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    height: 130.0,
                    child: TextField(
                      controller: _comment,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        color: Color(0xFF6CA8F1),
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 14.0),
                        hintText: 'Description',
                        hintStyle: TextStyle(
                          color: Color(0xFF6CA8F1),
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    scoreClient(clientId, _comment.value.text, rating);
                    Navigator.of(context).pop();
                  },
                  child: Text('Submit'),
                ),
              ],
            );
          },
        );
      },
    );
  }


}
