import 'package:flutter/material.dart';
import 'package:formulario_validaciones/common/enums.dart';
import 'package:formulario_validaciones/widgets/components/text_field_base.dart';

class FormClientScreen extends StatelessWidget {

  TextEditingController ctrlRFC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario Cliente")
      ),
      body: Form(
        child: ListView(
          children:[
            TextFieldBase("RFC",ctrlRFC,validateText:ValidateText.rfc)

          ] ),) 
    );
  }
}