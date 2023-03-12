import 'package:facebook_api/bindings/auth/auth_binding.dart';
import 'package:facebook_api/constant/constan.dart';
import 'package:facebook_api/views/sreens/auth/reset_password.dart';
import 'package:facebook_api/views/sreens/auth/signup_screen.dart';
import 'package:facebook_api/views/sreens/home/home_sreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/home/home_binding.dart';
import 'views/sreens/auth/sigin_sreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      initialRoute: '/main',
      getPages: [
        GetPage(
            name: '/signIn',
            page: () => SignInScreen(),
            binding: AuthBinding()),
        GetPage(
            name: '/signup',
            page: () => Signupscreen(),
            binding: AuthBinding()),
        GetPage(name: '/reset', page: () => ResetPassword()),
        GetPage(
          name: '/main',
          page: () => MyHomePage(image: ('{$kBaseUrl}$Image')),
          binding: HomeBinding(),
        )
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
    );
  }
}
