import 'package:flutter/material.dart';
import 'package:carrental/model/blog_info.dart';
import 'package:carrental/resourse/widget/post_card_widget.dart';
/**
 *  PROJECT_NAME:-  carrental
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 6/3/24
 */

class FeaturedCategoryList extends StatefulWidget {
  @override
  _FeaturedCategoryListState createState() => _FeaturedCategoryListState();
}

class _FeaturedCategoryListState extends State<FeaturedCategoryList> with AutomaticKeepAliveClientMixin {
  List<BlogInfo> posts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // WpApi.getPostsList(category: FEATURED_CATEGORY_ID).then((_posts) {
    setState(() {
      isLoading = false;
      posts.add(BlogInfo(id: "1", title: "title 1", date:"date",category: "category", imageUrl :"imageUrl",details: "details", star:"star", name:"name", comment:[]));
      posts.add(BlogInfo(id: "2", title: "title 2", date:"date",category: "category", imageUrl :"imageUrl",details: "details", star:"star", name:"name", comment:[]));
      posts.add(BlogInfo(id: "3", title: "title 3", date:"date",category: "category", imageUrl :"imageUrl",details: "details", star:"star", name:"name", comment:[]));
      posts.add(BlogInfo(id: "4", title: "title 4", date:"date",category: "category", imageUrl :"imageUrl",details: "details", star:"star", name:"name", comment:[]));
      posts.add(BlogInfo(id: "5", title: "title 5", date:"date",category: "category", imageUrl :"imageUrl",details: "details", star:"star", name:"name", comment:[]));
      posts.add(BlogInfo(id: "6", title: "title 6", date:"date",category: "category", imageUrl :"imageUrl",details: "details", star:"star", name:"name", comment:[]));

    });
    // });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: posts.length ?? 0, scrollDirection: Axis.horizontal, shrinkWrap: true, //            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return PostCard(posts[index], isFeaturedList: true);
            },
          );
  }

  @override
  bool get wantKeepAlive => true;
}