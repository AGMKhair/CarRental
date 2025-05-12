import 'package:flutter/material.dart';
import 'package:tilmaame/model/blog_info.dart';
import 'package:tilmaame/resourse/widget/post_list_item.dart';

/**
 *  PROJECT_NAME:-  TILMAAME
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 6/3/24
 */

class PostsList extends StatefulWidget {
  int category = 0;

  PostsList({this.category = 0});

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  List<BlogInfo> posts = [];

  int page = 0;
  ScrollController _scrollController = new ScrollController();
  bool isLoading = false;

  void getData() {
    if (!isLoading) {
      setState(() {
        page++;
        isLoading = true;
      });

      // WpApi.getPostsList(category: widget.category, page: page).then((_posts) {
        setState(() {
          isLoading = false;
          // posts.add(BlogInfo("1", "title 1", "date", "category", "imageUrl", "details", "star", "name", []));
          // posts.add(BlogInfo("2", "title 2", "date", "category", "imageUrl", "details", "star", "name", []));
          // posts.add(BlogInfo("3", "title 3", "date", "category", "imageUrl", "details", "star", "name", []));
          // posts.add(BlogInfo("4", "title 4", "date", "category", "imageUrl", "details", "star", "name", []));

        });
      // });
    }
  }

  @override
  void initState() {
    super.initState();
    // getData();
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        getData();
      // }
    // });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PostListItem(new BlogInfo()),
      // child: ListView.builder(
      //   itemBuilder: postTile,
      //   itemCount: posts.length + 1,
        // scrollDirection: Axis.vertical,
        // shrinkWrap: true,
        // physics: ClampingScrollPhysics(),
        // controller: _scrollController,
      // ),
    );
  }

  // Widget postTile(BuildContext context, int index) {
  //   if (index == posts.length) {
  //     return _buildProgressIndicator();
  //   } else {
      // return PostListItem(posts[index]);
    // }
  // }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      // child: Center(
      //   child: Visibility(
      //     // visible: isLoading,
      //     child: CircularProgressIndicator(),
      //   ),
      // ),
    );
  }
}