import 'package:flutter/material.dart';
import 'package:tilmaame/resourse/widget/card_image_widget.dart';

/**
 *  PROJECT_NAME:-  TILMAAME
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 8/3/24
 */
class List extends StatelessWidget {
  const List({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliverToBoxAdapter(
          child: Container(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      child: CardImage(
                        onClick: () {},
                      ),
                    );
                  }))),
    );
  }
}
