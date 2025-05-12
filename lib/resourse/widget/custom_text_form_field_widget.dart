import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tilmaame/resourse/widget/space_widget.dart';

class CustomTextFormField extends StatelessWidget {
  final bool? isVisible;
  final String? label;
  final bool? isRequired;
  final bool readOnly;
  final int? maxLength;
  final int? minLength;
  final String? prefix;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FilteringTextInputFormatter? formatter;
  final TextCapitalization? textCapitalization;

  CustomTextFormField({
    this.isVisible = true,
    required this.label,
    this.maxLength,
    this.minLength,
    this.keyboardType,
    this.isRequired = false,
    this.controller,
    this.formatter,
    this.readOnly = false,
    this.textCapitalization,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return isVisible!
        ? Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            counterText: '',
            prefix: prefix != null ? Text(prefix!) : null,
          ),
          maxLength: maxLength ?? 80,
          keyboardType: keyboardType ?? TextInputType.text,
          inputFormatters: formatter != null ? [formatter!] : null,
          controller: controller,
          readOnly: readOnly,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          validator: (String? value) {
            if (isRequired! && (value!.isEmpty || value.trim().isEmpty)) {
              return '$label is required';
            }
            if (minLength != null && value!.trim().length < minLength!) {
              return 'Minimum length is $minLength';
            }
            return null;
          },
        ),
        Space(),
      ],
    )
        : Container();
  }
}