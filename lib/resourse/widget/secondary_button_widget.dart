import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  String label;
  VoidCallback onPressed;
  double size;
  SecondaryButton(
      {super.key,
      this.label = "Submit",
      required this.onPressed,
      this.size = 14});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        label,
        style: TextStyle(fontSize: size, color: CupertinoColors.systemOrange),
      ),
    );
  }
}
