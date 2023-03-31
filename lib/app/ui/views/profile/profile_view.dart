import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/ui/views/bottom_navbar/navigation_controller.dart';

class ProfileView extends GetView<NavigationController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 40.0,
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 140.0,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
              ),
              child: Image.network(
                controller.user.photoURL!,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 250.0,
              child: Text(
                controller.user.displayName!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 1.4,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 250.0,
              child: Text(
                controller.user.email!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 1.4,
                  fontSize: 20.0,
                  color: Color.fromRGBO(150, 150, 150, 1.0),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              color: const Color.fromRGBO(37, 138, 216, 1.0),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                controller.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
