import 'package:flutter/material.dart';
import 'package:carrental/resourse/style/size_manager.dart';

class RowItem extends StatelessWidget {
  final String title;
  final String value;
  final bool isSelectable;

  const RowItem({Key? key, required this.title, required this.value, this.isSelectable = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.titleLarge!.merge(TextStyle(fontSize: SizeManager.text_label_size));

    return Padding(
      padding: EdgeInsets.all(SizeManager.PADDING),
      child: Row(
        children: <Widget>[
          Text(title, style: textStyle),
          Expanded(
            flex: 1,
            child: isSelectable
                ? SelectableText(value, textAlign: TextAlign.end, style: textStyle)
                : Text(value, textAlign: TextAlign.end, style: textStyle),
          ),
        ],
      ),
    );
  }
}
