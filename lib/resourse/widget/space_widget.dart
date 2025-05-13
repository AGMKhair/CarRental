import 'package:flutter/material.dart';
import 'package:carrental/resourse/style/size_manager.dart';

class Space extends StatelessWidget {
  final double? times;

   const Space({super.key, this.times});

  @override
  Widget build(BuildContext context) {
    double space = times != null ? times! * SizeManager.SPACE : SizeManager.SPACE;

    return SizedBox(height: space);
  }
}
