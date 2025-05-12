import 'package:flutter/material.dart';

/**
 *  PROJECT_NAME:-  Project
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 30/1/24
 */

class SizeManager {
  static const double PADDING = 10;

  static const double initial = 0;
  static const double size_10 = 10;
  static const double size_12 = 12;
  static const double size_14 = 14;
  static const double size_16 = 16;
  static const double size_18 = 18;
  static const double size_20 = 20;
  static const double size_22 = 22;
  static const double size_24 = 24;
  static const double size_26 = 26;
  static const double size_30 = 30;
  static const double size_70 = 70;
  static const double size_100 = 100;
  static const double size_120 = 120;
  static const double size_130 = 130;
  static const double size_135 = 135;
  static const double size_140 = 140;
  static const double size_150 = 150;
  static const double size_200 = 200;

  static const double button_hight = 48;


  static const double text_size_12 = 12;
  static const double text_size_14 = 14;
  static const double text_size_16 = 16;
  static const double text_size_20 = 20;
  static const double text_size_22 = 22;
  static const double text_size_24 = 24;

  static const double text_label_size = 24;

  static const double margin_top_16 = 16;
  static const double margin_left_16 = 16;
  static const double margin_right_16 = 16;
  static const double margin_bottom_16 = 16;

  static const double margin_10 = 10;
  static const double margin_12 = 12;
  static const double margin_16 = 16;
  static const double margin_18 = 18;
  static const double margin_20 = 20;
  static const double margin_22 = 22;
  static const double margin_24 = 24;
  static const double margin_26 = 26;
  static const double margin_30 = 30;
  static const double margin_32 = 32;

  static const double ICON_SIZE_SM = 24;
  static const double CARD_RADIUS = 10;
  static const double BOX_RADIUS = 10;
  static const double radius = 10;
  static const double DIALOG_RADIUS = 10;
  static const double SPACE = 10;

  static const double BUTTON_SECONDARY_TEXT_SIZE = 12;

}
 double dynamicWidth(BuildContext context, {double size = 1}){
return MediaQuery.of(context).size.width * size;
}
 double dynamicHeight(BuildContext context, {double size = 1}){
return MediaQuery.of(context).size.height * size;
}
