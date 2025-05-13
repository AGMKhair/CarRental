import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carrental/architecture/base/basic_mixin.dart';
import 'package:carrental/data/api_end_point.dart';
import 'package:carrental/data/api_service.dart';
import 'package:carrental/data/local_storage.dart';
import 'package:carrental/model/login/authorisation_model.dart';
import 'package:carrental/model/login/login_response.dart';
import 'package:carrental/model/login/user_model.dart';
import 'package:carrental/model/user/user_details_response.dart';
import 'package:carrental/resourse/style/color_manager.dart';
import 'package:carrental/resourse/util/string_dictionary.dart';
import 'package:carrental/resourse/widget/wrapper.dart';
import 'package:carrental/screen/login/login_screen.dart';
import 'package:carrental/screen/main_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with BasicMixin {
  UserDetailsResponse userDetails =
  UserDetailsResponse(success: false, message: "");
  User userInfo = User(
      id: 1,
      image: "",
      name: "",
      slug: "",
      type: "",
      email: "",
      mobile: "",
      status: 0,
      createdAt: "",
      updatedAt: "");

  void checkLoginStatus() {
    if (LocalStorage.loginResponse.status != "success") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(
                title: StringDictionary.USER_PROFILE,
              ),
            ));
      });
    } else {
      fetchData();
    }
  }

  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  void fetchData() async {
    setState(() => isLoading = true);
    String? response = await APIService.fetchData(ApiEndPoint.GET_USER_INFO,
        bearerToken: LocalStorage.loginResponse.authorisation!.token);
    if (response != null) {
      setState(() {
        userDetails = UserDetailsResponse.fromJson(convertJson(response));
        userInfo = userDetails.data!.user;
      });
    }
    setState(() => isLoading = false);
  }

  void _logout(BuildContext context) {
    LocalStorage.loginResponse = LoginResponse(
        status: "",
        user: User(
            id: 0,
            name: '',
            slug: '',
            type: '',
            email: '',
            mobile: '',
            status: 0,
            createdAt: '',
            updatedAt: ''),
        authorisation: Authorisation(token: '', type: ''));

    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
          (route) => false,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logged out successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Hero(
                    tag: 'profile_pic',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        userInfo.image != null
                            ? userInfo.image
                            : "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedOpacity(
                  opacity: isLoading ? 0 : 1,
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    children: [
                      Text(userInfo.name,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(userInfo.email,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.grey)),
                      const SizedBox(height: 8),
                      Text("📞 ${userInfo.mobile}",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black54)),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(CupertinoIcons.person),
                              title: const Text("Edit Profile"),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              onTap: () {},
                            ),
                            Divider(color: Colors.grey[300]),
                            ListTile(
                              leading: const Icon(CupertinoIcons.gear),
                              title: const Text("Settings"),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () => _logout(context),
                          child: const Text("Logout"),
                        ),
                      ),
                    ],
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
