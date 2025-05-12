import 'package:flutter/material.dart';
import 'package:tilmaame/resourse/style/size_manager.dart';
import 'package:tilmaame/resourse/widget/space_widget.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final bool isDisabled;
  final VoidCallback onPressed;

  PrimaryButton({required this.label, required this.isDisabled, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: SizeManager.button_hight,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeManager.BOX_RADIUS))),
            ),
            child: Text(
              label,
              style: TextStyle(fontSize: SizeManager.text_size_20, ),
            ),
            onPressed: isDisabled ? null : onPressed,
          ),
        ),
        Space(),
      ],
    );
  }
}
