
import 'package:administrador/4%20perfil_usuario/views/widgets/cabecera_perfil.dart';
import 'package:administrador/4%20perfil_usuario/views/widgets/fondoRegistro.dart';
import 'package:administrador/4%20perfil_usuario/views/widgets/formulario_perfil.dart';
import 'package:administrador/4%20perfil_usuario/views/widgets/tarjeta_perfil.dart';
import 'package:administrador/utils/hexaColor.dart';
import 'package:flutter/material.dart';

class PerfilUserAdmin extends StatefulWidget {
  @override
  _PerfilUserAdminState createState() => _PerfilUserAdminState();
}

//UserBloc userBloc;

class _PerfilUserAdminState extends State<PerfilUserAdmin> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FondoRegistro(),
          SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      CabeceraPerfil(),
               
                      TarjetaPerfilFoto(
                        title: 'Marcelo Granda',
                    urlImg: 'assets/daniel.png',
                        tipoEPS: 'Asesor  Comercial',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FormularioPerfil(),
                      SizedBox(
                        height: 10,
                      ),
                   
                      Divider(),
                      SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
