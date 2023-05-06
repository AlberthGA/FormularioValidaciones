import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formulario_validaciones/common/enums.dart';
import 'package:formulario_validaciones/common/validate.dart';

import '../../utils/UpperCaseTextFormatter.dart';

class TextFieldBase extends StatelessWidget {
  String text;
  TextEditingController controller;
  ValidateText? validateText;
  bool notRequired;
  TextFieldBase(this.text, this.controller,
      {super.key, this.validateText, this.notRequired = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text),
        TextFormField(
          controller: controller,
          maxLength: validateMaxLength(),
          inputFormatters: validateInputFormatters(),
          validator: (String? value) {
            return validateStructure(value);
          },
        )
      ],
    );
  }

  int? validateMaxLength() {
    switch (validateText) {
      case ValidateText.rfc:
        return 13;
      case ValidateText.phoneNumber:
        return 15;
      case ValidateText.email:
        return 64;
      case ValidateText.zipCode:
        return 5;
      default:
        return null;
    }
  }

  validateStructure(String? value) {
    if (!notRequired && value!.isEmpty) {
      return "El campo $text está vacio";
    }
    switch (validateText) {
      case ValidateText.rfc:
        return validateRFC(value!) ? null : message("RFC");
      case ValidateText.phoneNumber:
        return validateRFC(value!) ? null : message("número de teléfono");
      case ValidateText.email:
        return validateRFC(value!) ? null : message("email");
      // case ValidateText.zipCode: //en caso de que se requiera el campo más bien se descomenta esto
      //   return validateRFC(value!) ? null : message("código zip");
      default:
        return null;
    }
  }

  message(String type) => "La estructura del $type es incorrecta";

  List<TextInputFormatter>? validateInputFormatters() {
    switch (validateText) {
      case ValidateText.rfc:
        return [UpperCaseTextFormatterScreen()];
      case ValidateText.phoneNumber:
      case ValidateText.zipCode:
        return [FilteringTextInputFormatter.digitsOnly];
      default:
        return [FilteringTextInputFormatter.singleLineFormatter];
    }
  }
}
