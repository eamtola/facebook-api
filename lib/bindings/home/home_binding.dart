import 'package:facebook_api/controllers/home/home_controller.dart';
import 'package:facebook_api/data/provider/auth_provider.dart';
import 'package:facebook_api/data/repositories/user_repo.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() =>
        HomeController(userRepository: UserRepo(authProvider: AuthProvider())));
  }
}
