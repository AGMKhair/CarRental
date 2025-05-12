import 'package:flutter/material.dart';
import 'package:tilmaame/resourse/style/color_manager.dart';
import 'package:tilmaame/resourse/style/size_manager.dart';

class DoubleItemDoubleLine extends StatelessWidget {
  final String labelOne;
  final String labelTwo;
  final String valueOne;
  final String valueTwo;
  final double? elevation;
  final double padding;

  DoubleItemDoubleLine(
      {required this.labelOne,
      required this.labelTwo,
      required this.valueOne,
      required this.valueTwo,
      this.elevation,
      this.padding = SizeManager.PADDING * 1.5});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                labelOne.isNotEmpty ? Text(labelOne, style: TextStyle(fontSize: SizeManager.text_label_size)) : Container(),
                if (labelTwo.isNotEmpty)
                  Expanded(
                    child: Text(
                      labelTwo,
                      style: TextStyle(fontSize: SizeManager.text_label_size),
                      textAlign: TextAlign.end,
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                valueOne.isNotEmpty
                    ? Text(
                        valueOne,
                        style: const TextStyle(
                          fontSize: SizeManager.text_size_12,
                          color: ColorManager.primarySecondary,
                        ),
                      )
                    : Container(),
                if (valueTwo.isNotEmpty)
                  Expanded(
                    child: Text(
                      valueTwo,
                      style: const TextStyle(
                        fontSize: SizeManager.text_size_12,
                        color: ColorManager.primarySecondary,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
