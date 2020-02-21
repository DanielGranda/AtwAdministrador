import 'package:administrador/1 User/services/auth_serviesFirebase.dart';
import 'package:administrador/utils/hexaColor.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({
    Key key,
    this.auth,
    this.onSignedOut,
  }) : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;

  @override
  Widget build(BuildContext context) {
    // final userBloc = BlocProvider.of<UserBloc>(context);
    return SafeArea(
      child: Container(
        width: 270,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/icon/icoEps.png'),
            ),
            SizedBox(height: 15),
            Divider(
              height: 15,
              color: Color(hexColor('#3A4A64')),
              thickness: 5,
            ),
            SizedBox(height: 5),
            Container(
              color: Colors.white30,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/icon/perfil.png'),
                  radius: 25,
                ),
                title: Text(
                  'Perfil',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 12,
                    color: Color(hexColor('#3A4A64')),
                  ),
                ),
                trailing: Icon(
                  (Icons.arrow_forward_ios),
                ),
                onTap: () async {
                  Navigator.pushNamed(context, 'perfil');
                  if (await Vibration.hasVibrator()) {
                    Vibration.vibrate();
                  }
                },
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              color: Colors.white30,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/icon/config.png'),
                  radius: 25,
                ),
                title: Text(
                  'Configuraciones',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 12,
                    color: Color(hexColor('#3A4A64')),
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () async {
                  Navigator.pushNamed(context, 'prueba');
                  if (await Vibration.hasVibrator()) {
    Vibration.vibrate();
}
                },
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              color: Colors.white30,
              child: ListTile(
                onTap: () {
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.WARNING,
                      animType: AnimType.TOPSLIDE,
                      tittle: 'Confirmación de Salida',
                      desc: '¿Desea salir del sistema?',
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
                  //auth.signOut2();
                  //userBloc.signOut();
                  //onSignedOut();
                  //Navigator.pushReplacementNamed(context, 'ingreso');
                  // Navigator.pushNamed(context, 'ingreso');
                  //Navigator.popAndPushNamed(context, 'ingreso');
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/icon/exit.png'),
                  radius: 25,
                ),
                title: Text(
                  'Cerrar Sesión',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 12,
                    color: Color(hexColor('#3A4A64')),
                  ),
                ),
                trailing: Icon(
                  (Icons.arrow_forward_ios),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
