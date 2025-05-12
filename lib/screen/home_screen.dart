/*
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tilmaame/resourse/util/string_dictionary.dart';
import 'package:tilmaame/resourse/widget/primary_button_widget.dart';
import 'package:tilmaame/screen/test_screen.dart';

*/
/**
 *  PROJECT_NAME:-  Project
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 30/1/24
 *//*

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringDictionary.APP_NAME),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Home Screen',
              textAlign: TextAlign.center,
            ),
            CachedNetworkImage(
              width: 120,
              imageUrl:
                  "https://avatars.githubusercontent.com/u/71348295?s=200&v=4",
              placeholder: (context, url) => Icon(Icons.ac_unit),
              errorWidget: (context, url, error) => Image.asset(
                "assets/images/placeholder.png",
              ),
            ),
            PrimaryButton(
              label: 'Next Screen',
              isDisabled: false,
              onPressed: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context, screen: TestScreen(),
                  withNavBar: true,
                  // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/
