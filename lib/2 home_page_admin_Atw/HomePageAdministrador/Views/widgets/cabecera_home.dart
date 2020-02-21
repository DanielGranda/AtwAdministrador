import 'package:administrador/1 User/bloc/bloc_user.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class CabeceraHome extends StatelessWidget {
  const CabeceraHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder<Object>(
      stream: userBloc.streamFirebase,
      builder: (context, snapshot) {
        return ListTile(
          trailing: CircleAvatar(
            backgroundImage: AssetImage('assets/icon/icoEps.png'),
          ),
          title: Text(
            'Marcelo Granda',
            style: TextStyle(
              fontFamily: 'Poppins-Medium',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            'Asesor Comercial',
            style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 12,
                //fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        );
      }
    );
  }
}
