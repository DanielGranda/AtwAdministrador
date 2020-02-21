import 'package:administrador/2%20home_page_admin_Atw/HomePageAdministrador/Views/widgets/fondo_home.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class Prueba extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FondoHome(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                                  child: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () async {
                    Navigator.popAndPushNamed(context, 'home');
                    if (await Vibration.hasVibrator()) {
    Vibration.vibrate();
}
                  }),
                ),
                SizedBox( height: 30),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/icon/construccion.gif'),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}