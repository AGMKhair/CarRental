import 'package:flutter/material.dart';

/**
 *  PROJECT_NAME:-  TILMAAME
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 4/2/24
 */
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      alignment: Alignment.center,
      color: Colors.white,
      child: const CircularProgressIndicator(color: Colors.brown),
    );
  }
}
