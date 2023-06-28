import 'package:e_rent_car/api-services/api-user.dart';
import 'package:e_rent_car/models/global.dart';
import 'package:e_rent_car/models/user.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ApiUserService apiUserService=new ApiUserService();
  TextEditingController _name=TextEditingController();
  TextEditingController _lastName=TextEditingController();
  TextEditingController _email=TextEditingController();
  String image="";


  User user=new User();
  bool isLoading=true;
  void initState() {
    super.initState();
    getUser();
  }
  Future<void> getUser() async {
    try {
      final response = await apiUserService.getUser(Globals.userId);
      setState(() {
        user = response;
        _name.text=user.name!;
        _lastName.text=user.lastName!;
        _email.text=user.email!;
        image=user.photo!;
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
              'Profile',
              style: TextStyle(
                color: Color(0xFF527DAA),
                fontFamily: 'OpenSans',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 70,
                                backgroundImage: NetworkImage(user.photo!),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF527DAA),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.edit, color: Colors.white),
                                  onPressed: () {
                                    // Acción del botón de editar
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        child: IconButton(
                          icon: Icon(Icons.exit_to_app, color: Colors.red,size: 32,),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              'Name',
                              style: TextStyle(
                                color: Color(0xFF6CA8F1),
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                                fontFamily: 'OpenSans',
                              )
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
                            height: 60.0,
                            child: TextField(
                              controller: _name,
                              style: TextStyle(
                                color: Color(0xFF6CA8F1),
                                fontFamily: 'OpenSans',
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 14.0),
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                  color: Color(0xFF6CA8F1),
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              'LastName',
                              style: TextStyle(
                                color: Color(0xFF6CA8F1),
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                                fontFamily: 'OpenSans',
                              )
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
                            height: 60.0,
                            child: TextField(
                              controller: _lastName,
                              style: TextStyle(
                                color: Color(0xFF6CA8F1),
                                fontFamily: 'OpenSans',
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 14.0),
                                hintText: 'Last Name',
                                hintStyle: TextStyle(
                                  color: Color(0xFF6CA8F1),
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Email',
                            style:TextStyle(
                              color: Color(0xFF6CA8F1),
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
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
                            height: 60.0,
                            child: TextField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Color(0xFF6CA8F1),
                                fontFamily: 'OpenSans',
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color(0xFF6CA8F1),
                                ),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: Color(0xFF6CA8F1),
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}
