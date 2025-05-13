import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carrental/architecture/base/basic_mixin.dart';
import 'package:carrental/data/api_end_point.dart';
import 'package:carrental/data/api_service.dart';
import 'package:carrental/data/local_storage.dart';
import 'package:carrental/model/booking/booking_response.dart';
import 'package:carrental/resourse/style/color_manager.dart';
import 'package:carrental/screen/dashboard/dashboard_page.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> with BasicMixin{
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController transactionIdController = TextEditingController();
  TextEditingController senderAccountController = TextEditingController();
  TextEditingController referenceController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  void _submitPayment() async{
    if (_formKey.currentState!.validate()) {

      String? response = await APIService.fetchData(ApiEndPoint.POST_PAYMENT_STORE, bearerToken: LocalStorage.loginResponse.authorisation!.token);
      if (response != null) {
        BookingResponse bookingResponse = BookingResponse.fromJson(convertJson(response));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(bookingResponse.data)),
        );
        if (bookingResponse.success!) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage()),
                (route) => false,
          );
        }
      }




    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment",
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
        ),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  "Make A Custom Payment",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                // M-Cash MFS Info
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Wrap(
                    children: [
                      Icon(Icons.account_balance_wallet, color: CupertinoColors.systemOrange),
                      SizedBox(width: 10),
                      Text(
                        "M-Cash MFS: +971 52 872 1218",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Name Field
                _buildInputField("Name *", "Enter your name", nameController, TextInputType.text),

                // Phone Field
                _buildInputField("Phone *", "Enter your phone number", phoneController, TextInputType.phone),

                // Amount Field
                _buildInputField("Amount *", "Enter amount", amountController, TextInputType.number),

                // Transaction ID Field
                _buildInputField("Transaction ID *", "Enter transaction ID", transactionIdController, TextInputType.text),

                // Sender Account No. Field
                _buildInputField("Sender Account No. *", "Enter sender account number", senderAccountController, TextInputType.text),

                // Reference/Invoice No. Field
                _buildInputField("Reference/Invoice No. *", "Enter reference", referenceController, TextInputType.text),

                // Note Field
                _buildInputField("Note", "Enter any additional notes (optional)", noteController, TextInputType.text, maxLines: 3),

                SizedBox(height: 20),

                // Submit Button
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
                      onPressed: _submitPayment,
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

  // Reusable Input Field Widget
  Widget _buildInputField(
      String label, String hint, TextEditingController controller, TextInputType keyboardType,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hint,
            ),
            validator: (value) {
              if (label.contains("*") && (value == null || value.isEmpty)) {
                return "This field is required";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
