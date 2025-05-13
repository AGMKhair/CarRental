import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carrental/resourse/style/size_manager.dart';

/**
 *  PROJECT_NAME:-  carrental
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 1/2/24
 */
class ButtonOutlinedWidget extends StatelessWidget {
  String? title;
  IconData? icons;
  Function onClick;
  Color backgroundColor;
  double radius;

  ButtonOutlinedWidget({
    super.key,
    this.title = "Submit",
    this.icons,
    this.radius = 5,
    this.backgroundColor = Colors.transparent,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dynamicWidth(context, size: 1),
      child: (icons == null)
          ? OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius)), side: BorderSide(color: Colors.black))),
              ),
              onPressed: () {
                onClick();
              },
              child: Text("$title",style: TextStyle(color:  CupertinoColors.systemOrange)),
            )
          : OutlinedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius)), side: BorderSide(color: Colors.black))),
              ),
              onPressed: () {
                onClick();
              },
              icon: Icon(icons),
              label: Text("$title",style: TextStyle(color:  CupertinoColors.systemOrange),),
            ),
    );
  }
}
