import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tilmaame/architecture/base/basic_mixin.dart';
import 'package:tilmaame/data/api_end_point.dart';
import 'package:tilmaame/data/api_service.dart';
import 'package:tilmaame/data/local_storage.dart';
import 'package:tilmaame/model/booking/booking_response.dart';
import 'package:tilmaame/model/cars/cars_response.dart';
import 'package:tilmaame/resourse/style/color_manager.dart';
import 'package:tilmaame/resourse/util/dialog_util.dart';
import 'package:tilmaame/screen/dashboard/dashboard_page.dart';

class BookingPage extends StatefulWidget {
  final CarsData car;

  BookingPage({required this.car});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> with BasicMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController(text: "0");
  TextEditingController noteController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  Future<void> _selectDate(BuildContext context, TextEditingController controller, bool isStartDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        String formattedDate = DateFormat("MM/dd/yyyy").format(pickedDate);
        controller.text = formattedDate;

        if (isStartDate) {
          startDate = pickedDate;
        } else {
          endDate = pickedDate;
        }

        _calculateAmount();
      });
    }
  }

  void _calculateAmount() {
    if (startDate != null && endDate != null) {
      int days = endDate!.difference(startDate!).inDays + 1;
      double totalAmount = days * double.parse(widget.car.price);

      setState(() {
        amountController.text = totalAmount.toStringAsFixed(2);
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String url = ApiEndPoint.POST_BOOKING_STORE +
          "?car_id=${widget.car.id}&phone=${phoneController.text}&amount=${amountController.text}&start_date=${startDateController.text.replaceAll("/", "-")}&end_date=${endDateController.text.replaceAll("/", "-")}&note=${noteController.text}";
      String? response = await APIService.postData(url, "", bearerToken: LocalStorage.loginResponse.authorisation!.token);

      BookingResponse bookingResponse = BookingResponse.fromJson(convertJson(response));

      if (bookingResponse.success!) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
          (route) => false,
        );
      } else {
        DialogUtil.snackBar(context, bookingResponse.message!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking ${widget.car.title}",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Car Name *", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                TextFormField(
                  initialValue: widget.car.title,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 15),
                Text("Booking Start Date *", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                TextFormField(
                  controller: startDateController,
                  readOnly: true,
                  onTap: () => _selectDate(context, startDateController, true),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                    hintText: "mm/dd/yyyy",
                  ),
                  validator: (value) => value!.isEmpty ? "Enter start date" : null,
                ),
                SizedBox(height: 15),
                Text("Booking End Date *", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                TextFormField(
                  controller: endDateController,
                  readOnly: true,
                  onTap: () => _selectDate(context, endDateController, false),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                    hintText: "mm/dd/yyyy",
                  ),
                  validator: (value) => value!.isEmpty ? "Enter end date" : null,
                ),
                SizedBox(height: 15),
                Text("Phone *", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter phone number",
                  ),
                  validator: (value) => value!.isEmpty ? "Enter phone number" : null,
                ),
                SizedBox(height: 15),
                Text("Amount *", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                TextFormField(
                  controller: amountController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 15),
                Text("Note", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                TextFormField(
                  controller: noteController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter any additional notes",
                  ),
                ),
                SizedBox(height: 20),
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
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: _submitForm,
                      child: Text("Submit"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
