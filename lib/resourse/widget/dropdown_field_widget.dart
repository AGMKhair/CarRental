import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carrental/model/key_value_pair.dart';
import 'package:carrental/resourse/style/color_manager.dart';
import 'package:carrental/resourse/style/size_manager.dart';
import 'package:carrental/resourse/widget/space_widget.dart';
import 'package:carrental/resourse/widget/warning_text_widget.dart';

class DropdownFormField extends StatelessWidget {
  final bool? isVisible;
  final String label;
  final String selected;
  final List<KeyValuePair> list;
  final Function onChanged;
  final bool isValid;

  DropdownFormField({
    this.isVisible = true,
    required this.onChanged,
    required this.selected,
    required this.label,
    required this.list,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return isVisible!
        ? Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: !isValid && selected.isEmpty ? ColorManager.warring : Colors.grey),
                  borderRadius: BorderRadius.circular(SizeManager.radius),
                ),
                padding: const EdgeInsets.symmetric(horizontal: SizeManager.PADDING, vertical: 3),
                child: DropdownButton(
                  underline: SizedBox(),
                  hint: Text(label),
                  isExpanded: true,
                  icon: Icon(
                    Icons.arrow_drop_down_circle_sharp,
                  ),
                  items: list.map((KeyValuePair o) {
                    return DropdownMenuItem<String>(
                      value: o.value,
                      child: Text('${o.key}'),
                    );
                  }).toList(),
                  value: selected.isNotEmpty ? selected : null,
                  onChanged: (String? value) => onChanged(value),
                ),
              ),
              WarningText(
                isVisible: !isValid && selected.isEmpty,
                message: '$label is required',
              ),
              Space(),
            ],
          )
        : Container();
  }
}
