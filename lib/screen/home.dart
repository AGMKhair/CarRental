import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tilmaame/architecture/base/basic_mixin.dart';
import 'package:tilmaame/data/api_end_point.dart';
import 'package:tilmaame/data/api_service.dart';
import 'package:tilmaame/model/cars/cars_response.dart';
import 'package:tilmaame/model/category/categories_response.dart';
import 'package:tilmaame/resourse/image/image_handler.dart';
import 'package:tilmaame/resourse/style/color_manager.dart';
import 'package:tilmaame/resourse/widget/wrapper.dart';
import 'package:tilmaame/screen/car_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>  with BasicMixin{
  // late List<Data> data;
  late CategoriesResponse categoriesResponse = CategoriesResponse(success: false, data: [], message: "");
  late CarsResponse carsDetails = CarsResponse(success: false, data: [], message: "");
  late List<CarsData> filterResponse = [];

  bool select = false;

  int selectedIndex = -1;

  void filterCategory(int index, String categoryName) {
    setState(() {
      selectedIndex = index;
    });
    filter(categoryName); // Call your filter function
  }

  @override
  void initState() {
    fetchData();
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

  void filter(String name) {
    if (name == "All")
      setState(() => filterResponse = carsDetails.data);
    else {
      filterResponse = [];
      carsDetails.data.forEach((element) {
        if (element.category.name == name) filterResponse.add(element);
      });
      setState(() => filterResponse);
    }
  }

  void fetchData() async {
    setState(() =>isLoading = true);
    String? categoryResponse = await APIService.fetchData(ApiEndPoint.GET_CATEGORIES);
    print(categoryResponse);

    categoriesResponse = CategoriesResponse.fromJson(json.decode(categoryResponse!));

    String? carsResponse = await APIService.fetchData(ApiEndPoint.GET_CARS);
    print(carsResponse);
    carsDetails = CarsResponse.fromJson(json.decode(carsResponse!));
    filterResponse = carsDetails.data;
    setState(() =>isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shadowColor: Colors.brown,
        title: Image.asset(
          ImageHandler.LOGO,
          width: MediaQuery.sizeOf(context).width / 2,
          color: Colors.white,
        ),

        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorManager.greenDeep, ColorManager.brown], // 👈 Use your custom colors
              stops: [0, 1],
              begin: AlignmentDirectional(1, 1),
              end: AlignmentDirectional(-1, -1),
            ),
          ),
        ),


      ),
      body: Wrapper(
        isLoading: isLoading,
        child: Column(
          children: [
            //Category
            Row(
              children: [
                InkWell(
                  onTap: () {
                    filter("All");
                    filterCategory(-1, "All");

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Material(
                      elevation: 5,
                      shape: CircleBorder(),
                      shadowColor: Colors.black54,
                      child: Container(
                        width: 70,
                        height: 60,
                        decoration: BoxDecoration(
                          shape:  BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [selectedIndex == -1 ?   CupertinoColors.systemOrange : Colors.yellow,  selectedIndex == -1 ?   CupertinoColors.systemYellow : Colors.brown], // Gradient colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: selectedIndex == -1 ?  CupertinoColors.systemOrange : Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Text(
                              "All",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Use Expanded to give ListView a bounded width
                Expanded(
                  child: SizedBox(
                    height: 60, // Ensure height is defined
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoriesResponse.data.length,
                      itemBuilder: (context, index) {
                        bool isSelected = selectedIndex == index;

                        return InkWell(
                          onTap: () {
                            filterCategory(index, categoriesResponse.data[index].name);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Material(
                              elevation: 5,
                              shape: CircleBorder(),
                              shadowColor: Colors.white,
                              child: Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [isSelected ?   CupertinoColors.systemOrange : Colors.yellow,  isSelected ?   CupertinoColors.systemYellow : Colors.brown], // Gradient colors
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: isSelected ?  CupertinoColors.systemOrange : Colors.black12,
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl: ApiEndPoint.BASE_URL + categoriesResponse.data[index].icon,
                                        width: 40,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => CircularProgressIndicator(),
                                        errorWidget: (context, url, error) => Icon(Icons.error, size: 40),
                                      ),
                                    ),
                                    Text(
                                      categoriesResponse.data[index].name,
                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500,color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.sizeOf(context).height/1.7,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: filterResponse.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two columns
                      crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1.2,
                    ),
                    itemBuilder: (context, index) {
                      final car = filterResponse[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          clipBehavior: Clip.none,
                          children: [
                            // Car Image Card
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: ApiEndPoint.BASE_URL + car.image,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Image.asset(ImageHandler.IMAGE_PLACE_HOLDER_CAE),
                              ),
                            ),

                            // "Details" Button (Partially Overlapping)
                            Positioned(
                              bottom: -20,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.brown, Colors.blueGrey], // Gradient colors
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(20), // Rounded corners
                                ),
                                child: ElevatedButton(

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CarDetailsPage(car: car),
                                      ),
                                    );
                                  },
                                  child: Text("Details",style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
