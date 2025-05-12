import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 *  PROJECT_NAME:-  TILMAAME
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 30/1/24
 */
 class DialogUtil{

  static showToast(String title, Color? colorBackground) {
   Fluttertoast.showToast(
       msg: title,
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.CENTER,
       timeInSecForIosWeb: 1,
       backgroundColor: colorBackground ?? Colors.black,
       textColor: Colors.white,
       fontSize: 16.0);
  }

  static snackBar(BuildContext context, String msg) {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       content: Text(
        msg,
        textAlign: TextAlign.center,
       )));
  }

 }