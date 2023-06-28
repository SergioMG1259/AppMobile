import 'package:e_rent_car/api-services/api-car.dart';
import 'package:e_rent_car/models/car-detail.dart';
import 'package:e_rent_car/models/global-car-reserv.dart';
import 'package:e_rent_car/models/global-car.dart';
import 'package:e_rent_car/models/global-owner-reserv.dart';
import 'package:flutter/material.dart';
class Score {
  final double score;
  final String name;
  final String lastName;
  final String comment;

  Score({required this.score, required this.name, required this.lastName,
    required this.comment});
}
class CarDetailsClientScreen extends StatefulWidget {
  const CarDetailsClientScreen({Key? key}) : super(key: key);

  @override
  State<CarDetailsClientScreen> createState() => _CarDetailsClientScreenState();
}

class _CarDetailsClientScreenState extends State<CarDetailsClientScreen> {

  final double ownerScore=4.2;

  final ApiCarService apiCarService=new ApiCarService();
  CarDetail carDetail = new CarDetail();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getCarDetail();
  }
  Future<void> getCarDetail() async {
    try {
      final response = await apiCarService.getCarDetail(GlobalCar.carId);
      setState(() {
        carDetail = response;
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
        body: ListView(
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
                        carDetail.brand!+" "+carDetail.model!+" "+carDetail.year.toString(),
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
            // Contenido de la página
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Grid de rectángulos
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2, // Número de columnas en el grid
                    childAspectRatio: 2 / 0.9, // Relación de aspecto para ajustar la altura
                    children: [
                      // Rectángulo 1
                      Padding(
                        padding: EdgeInsets.all(8.0), // Espacio de separación
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0), // Radio de borde
                          child: Container(
                            color: Color(0xFF527DAA),
                            width: double.infinity,
                            height: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    color: Color(0xFF527DAA),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Gearbox',
                                          style: TextStyle(fontSize: 12, color: Colors.white),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          carDetail.gearBox!,
                                          style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                  thickness: 2.0,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Expanded(
                                    flex: 4,
                                    child: Container(
                                      color: Color(0xFF527DAA),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Seats',
                                            style: TextStyle(fontSize: 12, color: Colors.white),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            carDetail.seats.toString()!,
                                            style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Rectángulo 2
                      Padding(
                        padding: EdgeInsets.all(8.0), // Espacio de separación
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0), // Radio de borde
                          child: Container(
                            color: Color(0xFF527DAA),
                            width: double.infinity,
                            height: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    color: Color(0xFF527DAA),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Plate Number',
                                          style: TextStyle(fontSize: 12, color: Colors.white),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          carDetail.plateNumber!,
                                          style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                  thickness: 2.0,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Expanded(
                                    flex: 4,
                                    child: Container(
                                      color: Color(0xFF527DAA),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Type',
                                            style: TextStyle(fontSize: 12, color: Colors.white),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            carDetail.type!,
                                            style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Rectángulo 3
                      Padding(
                        padding: EdgeInsets.all(8.0), // Espacio de separación
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0), // Radio de borde
                          child: Container(
                            color: Color(0xFF527DAA),
                            width: double.infinity,
                            height: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    color: Color(0xFF527DAA),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Fuel',
                                          style: TextStyle(fontSize: 12, color: Colors.white),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          carDetail.fuel!,
                                          style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                  thickness: 2.0,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF527DAA),
                                      borderRadius: BorderRadius.circular(10.0), // Radio de borde del contenedor
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0x7B7790AB), // Color de fondo del contenedor del icono
                                          borderRadius: BorderRadius.circular(10.0), // Radio de borde del contenedor del icono
                                        ),
                                        child: Icon(
                                          Icons.local_gas_station,
                                          color: Colors.white, // Color del icono
                                          size: 24, // Tamaño del icono
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Rectángulo 4
                      Padding(
                        padding: EdgeInsets.all(8.0), // Espacio de separación
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0), // Radio de borde
                          child: Container(
                            color: Color(0xFF527DAA),
                            width: double.infinity,
                            height: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    color: Color(0xFF527DAA),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Mileage',
                                          style: TextStyle(fontSize: 12, color: Colors.white),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          carDetail.mileage.toString()!,
                                          style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                  thickness: 2.0,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF527DAA),
                                      borderRadius: BorderRadius.circular(10.0), // Radio de borde del contenedor
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0x7B7790AB), // Color de fondo del contenedor del icono
                                          borderRadius: BorderRadius.circular(10.0), // Radio de borde del contenedor del icono
                                        ),
                                        child: Icon(
                                          Icons.speed,
                                          color: Colors.white, // Color del icono
                                          size: 24, // Tamaño del icono
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 250,
                    margin: EdgeInsets.symmetric(horizontal: 8.0), // Márgenes horizontales de 4 píxeles
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), // Bordes redondeados de 10 unidades
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Color del sombreado
                          spreadRadius: 2, // Radio de propagación del sombreado
                          blurRadius: 5, // Radio de desenfoque del sombreado
                          offset: Offset(0, 3), // Desplazamiento del sombreado (eje x, eje y)
                        ),
                      ],
                    ),
                    child: Image.network(
                      carDetail.image!,
                      width: double.infinity, // Ancho máximo disponible
                      fit: BoxFit.fill, // Ajuste de la imagen para cubrir el ancho disponible
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                // Acción al hacer clic en el botón
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
                                'View in AR',
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
                  SizedBox(height: 10),
                  /*Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: List.generate(6, (index) {
                      return Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFF527DAA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Texto',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),*/
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      carDetail.description!,
                      style: TextStyle(
                          color: Color(0xFF444446),
                          fontSize: 18.0
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Owner',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(carDetail.user!.photo),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                carDetail.user!.name+" "+carDetail.user!.lastName,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: List.generate(5, (i) {
                                      if (i < carDetail.user!.score.floor()) {
                                        return Icon(
                                          Icons.star,
                                          color: Color(0xFF527DAA),
                                          size: 18.0,
                                        );
                                      } else if (i == carDetail.user!.score.floor() && carDetail.user!.score % 1 != 0 ) {
                                        return Icon(
                                          Icons.star_half,
                                          color: Color(0xFF527DAA),
                                          size: 18.0,
                                        );
                                      }else {
                                        return Icon(
                                          Icons.star_border,
                                          color: Color(0xFF527DAA),
                                          size: 18.0,
                                        );
                                      }
                                    }),
                                  ),
                                  Text(
                                    ' ${carDetail.user!.score}/5.0',
                                    style: TextStyle(
                                      color: Color(0xFF444446),
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Price Per Day',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child:  Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Text(
                              '\$'+""+carDetail.pricePerDay.toString()!+"/day",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              GlobalCarReserv.carId=carDetail.id!;
                              GlobalCarReserv.price=carDetail.pricePerDay!;
                              GlobalCarReserv.locations=carDetail.locations!;
                              GlobalOwnerReserv.ownerId=carDetail.user!.id;
                              Navigator.pushNamed(context, '/reservation-screen');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF527DAA),
                              padding: EdgeInsets.symmetric(horizontal:10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              // Personaliza el color de fondo del botón
                              // background color: Colors.blue,
                            ),
                            child: Text(
                              'Reserve Now',
                              style: TextStyle(
                                color: Colors.white, // Color del texto del botón
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 10),
                  Flexible(child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: carDetail.scoresCar!.length,
                      itemBuilder: (context, index){
                        return Card(
                          elevation: 4.0,
                          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(
                              color: Color(0xFF527DAA).withOpacity(0.5),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: List.generate(5, (i) {
                                        if (i < carDetail.scoresCar![index].score.floor()) {
                                          return Icon(
                                            Icons.star,
                                            color: Color(0xFF527DAA),
                                            size: 18.0,
                                          );
                                        } else if (i == carDetail.scoresCar![index].score.floor() && carDetail.scoresCar![index].score % 1 != 0 ) {
                                          return Icon(
                                            Icons.star_half,
                                            color: Color(0xFF527DAA),
                                            size: 18.0,
                                          );
                                        }else {
                                          return Icon(
                                            Icons.star_border,
                                            color: Color(0xFF527DAA),
                                            size: 18.0,
                                          );
                                        }
                                      }),
                                    ),
                                    Text(
                                      ' ${carDetail.scoresCar![index].score}/5.0',
                                      style: TextStyle(
                                        color: Color(0xFF444446),
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                SizedBox(height: 8),
                                Text(carDetail.scoresCar![index].comment),
                              ],
                            ),
                          ),
                        );
                      }
                  )
                  ),
                  /*Expanded(child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: scores.length,
                    itemBuilder: (context, index){
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: List.generate(5, (i) {
                                    if (i < scores[index].score.floor()) {
                                      return Icon(
                                        Icons.star,
                                        color: Color(0xFF527DAA),
                                        size: 18.0,
                                      );
                                    } else if (i == scores[index].score.floor() && scores[index].score % 1 != 0 ) {
                                      return Icon(
                                        Icons.star_half,
                                        color: Color(0xFF527DAA),
                                        size: 18.0,
                                      );
                                    }else {
                                      return Icon(
                                        Icons.star_border,
                                        color: Color(0xFF527DAA),
                                        size: 18.0,
                                      );
                                    }
                                  }),
                                ),
                                Text(
                                  ' ${ownerScore}/5.0',
                                  style: TextStyle(
                                    color: Color(0xFF444446),
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Nombre y Apellido',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text('Comentario'),
                          ],
                        ),
                      );
                    }
                )
                )*/
                ],
              ),
            ),
          ],
        ),
      );
    }

  }
}
