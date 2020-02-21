import 'package:administrador/1 User/view/widgets/boton_ingreso.dart';
import 'package:administrador/1 User/view/widgets/cabecera.dart';
import 'package:administrador/1 User/view/widgets/fondo_ingreso.dart';
import 'package:administrador/1 User/view/widgets/formulario_SingIn.dart';
import 'package:administrador/1 User/view/widgets/pie_app_ingreso.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class IngresoAtwAdmin extends StatefulWidget {
  IngresoAtwAdmin({Key key}) : super(key: key);

  @override
  _IngresoAtwAdminState createState() => _IngresoAtwAdminState();
}

class _IngresoAtwAdminState extends State<IngresoAtwAdmin> {
  final GlobalKey<FormBuilderState> _ingresoPadresKey =
      GlobalKey<FormBuilderState>();

  Color colorField = Colors.white;


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FondoIngreso(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Cabecera(),
                    SizedBox(
                      height: 25,
                    ),
                    FormularioSingIn(
                        ingresoAdminKey: _ingresoPadresKey,
                        colorField: colorField),
                    SizedBox(
                      height: 25,
                    ),
                    BotonSingInIngreso(
                        ingresoAdminKey: _ingresoPadresKey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //RedesSocialesSignIn(colorField: colorField),
                    PieAppIngreso(),
                    SizedBox(
                      height: 300,
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

  
}
