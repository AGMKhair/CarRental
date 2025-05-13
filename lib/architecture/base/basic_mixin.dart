import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carrental/model/login/authorisation_model.dart';
import 'package:carrental/model/login/login_response.dart';
import 'package:carrental/model/login/user_model.dart';
import 'package:carrental/resourse/util/business_dictionary.dart';

/**
 *  PROJECT_NAME:-  carrental
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 30/1/24
 */
 mixin BasicMixin{
  TextDirection textDirection = BusinessDictionary.isRTL ?  TextDirection.rtl :  TextDirection.ltr;
  bool isLoading = false;

  Map<String, dynamic> convertJson(String data)
  {
   return json.decode(data);
  }


}