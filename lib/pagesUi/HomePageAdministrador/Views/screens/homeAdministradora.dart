import 'package:administrador/pagesUi/HomePageAdministrador/Views/widgets/menu_lateral.dart';
import 'package:administrador/utils/hexaColor.dart';
import 'package:flutter/material.dart';

class HomePageAtwAdmin extends StatefulWidget {

  const HomePageAtwAdmin({Key key, })
      : super(key: key);

  @override
  _HomePageAtwAdminState createState() => _HomePageAtwAdminState();
}

class _HomePageAtwAdminState extends State<HomePageAtwAdmin> {
  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: cabecera(),
      drawer: MenuLateral(),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          fondo(),
          Column(
            children: <Widget>[
              botonRegUe(alto, ancho, context),
              botonRegEmpTransporte(alto, ancho, context),
              Flexible(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    reportes(alto, ancho, context),
                    botonQuejas(alto, ancho, context),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    botonNotificaciones(alto, ancho, context),
                    botonEstadisticas(alto, ancho, context),
                    botonSalir(alto, ancho, context),
                  ],
                ),
              )
            ],
          )
          /* Container(
            child: Expanded(
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('Henry Urrea'),
                        subtitle: Text('Coordinador Empresa Administradora'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ), */
        ],
      ),
    );
  }

  AppBar cabecera() {
    return AppBar(
        centerTitle: true,
        //backgroundColor: Color(hexColor('#F6C34F')),
        title: ListTile(
          trailing: CircleAvatar(
            backgroundImage: AssetImage('assets/icon/icoEps.png'),
          ),
          title: Text(
            'Granda Pillajo Daniel',
            style: TextStyle(
              fontFamily: 'Poppins-Medium',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            'Asesor Comercial',
            style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 12,
                //fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ));
  }

  Flexible botonRegUe(double alto, double ancho, BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'agregarUe');
        },
        child: Card(
          elevation: 15,
          color: Colors.transparent,
          child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(hexColor('#5CC4B8')).withOpacity(0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SingleChildScrollView(
                                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: alto / 10,
                          width: ancho / 2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/icon/UnidadEduca.png'))),
                        ),
                        Text(
                          'Registro Unidades Educativas',
                          style: TextStyle(
                              fontFamily: 'Poppins-Bold',
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Flexible reportes(double alto, double ancho, BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'prueba');
        },
        child: Card(
          elevation: 15,
          color: Colors.transparent,
          child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(hexColor('#61B4E5')).withOpacity(0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SingleChildScrollView(
                                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: alto / 14,
                          width: ancho / 3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/icon/novedades.png'))),
                        ),
                        Text(
                          'Reportes',
                          style: TextStyle(
                              fontFamily: 'Poppins-Bold',
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Flexible botonNotificaciones(
      double alto, double ancho, BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'prueba');
        },
        child: Card(
          elevation: 15,
          color: Colors.transparent,
          child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(hexColor('#F6C34F')).withOpacity(0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SingleChildScrollView(
                                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: alto / 14,
                          width: ancho / 4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/icon/notific.png'))),
                        ),
                        Text(
                          'Notificaciones',
                          style: TextStyle(
                              fontFamily: 'Poppins-Bold',
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Flexible botonEstadisticas(double alto, double ancho, BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'prueba');
        },
        child: Card(
          elevation: 15,
          color: Colors.transparent,
          child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(hexColor('#F6C34F')).withOpacity(0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SingleChildScrollView(
                                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: alto / 14,
                          width: ancho / 4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/icon/estadisticas.png'))),
                        ),
                        Text(
                          'Estadísticas',
                          style: TextStyle(
                              fontFamily: 'Poppins-Bold',
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Flexible botonSalir(double alto, double ancho, BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'ingreso');
        },
        child: Card(
          elevation: 15,
          color: Colors.transparent,
          child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(hexColor('#F6C34F')).withOpacity(0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SingleChildScrollView(
                                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: alto / 14,
                          width: ancho / 4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/icon/salir.png'))),
                        ),
                        Text(
                          'Salir',
                          style: TextStyle(
                              fontFamily: 'Poppins-Bold',
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Flexible botonQuejas(double alto, double ancho, BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'prueba');
        },
        child: Card(
          elevation: 15,
          color: Colors.transparent,
          child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(hexColor('#61B4E5')).withOpacity(0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SingleChildScrollView(
                                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: alto / 14,
                          width: ancho / 3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/icon/quejas.png'))),
                        ),
                        Text(
                          'Gestión de quejas',
                          style: TextStyle(
                              fontFamily: 'Poppins-Bold',
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Flexible botonRegEmpTransporte(
      double alto, double ancho, BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'prueba');
        },
        child: Card(
          elevation: 15,
          color: Colors.transparent,
          child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(hexColor('#5CC4B8')).withOpacity(0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SingleChildScrollView(
                                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: alto / 10,
                          width: ancho / 2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/icon/bus.png'))),
                        ),
                        Text(
                          'Registro Empresas deTransporte',
                          style: TextStyle(
                              fontFamily: 'Poppins-Bold',
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Container fondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
          image: DecorationImage(
        colorFilter: ColorFilter.mode(
            //Colors.black.withOpacity(0.2), BlendMode.colorBurn),
            Colors.black.withOpacity(0.1),
            BlendMode.colorBurn),
        // image: AssetImage("assets/backGround/backGroundAtw.png"),
        image: AssetImage("assets/backGround/FondoBlancoATW.png"),
        fit: BoxFit.contain,
      )),
    );
  }

}

