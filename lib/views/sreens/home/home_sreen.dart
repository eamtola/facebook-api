import 'package:facebook_api/constant/constan.dart';
import 'package:facebook_api/controllers/home/home_controller.dart';
import 'package:facebook_api/data/models/user/user_info_res_model.dart';
import 'package:facebook_api/data/provider/auth_provider.dart';
import 'package:facebook_api/data/repositories/user_repo.dart';
import 'package:facebook_api/reusable_widgets/circle_buttin.dart';
import 'package:facebook_api/reusable_widgets/create_post_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyHomePage extends StatelessWidget {
  final String image;
  final controller = Get.put(
      HomeController(userRepository: UserRepo(authProvider: AuthProvider())));
  MyHomePage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'facebook',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
              letterSpacing: -1.2,
            ),
          ),
          floating: false,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30.0,
              onPressed: () {},
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              onPressed: () {},
            ),
          ],
        ),
        SliverToBoxAdapter(
            child: CreatePostContainer(image: UserInfoResModel()))
      ]),
    );
  }
}
