import 'package:administrador/utils/hexaColor.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '1 User/bloc/bloc_user.dart';
import '1 User/view/screens/ingreso2.dart';
import '1 User/view/screens/ingresoAtw.dart';
import '1 User/view/screens/reestablecer_password.dart';
import '2 home_page_admin_Atw/HomePageAdministrador/Views/screens/homeAdministradora.dart';
import '3 registro_unidad_educativa/views/screens/boton_add_servicio_menu.dart';
import '3 registro_unidad_educativa/views/screens/reg_ue_menu2.dart';
import '3 registro_unidad_educativa/views/widgets/botonAddProducto.dart';
import '3 registro_unidad_educativa/views/widgets/botonAddRoles.dart';
import '3 registro_unidad_educativa/views/widgets/regPlantel.dart';
import '3 registro_unidad_educativa/views/widgets/regProducto.dart';
import '3 registro_unidad_educativa/views/widgets/regRolesPlantel.dart';
import '4 perfil_usuario/views/screens/perfil_user.dart';
import 'utils/prueba.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBloc(),
      child: MaterialApp(
        title: 'Empresa Administradora del Servicio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(hexColor('#3A4A64')),
          fontFamily: 'Poppins-Medium',
        ),
        /* home: 
        //LandingPage2(auth: new Auth()),
        LandingPage(), */
        initialRoute: 'ingreso2',
        routes: {
          //HOME
          'home': (_) => HomePageAtwAdmin(),
          'prueba': (_) => Prueba(),

          //INGRESO
          'ingreso': (_) => IngresoAtwAdmin(),
          'ingreso2': (_) => LoginSignUpPage2(),
          'recuperarClave': (_) => ReestablecerPassword(),
          //REGISTRO UNIDAD EDUCATIVA
          'agregarUe': (_) => AddServicio(),
          'regUe': (_) => RegistroUnidadEducativa(),
          'regplantel': (_) => ResgistroPlantelEducativo(),
          'addRolesPlantel': (_) => AddRolesPlantel(),
          'regRolesPlantel': (_) => ResgistroRolesPlantel(),
          'addProducto': (_) => AddProducto(),
          'regProducto': (_) => ResgistroProducto(),
          //PERFIL DE USUARIO
          'perfil': (_) => PerfilUserAdmin(),

          
        },
      ),
    );
  }
}
