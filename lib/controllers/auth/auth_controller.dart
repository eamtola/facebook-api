import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:facebook_api/data/repositories/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});
  final picker = ImagePicker();
  File? image;

  Future pickImages() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    } else {
      debugPrint('No Image Selected');
    }
  }

  //register
  void register({
    required String name,
    required String email,
    required String password,
    required File image,
  }) {
    final res = authRepository.registerUser(
      name: name,
      email: email,
      password: password,
      image: image,
    );
    res.fold(
        (left) => Get.snackbar(
              'Error Occurred',
              left.toString(),
            ), (right) {
      Get.snackbar('Success', 'Registered Successfully');
    });
  }

  //login user
  void login({required String email, required String password}) {
    final res = authRepository.loginUser(email: email, password: password);
    res.fold(
        (left) => Get.snackbar(
              "Error Occurred",
              left.toString(),
            ), (right) {
      Get.snackbar("Success", "User Logged In Successfully");
      saveToken(token: right.accessToken!);
      Get.offAllNamed("/main");
      // checkUserLoggedIn();
      if (kDebugMode) {
        print(right);
      }
    });
  }

  //save token to lacal storage and navigate to home sreen if user is logged in before and token is not expired get.
  //if token is expired or user is not loggen in before then navigate to login screen
  // void checkUserLoggedIn() {
  //   final token = GetStorage().read("token");
  //   if (token != null) {
  //     Get.offAllNamed("/home");
  //   } else {
  //     Get.offAllNamed("/login");
  //   }
  // }

  //save token to local storage and navigate to home screen
  void saveToken({required String token}) async {
    await GetStorage().write("token", token);
  }
}
