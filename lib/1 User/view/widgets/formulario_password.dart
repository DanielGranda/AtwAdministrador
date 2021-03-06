import 'package:administrador/utils/hexaColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormularioRestPassword extends StatelessWidget {
  const FormularioRestPassword({
    Key key,
    @required GlobalKey<FormBuilderState> passwordRecuperateKey,
    @required this.colorField,
  }) : _passwordRecuperateKey = passwordRecuperateKey, super(key: key);

  final GlobalKey<FormBuilderState> _passwordRecuperateKey;
  final Color colorField;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: _passwordRecuperateKey,
        initialValue: {
          'date': DateTime.now(),
          'accept_terms': false,
        },
        autovalidate: true,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              Text('Recuperar Contraseña'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 16, color: Colors.blueGrey)),
              SizedBox(height: 25),
              FormBuilderTextField(
                keyboardType: TextInputType.emailAddress,
                textCapitalization:
                    TextCapitalization.sentences,
                attribute: "correoRecuperar",
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.alternate_email,
                      color: colorField),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.grey, width: 0.0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Correo Electrónico",
                  labelStyle: TextStyle(
                      fontSize: 14,
                      color: Color(hexColor('#5CC4B8'))),
                  hintText: 'test@test.com',
                  hintStyle: TextStyle(
                      fontSize: 10, color: Colors.blueGrey),
                ),
                style:
                    TextStyle(fontSize: 14, color: colorField),
                validators: [
                  FormBuilderValidators.required(
                    errorText: 'Requerido',
                  ),
                  FormBuilderValidators.email(
                      errorText: 'Debe ser un mail válido')
                ],
              ),
            ])));
  }
}