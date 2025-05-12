import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:flutter/material.dart';

/**
 *  PROJECT_NAME:-  TILMAAME
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 10/2/24
 */

class RadioButtonWidget extends StatefulWidget {
  Map<String, String> itemMap;

  RadioButtonWidget({super.key, required this.itemMap});

  @override
  _RadioButtonWidgetState createState() => new _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  // static final Map<String, String> genderMap = {
  //   'male': 'Male',
  //   'female': 'Female',
  //   'other': 'Other',
  //
  // };
  String _selectedGender = "";

  @override
  void initState() {
    _selectedGender = widget.itemMap.keys.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final genderSelectionTile = Material(
      color: Colors.white,
      child: Expanded(
        child: CupertinoRadioChoice(
          choices: widget.itemMap,
          onChange: onGenderSelected,
          initialKeyValue: _selectedGender,
        ),
      ),
    );

    return Scaffold(
      body: Center(child: genderSelectionTile),
    );
  }

  void onGenderSelected(String genderKey) {
    setState(() {
      _selectedGender = genderKey;
    });
  }
}
