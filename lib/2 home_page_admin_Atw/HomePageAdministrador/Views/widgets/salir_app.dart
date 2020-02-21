import 'package:administrador/1 User/bloc/bloc_user.dart';
import 'package:administrador/utils/hexaColor.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:vibration/vibration.dart';

class SalirApp extends StatelessWidget {
  const SalirApp({
    Key key,
    @required this.alto,
    @required this.ancho,
  }) : super(key: key);

  final double alto;
  final double ancho;

  @override
  Widget build(BuildContext context) {
     // final userBloc = BlocProvider.of<UserBloc>(context);
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
               AwesomeDialog(
                      context: context,
                      dialogType: DialogType.WARNING,
                      animType: AnimType.TOPSLIDE,
                      tittle: 'Confirmación de Salida',
                      desc:
                          '¿Desea salir del sistema?',
                      btnOkColor: Color(hexColor('#5CC4B8')),
                      btnOkText: 'Aceptar',
                      btnOkOnPress: () async {
                        Navigator.popAndPushNamed(context, 'ingreso2');
                        if (await Vibration.hasVibrator()) {
                          Vibration.vibrate();
                        }
                      },
                      btnCancelText: 'Cancelar',
                      btnCancelColor: Color(hexColor('#E86A87')),
                      btnCancelOnPress: () async {
                        if (await Vibration.hasVibrator()) {
                          Vibration.vibrate();
                        }
                      }).show();
         // userBloc.signOut();
           // Navigator.pop(context);
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
}