import 'package:administrador/utils/hexaColor.dart';
import 'package:administrador/utils/titulos_estado.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vibration/vibration.dart';

class AddServicio extends StatefulWidget {

  @override
  _AddServicioState createState() => _AddServicioState();
}

class _AddServicioState extends State<AddServicio> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.chevronCircleLeft,
            color: Color(hexColor('#61B4E5')),
            size: 30,
          ),
          onPressed: () async {
            Navigator.popAndPushNamed(context, 'home');
          if (await Vibration.hasVibrator()) {
            Vibration.vibrate();
          }
          },
        ),
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
             
            Text('Registro Unidad Educativa'.toUpperCase(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(hexColor('#5CC4B8')),
                )),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstIn),
              image: AssetImage("assets/backGround/FondoBlancoATW.png"),
              fit: BoxFit.contain,
            )),
          ),
             Column(
               children: <Widget>[
                 Card(
                      color: Color(hexColor('#3A4A64')),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 5),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/icon/UnidadEduca.png'))),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: double.infinity,
                            child: TitulosEstado(
                              color: Color(hexColor('#F6C34F')),
                              title: 'Unidades Educativas Registradas',
                            ),
                          ),
                        ],
                      ),
                    ),
               ],
             ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(hexColor('#3A4A64')),
        child: Icon(Icons.add),
        onPressed: () async {
          Navigator.pushNamed(context, 'regUe');
            if (await Vibration.hasVibrator()) {
            Vibration.vibrate();
          }
        },
      ),
    );
  }
}
