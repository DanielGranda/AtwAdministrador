import 'dart:convert';

import 'package:administrador/utils/hexaColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;

class IngresoAtwEscuela extends StatefulWidget {
  IngresoAtwEscuela({Key key}) : super(key: key);

  @override
  _IngresoAtwEscuelaState createState() => _IngresoAtwEscuelaState();
}

class _IngresoAtwEscuelaState extends State<IngresoAtwEscuela> {
  final GlobalKey<FormBuilderState> _ingresoPadresKey =
      GlobalKey<FormBuilderState>();

  Color colorField = Colors.white;

  @override
  void initState() {
    super.initState();
    //getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          fondoRegistre(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    cabeceraRegistre(),
                    SizedBox(
                      height: 25,
                    ),
                    camposRegistre(),
                    SizedBox(
                      height: 25,
                    ),
                    botonRegistre(),
                    SizedBox(
                      height: 20,
                    ),
                    //socialLogin(context),
                    //redesSocialesRegistre(),
                    footerregistre(),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*  Column socialLogin(BuildContext context) {
    return Column(
                    children: <Widget>[
                      Text("Social Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              fontFamily: "Poppins-Medium")),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                color: Color(hexColor('#3A4A64'))
                                    .withOpacity(0.5),
                                height: 2,
                                width: 60,
                              ),
                              Text("Social Login",
                                  style: TextStyle(
                                      color: colorField,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      fontFamily: "Poppins-Medium")),
                              Container(
                                color: Color(hexColor('#3A4A64'))
                                    .withOpacity(0.5),
                                height: 2,
                                width: 60,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Consumer<LoginState>(
                            builder: (BuildContext context, LoginState value,
                                Widget child) {
                              if (value.isLoading()) {
                                return CircularProgressIndicator();
                              } else {
                                return child;
                              }
                            },
                            child: SocialIcon(
                              colors: [
                                Color(0xFFff4f38),
                                Color(0xFFff355d),
                              ],
                              iconData: FontAwesomeIcons.google,
                              onPressed: () {
                                Provider.of<LoginState>(context,
                                        listen: false)
                                    .login();
                              },
                            ),
                          ),

                          /*      SocialIcon(
                          colors: [
                            Color(0xFF102397),
                            Color(0xFF187adf),
                            Color(0xFF00eaf8),
                          ],
                          iconData: FontAwesome.facebook_f,
                          onPressed: () {},
                        ), */
                          /* Consumer<LoginState>(
                            builder: (BuildContext context, LoginState value,
                                Widget child) {
                              if (value.isloading()) {
                                return CircularProgressIndicator();
                              } else {
                                return child;
                              }
                            },
                            child: SocialIcon(
                              colors: [
                                Color(0xFFff4f38),
                                Color(0xFFff355d),
                              ],
                              iconData: FontAwesomeIcons.google,
                              onPressed: () {
                              /*   Provider.of<LoginState>(context,
                                        listen: false)
                                    .login(); */
                              },
                            ),
                          ), */
                          /*  SocialIcon(
                          colors: [
                            Color(0xFF17ead9),
                            Color(0xFF6078ea),
                          ],
                          iconData: FontAwesome.linkedin,
                          onPressed: () {},
                        ),
                        SocialIcon(
                          colors: [
                            Color(0xFF00c6fb),
                            Color(0xFF005bea),
                          ],
                          iconData: FontAwesome.whatsapp,
                          onPressed: () {},
                        ) */
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
  } */

  Widget botonRegistre() {
    return InkWell(
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Color(hexColor('#F6C34F'))]),
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF6078ea).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              registrar();
            },
            child: Center(
              child: Text("INGRESAR",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins-Bold",
                      fontSize: 18,
                      letterSpacing: 1.0)),
            ),
          ),
        ),
      ),
    );
  }

  registrar() async {
    await Future.delayed(Duration(seconds: 5),()=>CircularProgressIndicator());

    _ingresoPadresKey.currentState.saveAndValidate();
    print(
      _ingresoPadresKey.currentState.value,
    );
    if (_ingresoPadresKey.currentState.value['email'] ==
        userData[0]["nombre"]
        ) {
          Navigator.pushNamed(context, 'home');
    } else {
        print('no usuario no registrado');
    }

    //var user = Provider.of<LoginState>(context, listen: false).currenUser();
    /* if (_ingresoPadresKey.currentState.saveAndValidate()) {
      print(
        _ingresoPadresKey.currentState.value,
      );
      Navigator.pushReplacementNamed(context, 'home');
 */
    /*    final _auth = FirebaseAuth.instance;

    if (_ingresoPadresKey.currentState.saveAndValidate()) {
      print(
        _ingresoPadresKey.currentState.value,
      );
      await _auth
          .createUserWithEmailAndPassword(
        email: _ingresoPadresKey.currentState.value['email'],
        password: _ingresoPadresKey.currentState.value['Password'],
      )
          .then((user) {
        print('registro exitoso con el usuario:${user.user.email} ');
        //Provider.of<LoginState>(context, listen: false).login();
        Navigator.pushNamed(context, '/');
      }).catchError((e) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(e.message),
        ));
      }); */

    /*      if (user!=null) {
Provider.of<LoginState>(context, listen: false).login();
        
      } */
  }

  Row footerregistre() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "estas Registrado? ",
          style: TextStyle(fontFamily: "Poppins-Medium", color: Colors.grey),
        ),
        InkWell(
          onTap: () {},
          child: Text("Login",
              style: TextStyle(
                  color: Color(hexColor('#F6C34F')),
                  fontFamily: "Poppins-Bold")),
        )
      ],
    );
  }

  /* Column redesSocialesRegistre() {
    //var FontAwesome;
    return Column(
      children: <Widget>[
        Text("Social Login",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                fontFamily: "Poppins-Medium")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  color: Color(hexColor('#3A4A64')).withOpacity(0.5),
                  height: 2,
                  width: 60,
                ),
                Text("Social Login",
                    style: TextStyle(
                        color: colorField,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        fontFamily: "Poppins-Medium")),
                Container(
                  color: Color(hexColor('#3A4A64')).withOpacity(0.5),
                  height: 2,
                  width: 60,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*      SocialIcon(
                                colors: [
                                  Color(0xFF102397),
                                  Color(0xFF187adf),
                                  Color(0xFF00eaf8),
                                ],
                                iconData: FontAwesome.facebook_f,
                                onPressed: () {},
                              ), */
            SocialIcon(
              colors: [
                Color(0xFFff4f38),
                Color(0xFFff355d),
              ],
              iconData: FontAwesomeIcons.google,
              onPressed: () {
                //Provider.of<LoginState>(context,).login();
              },
            ),
            /*  SocialIcon(
                            colors: [
                              Color(0xFF17ead9),
                              Color(0xFF6078ea),
                            ],
                            iconData: FontAwesome.linkedin,
                            onPressed: () {},
                          ),
                          SocialIcon(
                            colors: [
                              Color(0xFF00c6fb),
                              Color(0xFF005bea),
                            ],
                            iconData: FontAwesome.whatsapp,
                            onPressed: () {},
                          ) */
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  } */

  FormBuilder camposRegistre() {
    return FormBuilder(
      key: _ingresoPadresKey,
      initialValue: {
        'date': DateTime.now(),
        'accept_terms': false,
      },
      autovalidate: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            FormBuilderTextField(
              keyboardType: TextInputType.emailAddress,
              attribute: "email",
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.alternate_email, color: colorField),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Email",
                  labelStyle: TextStyle(fontSize: 14, color: colorField),
                  helperStyle: TextStyle(fontSize: 12, color: colorField),
                  hintText: 'Ingrese su email'),
              style: TextStyle(fontSize: 14, color: colorField),
              validators: [
                FormBuilderValidators.required(
                  errorText: 'Requerido',
                ),
              /*   FormBuilderValidators.email(
                    errorText: 'Debe ser un correo válido') */
              ],
            ),
            SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              keyboardType: TextInputType.emailAddress,
              attribute: "Password",
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.lock, color: colorField),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Contraseña",
                  labelStyle: TextStyle(fontSize: 14, color: colorField),
                  helperStyle: TextStyle(fontSize: 12, color: colorField),
                  hintText: 'Ingrese su contraseña'),
              style: TextStyle(fontSize: 14, color: colorField),
              validators: [
                FormBuilderValidators.required(
                  errorText: 'Requerido',
                ),
                FormBuilderValidators.minLength(6,
                    errorText: 'Mínimo 6 caracteres')
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container fondoRegistre() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
          image: DecorationImage(
        colorFilter: ColorFilter.mode(
            //Colors.black.withOpacity(0.2), BlendMode.colorBurn),
            Colors.black.withOpacity(0.1),
            BlendMode.darken),
        // image: AssetImage("assets/backGround/backGroundAtw.png"),
        image: AssetImage("assets/backGround/backGroundAtw.png"),
        fit: BoxFit.contain,
      )),
    );
  }

  SafeArea cabeceraRegistre() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(
                "assets/icon/logoAtw.png",
                width: 60,
                height: 60,
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(width: 10),
              Column(
                children: <Widget>[
                  Text("ANTAWA SCHOOL",
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(hexColor('#5CC4B8')),
                          fontFamily: "Poppins-Bold",
                          letterSpacing: .6,
                          fontWeight: FontWeight.bold)),
                  Text("Administrador",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(hexColor('#5CC4B8')),
                          fontFamily: "Poppins-Bold",
                          letterSpacing: .6,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Text('INGRESO',
                  style: TextStyle(
                      color: Color(hexColor('#F6C34F')),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: "Poppins-Bold",
                      letterSpacing: .6)),
            ],
          ),
        ],
      ),
    );
  }

  List userData;
  Map data;
  getUser() async {
    try {
      http.Response reponse =
          await http.get('http://192.168.0.109:3000/unidad');
      debugPrint(reponse.body);
      data = json.decode(reponse.body);
      setState(() {
        userData = data['unidades'];
      });
    } catch (e) {
      print(e.toString());
    }
    print("${userData[0]["nombre"]}");
    //Condicional de ingreso
 /*    if (userData[0]["nombre"] == 'Henry Urre4') {
      Navigator.pushNamed(context, 'home');
    } else {
      print('no usuario no registrado');
    } */
  }
}
