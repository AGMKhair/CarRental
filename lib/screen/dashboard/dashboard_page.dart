import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tilmaame/architecture/base/basic_mixin.dart';
import 'package:tilmaame/data/api_end_point.dart';
import 'package:tilmaame/data/api_service.dart';
import 'package:tilmaame/data/local_storage.dart';
import 'package:tilmaame/model/booking/booking_cars_response.dart';
import 'package:tilmaame/resourse/style/color_manager.dart';
import 'package:tilmaame/resourse/util/string_dictionary.dart';
import 'package:tilmaame/resourse/widget/wrapper.dart';
import 'package:tilmaame/screen/login/login_screen.dart';

import '../payment_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with BasicMixin {
  // Dummy booking data
  BookingCarsResponse bookings = BookingCarsResponse();
  bool isLoading = false;

  @override
  void initState() {
    if (LocalStorage.loginResponse.status != "success") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(
              title: StringDictionary.DHASHBOARD,
            ),
          ),
        );
      });
    } else {
      fetchData();
    }

    super.initState();
  }

  void fetchData() async {
    setState(() => isLoading = true);

    String? response = await APIService.fetchData(ApiEndPoint.GET_BOOKING, bearerToken: LocalStorage.loginResponse.authorisation!.token);
    if (response != null) {
      setState(() {
        bookings = BookingCarsResponse.fromJson(convertJson(response));
      });
    }
    setState(() => isLoading = false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (LocalStorage.loginResponse.status == "success")  fetchData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold, color: CupertinoColors.white),
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
      body: Wrapper(
        isLoading: isLoading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Welcome to Dashboard",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey[200]!),
                  columnSpacing: 16,
                  columns: [
                    DataColumn(label: _tableHeader("SL")),
                    DataColumn(label: _tableHeader("Invoice")),
                    DataColumn(label: _tableHeader("Car")),
                    DataColumn(label: _tableHeader("Dates")),
                    DataColumn(label: _tableHeader("Amount")),
                    DataColumn(label: _tableHeader("Status")),
                    DataColumn(label: _tableHeader("Action")),
                  ],
                  rows: bookings.data != null
                      ? bookings.data!.map((booking) {
                          int index = bookings.data!.indexOf(booking);
                          return DataRow(
                            cells: [
                              DataCell(_tableCell("${index + 1}")),
                              DataCell(_tableCell(bookings.data![index].id.toString())),
                              DataCell(_tableCell(bookings.data![index].car!.title!)),
                              DataCell(_tableCell("${bookings.data![index].startDate} - ${bookings.data![index].endDate}")),
                              DataCell(_tableCell("\$${bookings.data![index].amount}")),
                              DataCell(_tableCell(bookings.data![index].status!)),
                              DataCell(
                                bookings.data![index].status == "Pending"
                                    ? Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.brown, Colors.blueGrey],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            foregroundColor: Colors.white,
                                            shadowColor: Colors.transparent
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => PaymentPage(),
                                              ),
                                            );
                                          },
                                          child: Text("Pay Now"),
                                        ),
                                    )
                                    : Text("Paid", style: TextStyle(color: ColorManager.megenda)),
                              ),
                            ],
                          );
                        }).toList()
                      : [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for table headers
  Widget _tableHeader(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      textAlign: TextAlign.center,
    );
  }

  // Helper widget for table cells
  Widget _tableCell(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 14),
      textAlign: TextAlign.center,
    );
  }
}
