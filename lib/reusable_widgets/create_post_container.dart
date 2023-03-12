import 'package:facebook_api/constant/constan.dart';
import 'package:flutter/material.dart';

import '../data/models/user/user_info_res_model.dart';

class CreatePostContainer extends StatelessWidget {
  final UserInfoResModel image;
  const CreatePostContainer({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      color: Colors.orange,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('{$kBaseUrl$image}'),
          ),
        ],
      ),
    );
  }
}
