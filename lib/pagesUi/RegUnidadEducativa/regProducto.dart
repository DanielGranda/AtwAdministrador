import 'dart:io';

import 'package:administrador/utils/hexaColor.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ResgistroProducto extends StatefulWidget {
  ResgistroProducto({Key key}) : super(key: key);

  @override
  _ResgistroProductoState createState() => _ResgistroProductoState();
}

class _ResgistroProductoState extends State<ResgistroProducto> {
  final GlobalKey<FormBuilderState> _productoKey =
      GlobalKey<FormBuilderState>();
  //final GlobalKey<FormBuilderState> _fase2Key = GlobalKey<FormBuilderState>();

  File foto;
  static File galleryFile;
  static Future<File> imageFile;

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          galleryFile = snapshot.data;
          return Image.file(
            snapshot.data,
            width: 30,
            height: 30,
          );
        } else if (snapshot.error != null) {
          return const Text('Error');
        } else
          return Icon(FontAwesomeIcons.image,
              color: Color(hexColor('#61B4E5')));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    cabecera(),
                    SizedBox(
                      height: 10,
                    ),
                    //EXPANDIBLE 1 DATOS PERSONALES
                    formulario1(),
                    //BOTONES
                    Row(
                      children: <Widget>[
                        Expanded(child: SizedBox()),
                        FlatButton(
                          onPressed: () {
                            if (_productoKey.currentState.saveAndValidate()) {
                              print(
                                _productoKey.currentState.value,
                              );
                              print(
                                _productoKey.currentState.value,
                              );

                                          AwesomeDialog(
                                  btnOkColor: Color(hexColor('#5CC4B8')),
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.TOPSLIDE,
                                  tittle: 'Registro Exitoso',
                                  desc:
                                      'Se ha agregado un producto al plantelo',
                                  //btnCancelOnPress: () {},
                                  btnOkOnPress: () {
                                    Navigator.pushNamed(
                                        context, 'regUe');
                                  }).show();
                            } else {
                              print('campos por validar');
                              AwesomeDialog(
                                      btnOkColor: Color(hexColor('#E86A87')),
                                      context: context,
                                      dialogType: DialogType.ERROR,
                                      animType: AnimType.TOPSLIDE,
                                      tittle: 'Error de Registro ',
                                      desc: 'Revise campos obligatorios',
                                      //btnCancelOnPress: () {},
                                      btnOkOnPress: () {
                                        /* Navigator.pushNamed(context, 'registroMonitor'); */
                                      })
                                  .show();
                            }
                            /*     var user =
                                Provider.of<LoginState>(context, listen: false)
                                    .currentUser();

                            if (_fase1Key.currentState.saveAndValidate() &
                                _fase2Key.currentState.saveAndValidate()) {
                              print(
                                _fase1Key.currentState.value,
                              );
                              print(
                                _fase2Key.currentState.value,
                              );
                              Firestore.instance
                                  .collection('user')
                                  .document(user.uid)
                                  .collection('registroMonitorEps')
                                  .document()
                                  .setData({
                                "nombre":
                                    _fase1Key.currentState.value['Nombres'],
                                "apellidos":
                                    _fase1Key.currentState.value['Apellidos'],
                                "cedula":
                                    _fase1Key.currentState.value['Cédula'],
                                "celular":
                                    _fase1Key.currentState.value['Celular'],
                                "email": _fase1Key.currentState.value['Email'],
                                "Fecha_de_Nacimiento":
                                    _fase1Key.currentState.value['edad'],
                                "Tambien_Conductor": _fase1Key
                                    .currentState.value['TambienMonitor'],
                                "Puntos_Licencia": _fase1Key
                                    .currentState.value['PuntosLicencia'],
                              });
                  
                            } */
                          },
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage('assets/icon/ok.png'),
                              ),
                              Text("Registrarce"),
                            ],
                          ),
                        ),
                        FlatButton(
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage('assets/icon/cancel.png'),
                              ),
                              Text("Cancelar"),
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'regUe');
                            //_fase1Key.currentState.reset();
                          },
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container formulario1() {
    return Container(
      child: ExpandablePanel(
        header: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.cogs, color: Color(hexColor('#3A4A64'))),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Ajustes del Servicio',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(hexColor('#3A4A64'))),
                ),
              ],
            ),
            Divider()
          ],
        ),
        collapsed: Container(
          child: FormBuilder(
            key: _productoKey,
            initialValue: {
              'date': DateTime.now(),
              'accept_terms': false,
            },
            autovalidate: true,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                FormBuilderSwitch(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  validators: [
                    FormBuilderValidators.required(
                      errorText: 'Requerido',
                    ),
                  ],
                  activeColor: Color(hexColor('#61B4E5')),
                  inactiveThumbColor: Color(hexColor('#E86A87')),
                  inactiveTrackColor:
                      Color(hexColor('#E86A87')).withOpacity(0.5),
                  label: Text('¿Requiere Proceso de Validación de Rutas?'),
                  attribute: "validacionRutas",
                  initialValue: true,
                ),
                SizedBox(
                  height: 10,
                ),
                FormBuilderSwitch(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  validators: [
                    FormBuilderValidators.required(
                      errorText: 'Requerido',
                    ),
                  ],
                  activeColor: Color(hexColor('#61B4E5')),
                  inactiveThumbColor: Color(hexColor('#E86A87')),
                  inactiveTrackColor:
                      Color(hexColor('#E86A87')).withOpacity(0.5),
                  label: Text('¿Requiere Proceso de Autorización de Salida?'),
                  attribute: "validacionRutas",
                  initialValue: true,
                ),
                SizedBox(
                  height: 10,
                ),
                FormBuilderSwitch(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  validators: [
                    FormBuilderValidators.required(
                      errorText: 'Requerido',
                    ),
                  ],
                  activeColor: Color(hexColor('#61B4E5')),
                  inactiveThumbColor: Color(hexColor('#E86A87')),
                  inactiveTrackColor:
                      Color(hexColor('#E86A87')).withOpacity(0.5),
                  label: Text('¿Requiere Proceso de Autorización de Llegada?'),
                  attribute: "validacionRutas",
                  initialValue: true,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25)),
                  child: FormBuilderSegmentedControl(
                    decoration: InputDecoration(
                        labelText: "Número de tutores por estudiante"),
                    attribute: "tutores",
                    options: List.generate(3, (i) => i + 1)
                        .map((number) => FormBuilderFieldOption(value: number))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FormBuilderDateTimePicker(
                  attribute: "inicioServicio",
                  inputType: InputType.date,
                  style: TextStyle(
                      fontSize: 14, color: Color(hexColor('#61B4E5'))),
                  //format: DateTime(),
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      FontAwesomeIcons.calendar,
                      color: Color(hexColor('#61B4E5')),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: "Inicio de Servicio",
                    labelStyle: TextStyle(
                        fontSize: 14, color: Color(hexColor('#3A4A64'))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FormBuilderDateTimePicker(
                  attribute: "finalizacionServicio",
                  inputType: InputType.date,
                  style: TextStyle(
                      fontSize: 14, color: Color(hexColor('#61B4E5'))),
                  //format: DateTime(),
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      FontAwesomeIcons.calendar,
                      color: Color(hexColor('#61B4E5')),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: "Finalización del Servicio",
                    labelStyle: TextStyle(
                        fontSize: 14, color: Color(hexColor('#3A4A64'))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SafeArea cabecera() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Text(
            'Configuración del Tipo de Servicio'.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(hexColor('#5CC4B8'))),
          ),
          SizedBox(
            height: 5,
          ),
          CircleAvatar(
            backgroundColor: Colors.blueGrey.withOpacity(0.1),
            backgroundImage: AssetImage('assets/icon/config.png'),
            radius: 30,
          ),
          Divider(
            color: Color(hexColor('#3A4A64')),
            thickness: 4,
          ),
        ],
      ),
    );
  }
}
