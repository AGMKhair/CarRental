import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carrental/architecture/base/basic_mixin.dart';
import 'package:carrental/data/api_end_point.dart';
import 'package:carrental/data/api_service.dart';
import 'package:carrental/data/local_storage.dart';
import 'package:carrental/model/cars/cars_response.dart';
import 'package:carrental/model/login/login_response.dart';
import 'package:carrental/resourse/style/color_manager.dart';
import 'package:carrental/resourse/util/dialog_util.dart';
import 'package:carrental/resourse/util/string_dictionary.dart';
import 'package:carrental/resourse/widget/button_outlined_widget.dart';
import 'package:carrental/resourse/widget/password_field_widget.dart';
import 'package:carrental/resourse/widget/secondary_button_widget.dart';
import 'package:carrental/resourse/widget/space_widget.dart';
import 'package:carrental/resourse/widget/text_field_outlined_widget.dart';
import 'package:carrental/resourse/widget/wrapper.dart';
import 'package:carrental/screen/booking_page.dart';
import 'package:carrental/screen/dashboard/dashboard_page.dart';
import 'package:carrental/screen/home.dart';
import 'package:carrental/screen/registration/registration_screen.dart';
/**
 *  PROJECT_NAME:-  carrental
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 21/2/25
 */

class LoginScreen extends StatefulWidget {
  String title;
  final CarsData? car;

  LoginScreen({super.key, required this.title, this.car});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with BasicMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorEmail = '';
  String errorPassword = '';

  bool isLoading = false;

  void submit() async {
    if (validation()) {
      setState(() => isLoading = true);
      String params = "?email=${emailController.text}&password=${passwordController.text}";
      String response = await APIService.postData(ApiEndPoint.POST_LOGIN + params, "");
      setState(() => isLoading = false);
      // convertJson(response);
      LocalStorage.loginResponse = LoginResponse.fromJson(convertJson(response));
      if (LocalStorage.loginResponse.status == "success") {
        switch (widget.title) {
          case StringDictionary.USER_PROFILE:
            Navigator.pop(context);
            break;
          case StringDictionary.DHASHBOARD:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardPage()));
            break;
          case StringDictionary.CARE_DETAILS:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BookingPage(car: widget.car!)));
            break;
          default:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
            break;
        }
      } else {
        DialogUtil.snackBar(context, "Check our userName and password and try again!!");
      }
    }
  }

  bool validation() {
    errorEmail = '';
    errorPassword = '';

    bool validation = true;

    if (emailController.text.isEmpty) {
      setState(() => errorEmail = 'Enter your email address please');
      validation = false;
    } else if (passwordController.text.isEmpty) {
      setState(() => errorPassword = 'Enter your password please');
      validation = false;
    }
    return validation;
  }

  _register(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationScreen(title: widget.title, car: widget.car),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringDictionary.LOGIN,
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
      body: Wrapper(
        isLoading: isLoading,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space(),
              TextFieldOutlineWidget(
                prefixIcon: Icons.email_outlined,
                inputType: TextInputType.emailAddress,
                controller: emailController,
                label: 'Email Address',
              ),
              Space(),
              PasswordFormField(
                controller: passwordController,
                label: 'Password',
                error: errorPassword,
              ),
              ButtonOutlinedWidget(onClick: () {
                submit();
              }),
              Space(),
              Wrap(
                children: <Widget>[
                  const Space(times: 2),
                  const Text(
                    StringDictionary.REGISTRATION_TITLE,
                    style: TextStyle(fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SecondaryButton(
                      label: StringDictionary.REGISTRATION_HERE,
                      onPressed: () => _register(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
