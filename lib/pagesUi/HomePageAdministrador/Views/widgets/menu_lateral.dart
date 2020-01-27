import 'package:administrador/User/bloc/bloc_user.dart';
import 'package:administrador/utils/hexaColor.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
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
                onTap: () {},
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
                onTap: () {},
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              color: Colors.white30,
              child: ListTile(
                onTap: () {
                  userBloc.signOut();
                  //Navigator.pushReplacementNamed(context, 'ingreso');
                 // Navigator.pushNamed(context, 'ingreso');
                  //Navigator.popAndPushNamed(context, 'ingreso');
                  Navigator.pop(context);
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
