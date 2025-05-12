import 'package:flutter/material.dart';
import 'package:tilmaame/resourse/style/size_manager.dart';

class ReadOnlyTextSingleLine extends StatelessWidget {
  final String label;
  final String? value;
  final bool? isVisible;

  ReadOnlyTextSingleLine({required this.label, required this.value, this.isVisible = true});

  @override
  Widget build(BuildContext context) {
    return isVisible!
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: SizeManager.PADDING, vertical: SizeManager.PADDING / 1.5),
            child: Row(
              children: [
                Expanded(child: Text(label, style: TextStyle(fontSize: SizeManager.text_label_size), textAlign: TextAlign.left)),
                Expanded(child: Text(value!, style: TextStyle(fontSize: SizeManager.text_label_size), textAlign: TextAlign.right)),
              ],
            ),
          )
        : Container();
  }
}
