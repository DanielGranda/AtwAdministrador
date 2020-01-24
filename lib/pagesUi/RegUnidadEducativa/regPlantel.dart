import 'dart:io';

import 'package:administrador/utils/hexaColor.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ResgistroPlantelEducativo extends StatefulWidget {
  ResgistroPlantelEducativo({Key key}) : super(key: key);

  @override
  _ResgistroPlantelEducativoState createState() =>
      _ResgistroPlantelEducativoState();
}

class _ResgistroPlantelEducativoState extends State<ResgistroPlantelEducativo> {
  final GlobalKey<FormBuilderState> _regPlantelKey =
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
                            if (_regPlantelKey.currentState.saveAndValidate()) {
                              print(
                                _regPlantelKey.currentState.value,
                              );
                                     AwesomeDialog(
                                  btnOkColor: Color(hexColor('#5CC4B8')),
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.TOPSLIDE,
                                  tittle: 'Registro Exitoso',
                                  desc:
                                      'Se ha agregado un nuevo plantel al servicio',
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
                            /*    var user =
                                Provider.of<Auth>(context, listen: false)
                                    .getCurrentUser();

                            if (_regPlantelKey.currentState.saveAndValidate() ) {
                              print(
                                _regPlantelKey.currentState.value,
                              );
                          
                              Firestore.instance
                                  .collection('user')
                                  .document(user.toString())
                                  .collection('registroPlantel')
                                  .document()
                                  .setData({
                                "plantel":
                                    _regPlantelKey.currentState.value['plantel'],
                              
                              });
                       
                            }  */
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
                Icon(FontAwesomeIcons.school,
                    color: Color(hexColor('#3A4A64'))),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Datos de la Insitución',
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
            key: _regPlantelKey,
            initialValue: {
              'date': DateTime.now(),
              'accept_terms': false,
            },
            autovalidate: true,
            child: Column(
              children: <Widget>[
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Agregue el logotipo'),
                        InkWell(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: 80,
                              width: 80,
                              child: showImage(),
                            ),
                          ),
                          onTap: () =>
                              pickImageFromGallery(ImageSource.gallery),
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  textCapitalization: TextCapitalization.sentences,
                  attribute: "plantel",
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        FontAwesomeIcons.graduationCap,
                        color: Color(hexColor('#61B4E5')),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Nombre de la  unidad educativa",
                      labelStyle: TextStyle(
                          fontSize: 14, color: Color(hexColor('#3A4A64'))),
                      helperStyle: TextStyle(
                          fontSize: 12, color: Color(hexColor('#61B4E5'))),
                      hintText: 'Ingrese el nombre del plantel'),
                  style: TextStyle(
                      fontSize: 14, color: Color(hexColor('#61B4E5'))),
                  validators: [
                    FormBuilderValidators.required(
                      errorText: 'Requerido',
                    ),
                    FormBuilderValidators.minLength(3,
                        errorText: 'Mínimo 3 caracteres')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  textCapitalization: TextCapitalization.sentences,
                  attribute: "eslogan",
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.text_fields,
                        color: Color(hexColor('#61B4E5')),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Slogan",
                      labelStyle: TextStyle(
                          fontSize: 14, color: Color(hexColor('#3A4A64'))),
                      helperStyle: TextStyle(
                          fontSize: 12, color: Color(hexColor('#61B4E5'))),
                      hintText: 'Ingrese el eslogan'),
                  style: TextStyle(
                      fontSize: 14, color: Color(hexColor('#61B4E5'))),
                  /*       validators: [
                    FormBuilderValidators.minLength(3,
                        errorText: 'Mínimo 3 caracteres')
                  ], */
                ),
                SizedBox(
                  height: 10,
                ),
                FormBuilderDateTimePicker(
                  attribute: "fundación",
                  inputType: InputType.date,
                  style: TextStyle(
                      fontSize: 14, color: Color(hexColor('#61B4E5'))),
                  //format: DateTime(),
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      FontAwesomeIcons.birthdayCake,
                      color: Color(hexColor('#61B4E5')),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: "Fecha de fundación",
                    labelStyle: TextStyle(
                        fontSize: 14, color: Color(hexColor('#3A4A64'))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  attribute: "web",
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        FontAwesomeIcons.windowMaximize,
                        color: Color(hexColor('#61B4E5')),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Sitio web",
                      labelStyle: TextStyle(
                          fontSize: 14, color: Color(hexColor('#3A4A64'))),
                      helperStyle: TextStyle(
                          fontSize: 12, color: Color(hexColor('#61B4E5'))),
                      hintText: 'Ingrese la página web'),
                  style: TextStyle(
                      fontSize: 14, color: Color(hexColor('#61B4E5'))),
                  /*   validators: [
                    FormBuilderValidators.required(
                      errorText: 'Requerido',
                    ),
                    FormBuilderValidators.minLength(10,
                        errorText: 'Mínimo 10 caracteres'),
                    FormBuilderValidators.numeric(errorText: 'Solo números')
                  ], */
                ),
                SizedBox(
                  height: 10,
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
            'Registro de Unidad Educativa'.toUpperCase(),
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
            backgroundImage: AssetImage("assets/icon/UnidadEduca.png"),
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
