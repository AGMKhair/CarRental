import 'package:flutter/material.dart';
import 'package:carrental/resourse/widget/card_image_widget.dart';

/**
 *  PROJECT_NAME:-  carrental
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 8/3/24
 */
class Grid extends StatelessWidget {
  const Grid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: CardImage(
          onClick: () {},
        ),
      ),
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 0, crossAxisSpacing: 0),
        delegate: SliverChildListDelegate(
          List.generate(
            10,
            (index) => CardImage(
              onClick: () {},
            ),
          ),
        ),
      )
    ]));
  }
}
