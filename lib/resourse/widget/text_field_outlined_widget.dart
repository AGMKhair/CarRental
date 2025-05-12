import 'package:flutter/material.dart';

/**
 *  PROJECT_NAME:-  TILMAAME
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 1/2/24
 */

class TextFieldOutlineWidget extends StatelessWidget {

  TextEditingController? controller;
  String label;
  bool readOnly;
  IconData?  suffixIcon;
  IconData?  prefixIcon;
  TextInputType? inputType;
  String error ;

  TextFieldOutlineWidget({
    super.key,
    this.controller,
    this.readOnly = false,
    this.label = 'Entry the value',
    this.suffixIcon,
    this.prefixIcon,
    this.inputType,
    this.error = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: inputType ?? TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
            // borderSide: BorderSide(color: Colors.red)
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(25.0),
        //   borderSide: BorderSide(
        //     color: Colors.blue,
        //   ),
        // ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        prefixIcon: Icon(prefixIcon ?? Icons.mode_edit_outline_outlined),
        suffixIcon: Icon(suffixIcon),
        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        errorText: error.isEmpty ? null : error,

      ),
    );
  }
}
