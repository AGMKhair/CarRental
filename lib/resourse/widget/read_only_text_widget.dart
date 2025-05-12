import 'package:flutter/material.dart';
import 'package:tilmaame/resourse/style/size_manager.dart';
import 'package:tilmaame/resourse/widget/space_widget.dart';

class ReadOnlyText extends StatelessWidget {
  final String label;
  final String? value;
  final bool? isVisible;

  ReadOnlyText({required this.label, required this.value, this.isVisible = true});

  @override
  Widget build(BuildContext context) {
    return isVisible!
        ? Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: label,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(SizeManager.BOX_RADIUS)),
                ),
                enabled: false,
                initialValue: value,
              ),
              Space(),
            ],
          )
        : Container();
  }
}
