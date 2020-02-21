import 'package:administrador/2 home_page_admin_Atw/HomePageAdministrador/Views/widgets/cabecera_home.dart';
import 'package:administrador/2 home_page_admin_Atw/HomePageAdministrador/Views/widgets/estadisticas.dart';
import 'package:administrador/2 home_page_admin_Atw/HomePageAdministrador/Views/widgets/fondo_home.dart';
import 'package:administrador/2 home_page_admin_Atw/HomePageAdministrador/Views/widgets/menu_lateral.dart';
import 'package:administrador/2 home_page_admin_Atw/HomePageAdministrador/Views/widgets/notificaciones.dart';
import 'package:administrador/2 home_page_admin_Atw/HomePageAdministrador/Views/widgets/quejas.dart';
import 'package:administrador/2 home_page_admin_Atw/HomePageAdministrador/Views/widgets/registro_empresa_transporte.dart';
import 'package:administrador/2 home_page_admin_Atw/HomePageAdministrador/Views/widgets/reportes.dart';
import 'package:administrador/2 home_page_admin_Atw/HomePageAdministrador/Views/widgets/salir_app.dart';
import 'package:administrador/2%20home_page_admin_Atw/HomePageAdministrador/Views/widgets/registro_unidad_educativa.dart';
import 'package:flutter/material.dart';

class HomePageAtwAdmin extends StatefulWidget {
  @override
  _HomePageAtwAdminState createState() => _HomePageAtwAdminState();
}

class _HomePageAtwAdminState extends State<HomePageAtwAdmin> {
  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          //backgroundColor: Color(hexColor('#F6C34F')),
          title: CabeceraHome()),
      drawer: MenuLateral(
          //auth: widget.auth,
          ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FondoHome(),
          Column(
            children: <Widget>[
              RegistroUnidadEducativa(alto: alto, ancho: ancho),
              RegistroEmpresaTransporte(alto: alto, ancho: ancho),
              Flexible(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Reportes(alto: alto, ancho: ancho),
                    Quejas(alto: alto, ancho: ancho),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Notificaciones(alto: alto, ancho: ancho),
                    Estadisticas(alto: alto, ancho: ancho),
                    SalirApp(alto: alto, ancho: ancho),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
