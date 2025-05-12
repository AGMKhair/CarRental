import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tilmaame/architecture/base/basic_mixin.dart';
import 'package:tilmaame/data/api_end_point.dart';
import 'package:tilmaame/data/local_storage.dart';
import 'package:tilmaame/model/cars/cars_response.dart';
import 'package:tilmaame/resourse/style/color_manager.dart';
import 'package:tilmaame/resourse/util/string_dictionary.dart';
import 'package:tilmaame/screen/booking_page.dart';
import 'package:tilmaame/screen/login/login_screen.dart';

class CarDetailsPage extends StatelessWidget with BasicMixin {
  // final CarsResponse car;
  CarsData car;

  CarDetailsPage({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          car.title,
          style: TextStyle(fontWeight: FontWeight.bold,color: CupertinoColors.white),
        ),
         flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorManager.greenDeep, ColorManager.brown], 
              stops: [0, 1],
              begin: AlignmentDirectional(1, 1),
              end: AlignmentDirectional(-1, -1),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Car Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: ApiEndPoint.BASE_URL + car.image,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error, size: 100),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Car Name
              Text(
                "Car: ${car.title}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              // Car Features
              Text(
                "Car Features: \n⭐ ${car.features.replaceAll(",", "\n⭐ ")}",
                style: TextStyle(fontSize: 18),
              ),

              SizedBox(height: 10),

              // Rent Price
              Text(
                "Rent Price: ${car.price} USD",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),

              SizedBox(height: 20),

              // Book Now Button
              Center(
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
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (LocalStorage.loginResponse.status  == "success") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingPage(car: car),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(
                              title: StringDictionary.CARE_DETAILS, car: car
                            ),
                          ),
                        );
                      }

                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(content: Text("Booking feature coming soon!")),
                      // );
                    },
                    child: Text("Book Now"),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Details Section
              Text(
                "Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10), HtmlWidget(car.description)
              // Html(
              //   data: "${car.description}",
              //   style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
