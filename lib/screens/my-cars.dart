import 'package:e_rent_car/models/global.dart';
import 'package:flutter/material.dart';

import '../api-services/api-car.dart';
import '../models/car.dart';

class MyCarsScreen extends StatefulWidget {
  const MyCarsScreen({Key? key}) : super(key: key);

  @override
  State<MyCarsScreen> createState() => _MyCarsScreenState();
}

class _MyCarsScreenState extends State<MyCarsScreen> {

  final ApiCarService apiCarService=new ApiCarService();
  List<Car> cars = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchCarsOwner();
  }
  Future<void> fetchCarsOwner() async {
    try {
      final fetchedCars = await apiCarService.getCarsOwner(Globals.userId);
      setState(() {
        cars = fetchedCars;
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
              'My Cars',
              style: TextStyle(
                color: Color(0xFF527DAA),
                fontFamily: 'OpenSans',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/add-car');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF527DAA),
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Add New Car',
                          style: TextStyle(
                            color: Colors.white, // Color del texto del botón
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: cars.length,
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
                    child: InkWell(
                      onTap: () {

                      },
                      child: Column(
                        children: [
                          Image.network(
                            cars[index].image,
                            fit: BoxFit.cover,
                            height: 170,
                            width: double.infinity,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 95,
                              color: Color(0xFF527DAA),
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${cars[index].brand} ${cars[index].model} ${cars[index].year}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: List.generate(5, (i) {
                                              if (i < cars[index].score.floor()) {
                                                return Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 18.0,
                                                );
                                              } else if (i == cars[index].score.floor() && cars[index].score % 1 != 0 ) {
                                                return Icon(
                                                  Icons.star_half,
                                                  color: Colors.white,
                                                  size: 18.0,
                                                );
                                              }else {
                                                return Icon(
                                                  Icons.star_border,
                                                  color: Colors.white,
                                                  size: 18.0,
                                                );
                                              }
                                            }),
                                          ),
                                          Text(
                                            ' ${cars[index].score}/5.0',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Wrap(
                                    spacing: 6.0,
                                    children: [
                                      Chip(
                                        label: Text(
                                          '5 Seats',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        backgroundColor: Color(0xFF527DAA).withOpacity(0.8),
                                      ),
                                      Chip(
                                        label: Text(
                                          'Automatic',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        backgroundColor: Color(0xFF527DAA).withOpacity(0.8),
                                      ),
                                      Chip(
                                        label: Text(
                                          'Petrol',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        backgroundColor: Color(0xFF527DAA).withOpacity(0.8),
                                      ),
                                      // Agrega más chips según sea necesario
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
