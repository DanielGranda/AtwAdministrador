import 'package:administrador/utils/hexaColor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddServicio extends StatefulWidget {

  @override
  _AddServicioState createState() => _AddServicioState();
}

class _AddServicioState extends State<AddServicio> {
/*    bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();
    _checkEmailVerification();
    
  }

  void _checkEmailVerification() async {
    _isEmailVerified =await  Provider.of<Auth>(context, listen: false).isEmailVerified();
    //print(object)
    //_isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) {
      _showVerifyEmailDialog();
    }
  } */

/*    void _showVerifyEmailDialog() {
    AwesomeDialog(
        btnOkColor: Color(hexColor('#F6C34F')),
        context: context,
        dialogType: DialogType.WARNING,
        animType: AnimType.TOPSLIDE,
        tittle: 'Verificación',
        desc:
            'El enlace para verificar la cuenta ha sido enviado a su correo electrónico',
        btnCancelText: 'Reenviar mail',
        btnCancelOnPress: () {
          Navigator.of(context).pop();
          //_resentVerifyEmail();
        });
    //btnCancelOnPress: () {},
    /*   btnOkOnPress: () {
          Navigator.of(context).pop();
        }).show(); */
/*     showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Please verify account in the link sent to email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Resent link"),
              onPressed: () {
                Navigator.of(context).pop();
                _resentVerifyEmail();
              },
            ),
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ); */
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.chevronCircleLeft,
            color: Color(hexColor('#61B4E5')),
            size: 30,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          },
        ),
        backgroundColor: Colors.white,
        title: Text('Registro Unidad Educativa'.toUpperCase(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(hexColor('#5CC4B8')),
            )),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstIn),
              image: AssetImage("assets/backGround/FondoBlancoATW.png"),
              fit: BoxFit.contain,
            )),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(hexColor('#3A4A64')),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'regUe');
        },
      ),
    );
  }
}
