import 'package:flutter/material.dart';

class CarDetailsClientScreen extends StatefulWidget {
  const CarDetailsClientScreen({Key? key}) : super(key: key);

  @override
  State<CarDetailsClientScreen> createState() => _CarDetailsClientScreenState();
}

class _CarDetailsClientScreenState extends State<CarDetailsClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      'Toyota Camry 2020',
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
                                        'Automatic',
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
                                          '5',
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
                                        'LX5-S82',
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
                                          'Car',
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
                                        'Petrol',
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
                                        '120.85',
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
                   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS24r3KO73-uyse88PPy98qua6CZ11DW-7oNQ&usqp=CAU',
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
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Features',
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
