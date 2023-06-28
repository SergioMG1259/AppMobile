import 'package:e_rent_car/models/global.dart';
import 'package:flutter/material.dart';

import '../api-services/api-car.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({Key? key}) : super(key: key);

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  String _valueType = 'Client';

  final TextEditingController _modelCar = TextEditingController();
  final TextEditingController _plateNumber = TextEditingController();
  final TextEditingController _mileage = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _image = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final ApiCarService apiCarService=new ApiCarService();

  String _brand='Audi';
  String _typeCar='Sedan';
  String _seats='5';
  String _year='2023';
  String _fuel='Petrol';
  String _gearbox='Automatic';
  bool completed=false;

  List<String> fieldTitles = [];
  List<String> fieldValues = [];

  void addField() {
    setState(() {
      if(fieldValues.length<3){
        fieldTitles.add("Location ${fieldTitles.length + 1}");
        fieldValues.add("");
      }
    });
  }
  Future<void> addCar( String brand,
      String model,
      String type,
      int seats,
      int year,
      String fuel,
      String gearBox,
      String plateNumber,
      String description,
      double mileage,
      double pricePerDay,
      String image,
      List<String> locations,) async {
    try {
      final response = await apiCarService.addCar(brand,model,type,seats,year,fuel,gearBox,plateNumber,description,mileage,pricePerDay,image,locations,Globals.userId);
      setState(() {
        completed=response;
        print(completed);
        Navigator.pop(context, true);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                          'Add New Car',
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
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Column(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Brand',
                                  style: TextStyle(
                                    color: Color(0xFF6CA8F1),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
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
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                value: _brand,
                                                icon: Icon(Icons.arrow_drop_down,color: Color(0xFF6CA8F1)),
                                                iconSize: 24,
                                                elevation: 16,
                                                style: TextStyle(color: Color(0xFF6CA8F1)),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _brand = newValue!;
                                                  });
                                                },
                                                items: <String>['Audi','Fiat','KIA','Nissan','Toyota']
                                                    .map<DropdownMenuItem<String>>((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                )
                              ]

                          ),
                          SizedBox(height: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Model',
                                style: TextStyle(
                                  color: Color(0xFF6CA8F1),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                ),
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
                                height: 50.0,
                                child: TextField(
                                  controller: _modelCar,
                                  style: TextStyle(
                                    color: Color(0xFF6CA8F1),
                                    fontFamily: 'OpenSans',
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 14.0),
                                    hintText: 'Model',
                                    hintStyle: TextStyle(
                                      color: Color(0xFF6CA8F1),
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Type',
                                  style: TextStyle(
                                    color: Color(0xFF6CA8F1),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
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
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                value: _typeCar,
                                                icon: Icon(Icons.arrow_drop_down,color: Color(0xFF6CA8F1)),
                                                iconSize: 24,
                                                elevation: 16,
                                                style: TextStyle(color: Color(0xFF6CA8F1)),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _typeCar = newValue!;
                                                  });
                                                },
                                                items: <String>['Sedan', 'SUV','PickUp','MiniVan','Sport']
                                                    .map<DropdownMenuItem<String>>((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                )
                              ]

                          ),
                          SizedBox(height: 20.0),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Seats',
                                  style: TextStyle(
                                    color: Color(0xFF6CA8F1),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
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
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                value: _seats,
                                                icon: Icon(Icons.arrow_drop_down,color: Color(0xFF6CA8F1)),
                                                iconSize: 24,
                                                elevation: 16,
                                                style: TextStyle(color: Color(0xFF6CA8F1)),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _seats = newValue!;
                                                  });
                                                },
                                                items: <String>['2', '4','5','6','9']
                                                    .map<DropdownMenuItem<String>>((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                )
                              ]

                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Column(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Year',
                                  style: TextStyle(
                                    color: Color(0xFF6CA8F1),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
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
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                value: _year,
                                                icon: Icon(Icons.arrow_drop_down,color: Color(0xFF6CA8F1)),
                                                iconSize: 24,
                                                elevation: 16,
                                                style: TextStyle(color: Color(0xFF6CA8F1)),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _year = newValue!;
                                                  });
                                                },
                                                items: <String>['2023', '2022','2021','2020','2019','2018',]
                                                    .map<DropdownMenuItem<String>>((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                )
                              ]

                          ),
                          SizedBox(height: 20.0),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Plate Number',
                                  style: TextStyle(
                                    color: Color(0xFF6CA8F1),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
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
                                  height: 50.0,
                                  child: TextField(
                                    controller: _plateNumber,
                                    style: TextStyle(
                                      color: Color(0xFF6CA8F1),
                                      fontFamily: 'OpenSans',
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 14.0),
                                      hintText: 'Plate Number',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF6CA8F1),
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                  ),
                                ),
                              ]

                          ),
                          SizedBox(height: 20.0),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Mileage (Km)',
                                  style: TextStyle(
                                    color: Color(0xFF6CA8F1),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
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
                                  height: 50.0,
                                  child: TextField(
                                    controller: _mileage,
                                    style: TextStyle(
                                      color: Color(0xFF6CA8F1),
                                      fontFamily: 'OpenSans',
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 14.0),
                                      hintText: 'Mileage',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF6CA8F1),
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                  ),
                                ),
                              ]

                          ),
                          SizedBox(height: 100)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fuel',
                          style: TextStyle(
                            color: Color(0xFF6CA8F1),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            roundedButtonFuel('Petrol', _fuel == 'Petrol','left'),
                            roundedButtonFuel('Diesel', _fuel == 'Diesel','right'),
                          ],
                        )
                      ],
                    ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gearbox',
                      style: TextStyle(
                        color: Color(0xFF6CA8F1),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        roundedButtonGearbox('Automatic', _gearbox == 'Automatic','left'),
                        roundedButtonGearbox('Manual', _gearbox == 'Manual','right'),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Price Per Day',
                    style: TextStyle(
                      color: Color(0xFF6CA8F1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: 245,
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
                    height: 50.0,
                    child: TextField(
                      controller: _price,
                      style: TextStyle(
                        color: Color(0xFF6CA8F1),
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 14.0),
                        hintText: 'Price',
                        hintStyle: TextStyle(
                          color: Color(0xFF6CA8F1),
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Image Link',
                    style: TextStyle(
                      color: Color(0xFF6CA8F1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: 245,
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
                    height: 50.0,
                    child: TextField(
                      controller: _image,
                      style: TextStyle(
                        color: Color(0xFF6CA8F1),
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 14.0),
                        hintText: 'Link',
                        hintStyle: TextStyle(
                          color: Color(0xFF6CA8F1),
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Color(0xFF6CA8F1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
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
                    height: 130.0,
                    child: TextField(
                      controller: _description,
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
              SizedBox(height: 20.0),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: fieldTitles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical:0, horizontal: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fieldTitles[index],
                          style: TextStyle(
                            color: Color(0xFF6CA8F1),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          width: 245,
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
                          height: 50.0,
                          child: TextField(
                            style: TextStyle(
                              color: Color(0xFF6CA8F1),
                              fontFamily: 'OpenSans',
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 14.0),
                              hintText: 'Location',
                              hintStyle: TextStyle(
                                color: Color(0xFF6CA8F1),
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                fieldValues[index] = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20.0),
              Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    addField();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF527DAA),
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // Personaliza el color de fondo del botón
                    // background color: Colors.blue,
                  ),
                  child: Text(
                    'Add Location',
                    style: TextStyle(
                      color: Colors.white, // Color del texto del botón
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    addCar(_brand, _modelCar.value.text, _typeCar, int.parse(_seats), int.parse(_year), _fuel, _gearbox, _plateNumber.value.text, _description.value.text, double.parse(_mileage.value.text), double.parse(_price.value.text), _image.value.text, fieldValues);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF527DAA),
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // Personaliza el color de fondo del botón
                    // background color: Colors.blue,
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
              SizedBox(height: 20.0),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
  TextButton roundedButtonFuel(String text, bool isSelected,String side) {
    return TextButton(
      onPressed: () {
        setState(() {
          _fuel = text;
        });
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: side=='left'
                ? BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            )
                : BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            side: BorderSide(
              color: Color(0xFF527DAA),
              width: 2.0,
            ),
          ),
        ),
        backgroundColor: isSelected ? MaterialStateProperty.all(Color(0xFF527DAA),) : null,
        fixedSize: MaterialStateProperty.all<Size>(
          Size(123, 42),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0xFF527DAA),fontSize: 16
        ),
      ),
    );
  }
  TextButton roundedButtonGearbox(String text, bool isSelected,String side) {
    return TextButton(
      onPressed: () {
        setState(() {
          _gearbox = text;
        });
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: side=='left'
                ? BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            )
                : BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            side: BorderSide(
              color: Color(0xFF527DAA),
              width: 2.0,
            ),
          ),
        ),
        backgroundColor: isSelected ? MaterialStateProperty.all(Color(0xFF527DAA)) : null,
        fixedSize: MaterialStateProperty.all<Size>(
          Size(123, 42),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isSelected ? Colors.white : Color(0xFF527DAA),fontSize: 16
        ),
      ),
    );
  }
}


