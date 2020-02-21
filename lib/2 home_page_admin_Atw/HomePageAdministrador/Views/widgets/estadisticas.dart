import 'package:administrador/utils/hexaColor.dart';
import 'package:flutter/material.dart';

class Estadisticas extends StatelessWidget {
  const Estadisticas({
    Key key,
    @required this.alto,
    @required this.ancho,
  }) : super(key: key);

  final double alto;
  final double ancho;

  @override
  Widget build(BuildContext context) {
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
              color:
                  Color(hexColor('#F6C34F')).withOpacity(0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
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
}
