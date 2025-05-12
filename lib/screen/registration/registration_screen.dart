import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tilmaame/architecture/base/basic_mixin.dart';
import 'package:tilmaame/data/api_end_point.dart';
import 'package:tilmaame/data/api_service.dart';
import 'package:tilmaame/model/cars/cars_response.dart';
import 'package:tilmaame/model/registration/registration_response_model.dart';
import 'package:tilmaame/resourse/style/color_manager.dart';
import 'package:tilmaame/resourse/util/dialog_util.dart';
import 'package:tilmaame/resourse/util/string_dictionary.dart';
import 'package:tilmaame/resourse/widget/button_outlined_widget.dart';
import 'package:tilmaame/resourse/widget/password_field_widget.dart';
import 'package:tilmaame/resourse/widget/secondary_button_widget.dart';
import 'package:tilmaame/resourse/widget/space_widget.dart';
import 'package:tilmaame/resourse/widget/text_field_outlined_widget.dart';
import 'package:tilmaame/resourse/widget/wrapper.dart';
import 'package:tilmaame/screen/booking_page.dart';
import 'package:tilmaame/screen/home.dart';
import 'package:tilmaame/screen/login/login_screen.dart';

/**
 *  PROJECT_NAME:-  tilmaame
 *  Project Created by AGM Khair Sabbir
 *  DATE:- 21/2/25
 **/

class RegistrationScreen extends StatefulWidget {
  String title;
  CarsData? car;

  RegistrationScreen({super.key, required this.title, this.car});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> with BasicMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  String errorName = '';
  String errorPhone = '';
  String errorEmail = '';
  String errorPassword = '';

  bool isLoading = false;

  void submit() async {
    if (validation()) {
      String params = "?email=${emailController.text}&password=${passwordController.text}&name=${nameController.text}&phone=${phoneController.text}";
      String response = await APIService.postData(ApiEndPoint.POST_REGISTRATION + params, "");

      RegistrationResponse data = RegistrationResponse.fromJson(convertJson(response));

      if (data.success) {
        switch (widget.title) {
          case StringDictionary.CARE_DETAILS:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BookingPage(car: widget.car!)));
            break;
          default:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
            break;
        }
      } else {
        DialogUtil.snackBar(context, data.message);
      }
    }
  }

  bool validation() {
    errorName = '';
    errorPhone = '';
    errorEmail = '';
    errorPassword = '';

    bool validation = true;

    if (nameController.text.isEmpty) {
      setState(() => errorName = 'Enter your name please');
      validation = false;
    } else if (phoneController.text.isEmpty) {
      setState(() => errorPhone = 'Enter your phone number please');
      validation = false;
    } else if (emailController.text.isEmpty) {
      setState(() => errorEmail = 'Enter your email address please');
      validation = false;
    } else if (passwordController.text.isEmpty) {
      setState(() => errorPassword = 'Enter your password please');
      validation = false;
    } else if (passwordController.text != confirmController.text) {
      setState(() => errorPassword = 'Password and Confirm Password are not same');
      validation = false;
    }
    return validation;
  }

  _register(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LoginScreen(
                  title: StringDictionary.REGISTRATION,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringDictionary.REGISTRATION,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Text(
            //   StringDictionary.REGISTRATION,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //       fontSize: SizeManager.text_size_20,
            //       color: ColorManager.primary),
            // ),
            Space(),
            TextFieldOutlineWidget(
              error: errorName,
              prefixIcon: Icons.person,
              controller: nameController,
              label: 'Name',
            ),
            Space(),
            TextFieldOutlineWidget(
              prefixIcon: Icons.account_box_outlined,
              inputType: TextInputType.number,
              controller: phoneController,
              label: 'Phone',
              error: errorPhone,
            ),
            Space(),
            TextFieldOutlineWidget(
              prefixIcon: Icons.email_outlined,
              inputType: TextInputType.emailAddress,
              controller: emailController,
              label: 'Email Address',
              error: errorEmail,
            ),
            Space(),
            PasswordFormField(
              controller: passwordController,
              label: 'Password',
              error: errorPassword,
            ),
            PasswordFormField(
              controller: confirmController,
              label: 'Confirm Password',
            ),
            ButtonOutlinedWidget(onClick: () {
              submit();
            }),
            Space(),
            Wrap(
              children: <Widget>[
                const Text(
                  StringDictionary.LOGIN_TITLE,
                  style: TextStyle(fontSize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SecondaryButton(
                    label: StringDictionary.LOGIN,
                    onPressed: () => _register(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
