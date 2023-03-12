import 'package:facebook_api/data/repositories/user_repo.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/models/user/user_info_res_model.dart';

class HomeController extends GetxController {
  final storage = GetStorage();

  final UserRepo userRepository;

  HomeController({required this.userRepository});
  UserInfoResModel userInfo = UserInfoResModel();
  @override
  void onReady() {
    checkUserLoggedIn();
    super.onReady();
  }

  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }

  //save token to lacal storage and navigate to home sreen if user is logged in before and token is not expired get.
  //if token is expired or user is not loggen in before then navigate to login screen
  void checkUserLoggedIn() async {
    final token = await storage.read("token");
    if (token == null) {
      Get.offAllNamed("/signIn");
    }
  }

  //logOut User
  void logout() {
    storage.remove("token");
    Get.offAllNamed("/signIn");
  }

  //get current user logged
  void getCurrentUser() async {
    final res = await userRepository.getUserInfor();
    if (res != null) {
      Get.snackbar("Successfully", "User Logged In Successfully");
      userInfo;
    }

    // res.fold(
    //     (left) => Get.snackbar(
    //           "Error Occurres",
    //           left.toString(),
    //         ), (right) {
    //   Get.snackbar("Successfully", "User Logged In Successfully");
    //   if (kDebugMode) {
    //     print(right);
    //     userInfo = right;
    //   }
    // });
  }
}
