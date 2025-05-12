import 'package:flutter/material.dart';
import 'package:tilmaame/resourse/widget/space_widget.dart';

class DoubleItemSingleLine extends StatelessWidget {
  final bool firstVisible;
  final bool lastVisible;
  final String firstItem;
  final String lastItem;
  final TextStyle? firstTextStyle;
  final TextStyle? lastTextStyle;

  DoubleItemSingleLine({
    required this.firstVisible,
    required this.lastVisible,
    required this.firstItem,
    required this.lastItem,
    this.firstTextStyle,
    this.lastTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return firstVisible || lastVisible
        ? Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  firstVisible ? Text(firstItem, style: firstTextStyle ?? TextStyle(fontWeight: FontWeight.w600)) : Container(),
                  if (lastVisible) Text(lastItem, style: lastTextStyle ?? TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
              Space(),
            ],
          )
        : Container();
  }
}
