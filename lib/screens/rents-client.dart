import 'package:e_rent_car/api-services/api-rent.dart';
import 'package:e_rent_car/api-services/api-score.dart';
import 'package:e_rent_car/models/rent-client.dart';
import 'package:flutter/material.dart';

import '../models/global.dart';

class RentsClientScreen extends StatefulWidget {
  const RentsClientScreen({Key? key}) : super(key: key);
  @override
  State<RentsClientScreen> createState() => _RentsClientScreenState();
}

class _RentsClientScreenState extends State<RentsClientScreen> {
  List<RentClient> rents = [];
  ApiRentService apiReservationService=new ApiRentService();
  ApiScoreService apiScoreService=new ApiScoreService();

  TextEditingController _commentCar= TextEditingController();
  TextEditingController _commentOwner= TextEditingController();

  double scoreCar=0.0;
  double scoreOwner=0.0;

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchRents();
  }
  Future<void> fetchRents() async {
    try {
      final fetchedRents = await apiReservationService.getRentsClient(Globals.userId);
      setState(() {
        rents = fetchedRents;
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> scoreOwnerCar(int carId,int ownerId,String commentCar,String commentOwner,double scoreCar2,
      double scoreOwner2,int rentId) async {
    try {
      final scoreOwner = await apiScoreService.scoreToOwner(ownerId, Globals.userId, commentOwner, scoreOwner2);
      final scoreCar= await apiScoreService.scoreToCar(carId, Globals.userId, rentId, commentCar, scoreCar2);
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
                          if(rents[index].stateScore==false)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.0),
                                Text('Rate the car'),
                                SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    for (int i = 1; i <= 5; i++)
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            scoreCar = i.toDouble();
                                          });
                                        },
                                        child: Icon(
                                          Icons.star,
                                          color: i <= scoreCar.toInt() ? Colors.amber : Colors.grey,
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
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
                                  height: 80.0,
                                  child: TextField(
                                    controller: _commentCar,
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
                                SizedBox(height: 10.0),
                                Text('Rate the owner'),
                                SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    for (int i = 1; i <= 5; i++)
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            scoreOwner = i.toDouble();
                                          });
                                        },
                                        child: Icon(
                                          Icons.star,
                                          color: i <= scoreOwner.toInt() ? Colors.amber : Colors.grey,
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
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
                                  height: 80.0,
                                  child: TextField(
                                    controller: _commentOwner,
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
                                SizedBox(height: 10.0),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF527DAA)), // Color de fondo del botón
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      scoreOwnerCar(rents[index].reservation.car.id, rents[index].reservation.car.user.id, _commentCar.value.text, _commentOwner.value.text, scoreCar, scoreOwner, rents[index].id);
                                    });
                                    rents[index].stateScore=true;
                                  },
                                  child: Text('Send'),
                                )
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
