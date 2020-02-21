import 'package:administrador/utils/hexaColor.dart';
import 'package:flutter/material.dart';

class RegistroUnidadEducativa extends StatelessWidget {
  const RegistroUnidadEducativa({
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
                                  image: AssetImage(
                                      'assets/icon/UnidadEduca.png'))),
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
}
