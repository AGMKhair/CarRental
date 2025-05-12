import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tilmaame/data/local_storage.dart';
import 'package:tilmaame/resourse/style/color_manager.dart';
import 'package:tilmaame/resourse/util/string_dictionary.dart';
import 'package:tilmaame/screen/dashboard/dashboard_page.dart';
import 'package:tilmaame/screen/home.dart';
import 'package:tilmaame/screen/login/login_screen.dart';
import 'package:tilmaame/screen/profile/profile_screen.dart';
import 'package:tilmaame/screen/registration/registration_screen.dart';

/**
 *  PROJECT_NAME:-  TILMAAME
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 21/2/24
 */

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  int _currentIndex = 0;
  @override
  void initState() {
    () async {
      // String? categoryResponse = await APIService.fetchData(ApiEndPoint.GET_CATEGORIES);

      // print(categoryResponse);
      // CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(json.decode(categoryResponse!));


      // String? carsResponse = await APIService.fetchData(ApiEndPoint.GET_CARS);
      // print(carsResponse);
      // CarsResponse carsDetails =   CarsResponse.fromJson(json.decode(carsResponse!));
    };
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [Home(key: ValueKey(DateTime.now()),),  DashboardPage(key: ValueKey(DateTime.now())), ProfileScreen(key: ValueKey(DateTime.now()))];
  }


  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.systemOrange,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.dashboard_sharp),
        title: ("DashBoard"),
        activeColorPrimary: CupertinoColors.systemYellow,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: CupertinoColors.systemOrange,
        inactiveColorPrimary: CupertinoColors.white,
      ),
    ];
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        // confineInSafeArea: true,
  // backgroundColor: Color.,

        // handleAndroidBackButtonPress: true,
        // resizeToAvoidBottomInset: true,
        // stateManagement: true,
        // hideNavigationBarWhenKeyboardShows: true,
        onItemSelected: (index) {

          if ((index == 2 || index == 1 )&& LocalStorage.loginResponse.status != "success") {

            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(
                      title: StringDictionary.USER_PROFILE,
                    ),
                  )
              );
            });
            setState(() => _controller.index = 0);
          }
// setState(() => _controller.index = index);

        },
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
          gradient: LinearGradient(
            colors: [ColorManager.brown, ColorManager.greenDeep],
            stops: [0, 1],
            begin: AlignmentDirectional(1, 1),
            end: AlignmentDirectional(-1, -1),
          ),
        ),
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.bounceInOut,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style18,

        // bottomScreenMargin:20, // 👈 Adds left-right margin
margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
      ),

    );
  }
}
