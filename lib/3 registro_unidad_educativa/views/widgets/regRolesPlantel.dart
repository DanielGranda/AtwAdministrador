import 'dart:io';

import 'package:administrador/utils/hexaColor.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vibration/vibration.dart';

class ResgistroRolesPlantel extends StatefulWidget {
  ResgistroRolesPlantel({Key key}) : super(key: key);

  @override
  _ResgistroRolesPlantelState createState() => _ResgistroRolesPlantelState();
}

class _ResgistroRolesPlantelState extends State<ResgistroRolesPlantel> {
  final GlobalKey<FormBuilderState> _rolesPlantelKey =
      GlobalKey<FormBuilderState>();
  // final GlobalKey<FormBuilderState> _fase2Key = GlobalKey<FormBuilderState>();

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

//Archivo desde foto
  static File cameraFile;
  static Future<File> photoFile;

  pickImageFromCamera(ImageSource source) {
    setState(() {
      photoFile = ImagePicker.pickImage(source: ImageSource.camera);
    });
  }

  Widget showPhoto() {
    return FutureBuilder<File>(
      future: photoFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          cameraFile = snapshot.data;
          return Image.file(
            snapshot.data,
            width: 30,
            height: 30,
          );
        } else if (snapshot.error != null) {
          return const Text('Error');
        } else
          return Icon(FontAwesomeIcons.camera,
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
                            if (_rolesPlantelKey.currentState
                                .saveAndValidate()) {
                              print(
                                _rolesPlantelKey.currentState.value,
                              );
                              print(
                                _rolesPlantelKey.currentState.value,
                              );
                              AwesomeDialog(
                                  btnOkColor: Color(hexColor('#5CC4B8')),
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.TOPSLIDE,
                                  tittle: 'Registro Exitoso',
                                  desc:
                                      'Se ha agregado un nuevo rol/es a la unidad educativa',
                                  //btnCancelOnPress: () {},
                                  btnOkOnPress: () async {
                                    Navigator.popAndPushNamed(context, 'regUe');
                                    if (await Vibration.hasVibrator()) {
                                      Vibration.vibrate();
                                    }
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
                Icon(FontAwesomeIcons.userCog,
                    color: Color(hexColor('#3A4A64'))),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Roles para el Servicio',
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
            key: _rolesPlantelKey,
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
                  child: FormBuilderCheckboxList(
                    decoration: InputDecoration(
                      labelText: "Selecciones el rol/es por usuario",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(hexColor('#3A4A64'))),
                    ),
                    attribute: "roles",
                    initialValue: ["Representante Legal"],
                    options: [
                      FormBuilderFieldOption(value: "Representante Legal"),
                      FormBuilderFieldOption(value: "Rector"),
                      FormBuilderFieldOption(value: "Coordinador"),
                    ],
                    validators: [
                      FormBuilderValidators.required(
                        errorText: 'Requerido',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  textCapitalization: TextCapitalization.sentences,
                  attribute: "Nombres",
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.perm_identity,
                        color: Color(hexColor('#61B4E5')),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Nombres",
                      labelStyle: TextStyle(
                          fontSize: 14, color: Color(hexColor('#3A4A64'))),
                      helperStyle: TextStyle(
                          fontSize: 12, color: Color(hexColor('#61B4E5'))),
                      hintText: 'Ingrese sus nombres'),
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
                  attribute: "Apellidos",
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.perm_identity,
                        color: Color(hexColor('#61B4E5')),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Apellidos",
                      labelStyle: TextStyle(
                          fontSize: 14, color: Color(hexColor('#3A4A64'))),
                      helperStyle: TextStyle(
                          fontSize: 12, color: Color(hexColor('#61B4E5'))),
                      hintText: 'Ingrese sus apellidos'),
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
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Foto de perfil'),
                        InkWell(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: 80,
                              width: 80,
                              child: showPhoto(),
                            ),
                          ),
                          onTap: () => pickImageFromCamera(ImageSource.camera),
                        ),
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
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  keyboardType: TextInputType.number,
                  attribute: "Cédula",
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        FontAwesomeIcons.idCard,
                        color: Color(hexColor('#61B4E5')),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Cédula",
                      labelStyle: TextStyle(
                          fontSize: 14, color: Color(hexColor('#3A4A64'))),
                      helperStyle: TextStyle(
                          fontSize: 12, color: Color(hexColor('#61B4E5'))),
                      hintText: 'Ingrese su cédula o documento de identidad'),
                  style: TextStyle(
                      fontSize: 14, color: Color(hexColor('#61B4E5'))),
                  validators: [
                    FormBuilderValidators.required(errorText: 'Requerido'),
                    FormBuilderValidators.minLength(5,
                        errorText: 'Mínimo 5 caracters')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  keyboardType: TextInputType.phone,
                  attribute: "Celular",
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.phone,
                        color: Color(hexColor('#61B4E5')),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Celular",
                      labelStyle: TextStyle(
                          fontSize: 14, color: Color(hexColor('#3A4A64'))),
                      helperStyle: TextStyle(
                          fontSize: 12, color: Color(hexColor('#61B4E5'))),
                      hintText: 'Ingrese su celular'),
                  style: TextStyle(
                      fontSize: 14, color: Color(hexColor('#61B4E5'))),
                  validators: [
                    FormBuilderValidators.required(
                      errorText: 'Requerido',
                    ),
                    FormBuilderValidators.minLength(10,
                        errorText: 'Mínimo 10 caracteres'),
                    FormBuilderValidators.numeric(errorText: 'Solo números')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  keyboardType: TextInputType.emailAddress,
                  attribute: "Email",
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.alternate_email,
                        color: Color(hexColor('#61B4E5')),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Email",
                      labelStyle: TextStyle(
                          fontSize: 14, color: Color(hexColor('#3A4A64'))),
                      helperStyle: TextStyle(
                          fontSize: 12, color: Color(hexColor('#61B4E5'))),
                      hintText: 'Ingrese su email'),
                  style: TextStyle(
                      fontSize: 14, color: Color(hexColor('#61B4E5'))),
                  validators: [
                    FormBuilderValidators.required(
                      errorText: 'Requerido',
                    ),
                    FormBuilderValidators.email(
                        errorText: 'Debe ser un correo válido')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                FormBuilderDateTimePicker(
                  attribute: "edad",
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
                    labelText: "Fecha de Nacimiento",
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
            'Registro de Roles Unidad Educativa'.toUpperCase(),
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
            backgroundImage: AssetImage("assets/icon/icoEps.png"),
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
