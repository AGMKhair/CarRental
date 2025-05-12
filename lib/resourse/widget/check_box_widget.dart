import 'package:flutter/material.dart';

/**
 *  PROJECT_NAME:-  TILMAAME
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 9/2/24
 */
class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool checkedValue = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          CheckboxListTile(
            title: Text("Title text"),
            value: checkedValue,
            onChanged: (newValue) {
              setState(() {
                checkedValue = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
          )
          /*
            Checkbox(value: checkBoxValue,
               activeColor: Colors.green,
               onChanged:(bool newValue){
                 setState(() {
                   checkBoxValue = newValue;
                 });
                 Text('Remember me');
               }),*/
        ],
      ),
    );
  }
}

class GetCheckValue extends StatefulWidget {
  const GetCheckValue({super.key});

  @override
  GetCheckValueState createState() {
    return GetCheckValueState();
  }
}

class CheckList {
  String title;
  bool isCheck;
  CheckList(this.title, this.isCheck);
}

class GetCheckValueState extends State<GetCheckValue> {
  bool _isChecked = true;
  String _currText = '';

  // List<String> text = ["InduceSmile.com", "Flutter.io", "google.com"];
  List<CheckList> checklist = [];
  @override
  void initState() {
    checklist.add(CheckList("InduceSmile.com", false));
    checklist.add(CheckList("Flutter.io", false));
    checklist.add(CheckList("google.com", false));
    checklist.add(CheckList("google.com", false));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get check Value Example"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(_currText,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          SizedBox(
            height: 350.0,
            child: Column(
              children: checklist
                  .map((t) => CheckboxListTile(
                        title: Text(t.title),
                        value: t.isCheck,
                        onChanged: (val) {
                          setState(() {
                            // _isChecked = val!;
                            t.isCheck = val!;
                          });
                        },
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
