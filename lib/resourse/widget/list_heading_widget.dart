import 'package:flutter/material.dart';

/**
 *  PROJECT_NAME:-  TILMAAME
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 6/3/24
 */
class ListHeading extends StatelessWidget {
  final String title;
  final int categoryId;

  ListHeading(this.title, this.categoryId);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          InkWell(
            onTap: () {
              // BlogCategoryInfo category = BlogCategoryInfo(name: title, id: categoryId);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SingleCategory(category)));
            },
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Theme.of(context).colorScheme.secondary),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Text('Show All'),
            ),
          )
        ],
      ),
    );
  }
}