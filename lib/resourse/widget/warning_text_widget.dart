import 'package:flutter/material.dart';
import 'package:tilmaame/resourse/style/color_manager.dart';
import 'package:tilmaame/resourse/style/size_manager.dart';

class WarningText extends StatelessWidget {
  final bool isVisible;
  final String message;

  WarningText({required this.isVisible, required this.message});

  @override
  Widget build(BuildContext context) {
    return isVisible && message.isNotEmpty
        ? Padding(
            padding: EdgeInsets.only(top: 7, left: 12),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                message,
                style: TextStyle(color: ColorManager.warring, fontSize: SizeManager.text_size_16),
              ),
            ),
          )
        : Container();
  }
}
