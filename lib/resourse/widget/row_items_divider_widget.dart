import 'package:flutter/material.dart';
import 'package:tilmaame/resourse/style/color_manager.dart';
import 'package:tilmaame/resourse/style/size_manager.dart';

class RowItemDivider extends StatelessWidget {
  final String title;
  final String value;
  final bool isSelectable;

  const RowItemDivider({Key? key, required this.title, required this.value, this.isSelectable = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.titleLarge!.merge(TextStyle(fontSize: SizeManager.text_label_size, color: ColorManager.text));

    return Padding(
      padding: EdgeInsets.only(left: SizeManager.PADDING, right: SizeManager.PADDING, bottom: SizeManager.PADDING / 2),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Text(title, style: textStyle),
              Expanded(
                flex: 1,
                child: isSelectable ? SelectableText(value, textAlign: TextAlign.end, style: textStyle) : Text(value, textAlign: TextAlign.end, style: textStyle),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
