import 'package:administrador/pagesUi/HomePageAdministrador/Views/screens/homeAdministradora.dart';
import 'package:administrador/pagesUi/RegUnidadEducativa/botonAddProducto.dart';
import 'package:administrador/pagesUi/RegUnidadEducativa/botonAddServicio.dart';
import 'package:administrador/pagesUi/RegUnidadEducativa/regPlantel.dart';
import 'package:administrador/pagesUi/RegUnidadEducativa/regProducto.dart';
import 'package:administrador/pagesUi/RegUnidadEducativa/regRolesPlantel.dart';
import 'package:administrador/pagesUi/RegUnidadEducativa/regUnidEducativas.dart';
import 'package:administrador/utils/hexaColor.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'User/bloc/bloc_user.dart';
import 'User/services/auth_serviesFirebase.dart';
import 'User/view/screens/ingresoAtw.dart';
import 'User/view/screens/landing_page.dart';
import 'home/services/root.dart';
import 'pagesUi/RegUnidadEducativa/botonAddRoles.dart';
import 'utils/prueba.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBloc(),
      child: MaterialApp(
        title: 'Empresa Administradora del Servicio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(hexColor('#3A4A64')),
          fontFamily: 'Poppins-Medium',
        ),
        home: 
         new RootPage(auth: new Auth()),
        //LandingPage(),
        //initialRoute: 'ingreso',
        routes: {
          'home': (_) => HomePageAtwAdmin(),
          'prueba': (_) => Prueba(),

          //INGRESO
          'ingreso': (_) => IngresoAtwAdmin(),
          //REGISTRO UNIDAD EDUCATIVA
          'agregarUe': (_) => AddServicio(),
          'regUe': (_) => RegistroUnidadEducativa(),
          'regplantel': (_) => ResgistroPlantelEducativo(),
          'addRolesPlantel': (_) => AddRolesPlantel(),
          'regRolesPlantel': (_) => ResgistroRolesPlantel(),
          'addProducto': (_) => AddProducto(),
          'regProducto': (_) => ResgistroProducto(),
        },
      ),
    );
  }
}
