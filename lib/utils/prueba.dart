import 'package:flutter/material.dart';

class Prueba extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/icon/construccion.gif'),
        )
      ),
    );
  }
}