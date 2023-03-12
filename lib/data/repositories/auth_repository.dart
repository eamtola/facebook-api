import 'package:facebook_api/data/models/auth/register_user_res_model.dart';
import 'package:facebook_api/data/models/user/user_info_res_model.dart';
import 'package:facebook_api/data/provider/auth_provider.dart';

import 'package:either_dart/either.dart';
import 'dart:io';

class AuthRepository {
  final AuthProvider authProvider;
  AuthRepository({required this.authProvider});
  //register user

  Future<Either<String, RegisterUserResModel>> registerUser({
    required String name,
    required String email,
    required String password,
    required File image,
  }) async {
    return authProvider.registerUser(
        name: name, email: email, password: password, image: image);
  }

  //login user with email and password
  Future<Either<String, RegisterUserResModel>> loginUser(
      {required String email, required String password}) async {
    return authProvider.loginUser(email: email, password: password);
  }

  //get current user logged
  Future<Either<String, UserInfoResModel>> getCurrentUser() {
    return authProvider.getCurrentUserLogged();
  }
}
