import 'package:flutter/material.dart';

/**
 *  PROJECT_NAME:-  TILMAAME
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 1/2/24
 */

class ToggleButtonWidget extends StatefulWidget {
  List<bool> isSelected;
  List<String> title;
  ToggleButtonWidget({super.key, required this.isSelected, required this.title});

  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  // final isSelected = <bool>[false, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      color: Colors.black.withOpacity(0.60),
      selectedColor: Color(0xFF6200EE),
      selectedBorderColor: Color(0xFF6200EE),
      fillColor: Color(0xFF6200EE).withOpacity(0.08),
      splashColor: Color(0xFF6200EE).withOpacity(0.12),
      hoverColor: Color(0xFF6200EE).withOpacity(0.04),
      borderRadius: BorderRadius.circular(4.0),
      constraints: BoxConstraints(minHeight: 36.0),
      isSelected: widget.isSelected,
      onPressed: (index) {
        // Respond to button selection
        setState(() {
          widget.isSelected[index] = !widget.isSelected[index];
        });
      },
      children: [
        for (int i = 0; i < widget.title.length; i++)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('${widget.title[i]}'),
          ),
      ],
    );
  }
}
