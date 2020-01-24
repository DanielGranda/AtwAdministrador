import 'package:administrador/pagesUi/RegUnidadEducativa/botonAddProducto.dart';
import 'package:administrador/pagesUi/RegUnidadEducativa/botonAddServicio.dart';
import 'package:administrador/pagesUi/RegUnidadEducativa/regPlantel.dart';
import 'package:administrador/pagesUi/RegUnidadEducativa/regProducto.dart';
import 'package:administrador/pagesUi/RegUnidadEducativa/regRolesPlantel.dart';
import 'package:administrador/pagesUi/RegUnidadEducativa/regUnidEducativas.dart';
import 'package:administrador/pagesUi/ingreso/ingresoAtw.dart';
import 'package:administrador/utils/hexaColor.dart';
import 'package:flutter/material.dart';

import 'pagesUi/HomePageAdministrador/homeAdministradora.dart';
import 'pagesUi/RegUnidadEducativa/botonAddRoles.dart';
import 'utils/prueba.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Empresa Administradora del Servicio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(hexColor('#3A4A64')),
        fontFamily: 'Poppins-Medium',
      ),
      initialRoute: 'ingreso',
      routes: {
        'home': (_) => HomePageAtw(),
        'prueba': (_) => Prueba(),

        //INGRESO
        'ingreso': (_) => IngresoAtwEscuela(),
        //REGISTRO UNIDAD EDUCATIVA
        'agregarUe': (_) => AddServicio(),
        'regUe': (_) => RegistroUnidadEducativa(),
        'regplantel': (_) => ResgistroPlantelEducativo(),
        'addRolesPlantel': (_) => AddRolesPlantel(),
        'regRolesPlantel': (_) => ResgistroRolesPlantel(),
        'addProducto': (_) => AddProducto(),
        'regProducto': (_) => ResgistroProducto(),
      },
    );
  }
}
