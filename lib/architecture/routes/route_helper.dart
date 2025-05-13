import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carrental/model/cars/cars_response.dart';

/**
 *  PROJECT_NAME:-  carrental
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 18/2/24
 */
class RouteHelper {
  String? name;
  String? number;
  String? title;
  String? details;
  IconData? icon;
  CarsData? car;

  RouteHelper({
    this.name = "",
    this.number = "",
    this.title = "",
    this.details = "",
    this.icon = Icons.airplane_ticket_outlined,
    this.car
  });
}
