import 'package:flutter/material.dart';
import 'package:formulario_validaciones/common/enums.dart';
import 'package:formulario_validaciones/widgets/components/text_field_base.dart';

class FormClientScreen extends StatelessWidget {
  TextEditingController ctrlRFC = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlNumberPhone = TextEditingController();
  TextEditingController ctrlZipCode = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Formulario Cliente")),
        body: Form(
          key: keyForm,
          child: ListView(children: [
            TextFieldBase("RFC", ctrlRFC, validateText: ValidateText.rfc),
            TextFieldBase("Email", ctrlEmail, validateText: ValidateText.email),
            TextFieldBase("Numero telefono", ctrlNumberPhone,
                validateText: ValidateText.phoneNumber),
            TextFieldBase(
              "Código Zip",
              ctrlZipCode,
              validateText: ValidateText.zipCode,
              notRequired: true,
            ),
            TextButton(onPressed: save, child: Text("Guardar"))
          ]),
        ));
  }

  save() {
    if (keyForm.currentState!.validate()) {}
  }
}
