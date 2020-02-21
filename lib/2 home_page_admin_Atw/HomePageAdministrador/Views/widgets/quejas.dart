import 'package:administrador/utils/hexaColor.dart';
import 'package:flutter/material.dart';

class Quejas extends StatelessWidget {
  const Quejas({
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
                  Color(hexColor('#61B4E5')).withOpacity(0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: alto / 14,
                          width: ancho / 3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/icon/quejas.png'))),
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
}