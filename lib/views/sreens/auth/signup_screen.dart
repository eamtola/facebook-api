import 'package:facebook_api/Utils/color_utills.dart';
import 'package:facebook_api/controllers/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signupscreen extends GetView<AuthController> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  final bool isPasswordType = false;
  final _formKey = GlobalKey<FormState>();
  Signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("48cae4"),
          hexStringToColor("90e0ef"),
          hexStringToColor("ade8f4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  GetBuilder<AuthController>(
                      // init: PickImageController(),
                      builder: (con) {
                    if (con.image != null) {
                      return Stack(children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: FileImage(controller.image!),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            alignment: Alignment.center,
                            height: 37,
                            width: 37,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: IconButton(
                              alignment: Alignment.topCenter,
                              onPressed: () {
                                controller.pickImages();
                              },
                              icon: const Icon(Icons.camera_alt),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ]);
                    } else {
                      return Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 55,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey,
                              child: ClipOval(
                                  child: SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.network(
                                  'https://www.pngall.com/wp-content/uploads/12/Avatar-PNG-Images-HD.png',
                                  fit: BoxFit.cover,
                                ),
                              )),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              alignment: Alignment.center,
                              height: 37,
                              width: 37,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  controller.pickImages();
                                },
                                icon: const Icon(Icons.camera_alt),
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your UserName';
                      }
                      return null;
                    },
                    controller: _userNameTextController,
                    obscureText: false,
                    enableSuggestions: false,
                    autocorrect: true,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black.withOpacity(0.9)),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      errorText: "",
                      labelText: "Enter UserName",
                      labelStyle:
                          TextStyle(color: Colors.black.withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Email';
                      }
                      return null;
                    },
                    controller: _emailTextController,
                    obscureText: false,
                    enableSuggestions: false,
                    autocorrect: true,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black.withOpacity(0.9)),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                      errorText: "",
                      labelText: "Enter Email",
                      labelStyle:
                          TextStyle(color: Colors.black.withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                      return null;
                    },
                    controller: _passwordTextController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: true,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black.withOpacity(0.9)),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock_outlined,
                        color: Colors.black,
                      ),
                      errorText: "",
                      labelText: "Enter Password",
                      labelStyle:
                          TextStyle(color: Colors.black.withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(90)),
                    child: ElevatedButton(
                      onPressed: () {
                        if (Get.find<AuthController>().image == null) {
                          Get.snackbar('Error', 'Please Select Image');
                          return;
                        }
                        if (_formKey.currentState!.validate()) {
                          Get.find<AuthController>().register(
                              name: _userNameTextController.text,
                              email: _emailTextController.text,
                              password: _passwordTextController.text,
                              image: Get.find<AuthController>().image!);
                          //clear text field
                          _userNameTextController.clear();
                          _emailTextController.clear();
                          _passwordTextController.clear();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.black26;
                          }
                          return Colors.white;
                        }),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
