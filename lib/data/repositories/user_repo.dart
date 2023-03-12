import 'package:facebook_api/data/provider/auth_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class UserRepo {
  final AuthProvider authProvider;
  UserRepo({required this.authProvider});
  getUserInfor() async {
    await authProvider.getCurrentUserLogged();
  }

  // get Current User Logged
  void getCurrentUser() async {
    final res = await authProvider.getCurrentUserLogged();
    res.fold(
        (left) => Get.snackbar(
              "Error Occurred",
              left.toString(),
            ), (right) {
      Get.snackbar("Success", "User Logged In Successfully");
      if (kDebugMode) {
        print(right);
      }
    });
  }
}

// get Current User Logged
// void getCurrentUser() async {
//   final res = await authRepository.getCurrentUser();
//   res.fold(
//       (Left) => Get.snackbar(
//             "Error Occurred",
//             Left.toString(),
//           ), (right) {
//     Get.snackbar("Success", "User Logged In Successfully");
//     print(right);
//   });
// }
