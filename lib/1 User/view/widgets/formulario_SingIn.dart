import 'package:administrador/utils/hexaColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormularioSingIn extends StatelessWidget {
  const FormularioSingIn({
    Key key,
    @required GlobalKey<FormBuilderState> ingresoAdminKey,
    @required this.colorField,
  })  : _ingresoPadresKey = ingresoAdminKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _ingresoPadresKey;
  final Color colorField;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _ingresoPadresKey,
      initialValue: {
        'date': DateTime.now(),
        'accept_terms': false,
      },
      autovalidate: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            FormBuilderTextField(
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.sentences,
              attribute: "correo",
              decoration: InputDecoration(
                suffixIcon:
                    Icon(Icons.alternate_email, color: colorField),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: "Correo Electrónico",
                labelStyle:
                    TextStyle(fontSize: 14, color: Color(hexColor('#5CC4B8'))),
                hintText: 'test@test.com',
                hintStyle: TextStyle(fontSize: 10, color: Colors.blueGrey),
              ),
              style: TextStyle(fontSize: 14, color: colorField),
              validators: [
                FormBuilderValidators.required(
                  errorText: 'Requerido',
                ),
                FormBuilderValidators.email( errorText:'Debe ser un mail válido')
              ],
            ),
            SizedBox(
              height: 10,
            ),
            /* FormBuilderTextField(
              keyboardType: TextInputType.phone,
              attribute: "cedula",
              decoration: InputDecoration(
                suffixIcon: Icon(FontAwesome.address_card, color: colorField),
                 enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: "Documento de Identificación",
                labelStyle:
                    TextStyle(fontSize: 14, color: Color(hexColor('#5CC4B8'))),
                hintText: '1717084592',
                hintStyle: TextStyle(fontSize: 10, color: Colors.blueGrey),
              ),
              style: TextStyle(fontSize: 14, color: colorField),
              validators: [
                FormBuilderValidators.required(
                  errorText: 'Requerido',
                ),
                FormBuilderValidators.minLength(10,
                    errorText: "Mínimo 10 caracteres")
              ],
            ), */
            SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              keyboardType: TextInputType.emailAddress,
              attribute: "password",
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.lock, color: colorField),
                   enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Contraseña",
                  labelStyle: TextStyle(
                      fontSize: 14, color: Color(hexColor('#5CC4B8'))),
                  hintStyle: TextStyle(fontSize: 10, color: Colors.blueGrey),
                  hintText: 'Credenciales otorgadas por AtawaGo'),
              style: TextStyle(fontSize: 14, color: colorField),
              validators: [
                FormBuilderValidators.required(
                  errorText: 'Requerido',
                ),
                FormBuilderValidators.minLength(6,
                    errorText: 'Mínimo 6 caracteres')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
