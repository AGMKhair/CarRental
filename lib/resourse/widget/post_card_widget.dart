import 'package:flutter/material.dart';
import 'package:carrental/architecture/base/basic_mixin.dart';
import 'package:carrental/model/blog_info.dart';
import 'package:carrental/resourse/widget/category_pill_widget.dart';
import 'package:carrental/resourse/widget/online_image_widget.dart';

/**
 *  PROJECT_NAME:-  carrental
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 6/3/24
 */

class PostCard extends StatelessWidget with BasicMixin{
  BlogInfo post;
  bool isFeaturedList;

  PostCard(this.post, {this.isFeaturedList = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = isFeaturedList ? size.width * 0.8 : size.width;
    return InkWell(
      onTap: () {
        // if (isFeaturedList) Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetails(post)));
      },
      child: Padding(
        padding: EdgeInsets.all(isFeaturedList ? 10.0 : 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isFeaturedList ? 14.0 : 0.0),
          child: Material(
            elevation: 14.0,
            borderRadius: BorderRadius.circular(10.0),
            shadowColor: Theme.of(context).primaryColor.withOpacity(.5),
            child: SizedBox(
              height: 200.0,
              width: width,
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: post.imageUrl!,
                    child: OnlineImage(
                      post.imageUrl!,
                      width: width,
                      height: size.height,
                    ),
                  ),
                  Positioned.directional(
                    textDirection: textDirection,
                    end: 0,
                    child: CategoryPill(post: post),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black, Colors.transparent])),
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 5.0, left: 5.0, right: 5.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                post.title!,
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Hero(tag: '${post.id}_author', child: Container()),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}