import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  bool _rememberMe = false;
  String _valueType= 'Client';

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style:TextStyle(
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
          height: 60.0,
          child: TextField(
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
              hintText: 'Enter your Email',
              hintStyle: TextStyle(
                color: Color(0xFF6CA8F1),
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,

          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Color(0xFF6CA8F1),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFF6CA8F1),
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(

            style: TextStyle(
              color: Color(0xFF6CA8F1),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'Enter your First Name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLastNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'LastName',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            style: TextStyle(
              color: Color(0xFF6CA8F1),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'Enter your Last Name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildDropDownTF(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Type of user',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _valueType,
                        icon: Icon(Icons.arrow_drop_down,color: Color(0xFF6CA8F1)),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Color(0xFF6CA8F1)),
                        onChanged: (newValue) {
                          setState(() {
                            _valueType = newValue!;
                          });
                        },
                        items: <String>['Client', 'Owner']
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

    );
  }

  Widget _buildDropDown2TF() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        border: Border.all(
          color: Color(0xFF6CA8F1),
          width: 2.0,
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
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _valueType,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Color(0xFF6CA8F1)),
                dropdownColor: Colors.white,
                onChanged: ( newValue) {
                  setState(() {
                    _valueType = newValue!;
                  });
                },
                items: <String>['Client', 'Owner']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildAcceptConditionsCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Color(0xFF527DAA)),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Color(0xFF527DAA),
              onChanged: (value){
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Accept conditions',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => {
          if(_valueType=="Client")  {
            Navigator.pushNamed(context, '/client')
          }
          else if(_valueType=="Owner"){
            Navigator.pushNamed(context, '/owner')
          }
        },
        style: ElevatedButton.styleFrom(
            elevation: 5.0,
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            primary: Color(0xFF527DAA)
        ),
        child: Text(
          'REGISTER',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Color(0xFF6CA8F1),
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0)
      ],
    );
  }



  Widget _buildSignInBtn() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/login'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Have an Account? ',
              style: TextStyle(
                color: Color(0xFF6CA8F1),
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign In',
              style: TextStyle(
                color: Color(0xFF6CA8F1),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFFFFFFF),
                      Color(0xFFFFFFFF),
                      Color(0xFFFFFFFF),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 50.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFF6CA8F1),
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      _buildNameTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildLastNameTF(),

                      SizedBox(
                        height: 20.0,
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildPasswordTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildDropDownTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildAcceptConditionsCheckbox(),
                      _buildRegisterBtn(),
                      _buildSignInWithText(),
                      _buildSignInBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  final kHintTextStyle = TextStyle(
    color: Color(0xFF6CA8F1),
    fontFamily: 'OpenSans',
  );

  final kLabelStyle = TextStyle(
    color: Color(0xFF6CA8F1),
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );

  final kBoxDecorationStyle = BoxDecoration(
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
  );
}

