import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/ui/views/bottom_navbar/navigation_controller.dart';
import 'package:pilar_app/app/ui/views/login/login_controller.dart';

class ProfileView extends GetView<NavigationController> {
  ProfileView({Key? key}) : super(key: key);

  LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 120),
        child: ElevatedButton(
          child: const Text(
            "Logout",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          onPressed: () {
            controller.logout();
          },
        ),
      ),
    );
  }
}
