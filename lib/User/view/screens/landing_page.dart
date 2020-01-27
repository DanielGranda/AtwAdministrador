import 'package:administrador/User/bloc/bloc_user.dart';
import 'package:administrador/User/services/auth_services_firebase.dart';
import 'package:administrador/pagesUi/HomePageAdministrador/Views/screens/homeAdministradora.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'ingresoAtw.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      stream: userBloc.onAuthStateChanged(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User user = snapshot.data;

          if (user ==  null) {
            return   
            IngresoAtwAdmin();
          }
          print('Sesión iniciada con:$user');
          return HomePageAtwAdmin();
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
