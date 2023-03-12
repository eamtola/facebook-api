import 'package:facebook_api/controllers/auth/auth_controller.dart';
import 'package:facebook_api/data/provider/auth_provider.dart';
import 'package:facebook_api/data/repositories/auth_repository.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(
        authRepository: AuthRepository(authProvider: AuthProvider())));
  }
}
