import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/ui/views/bottom_navbar/navigation_controller.dart';
import 'package:pilar_app/app/ui/views/chat/chat_view.dart';
import 'package:pilar_app/app/ui/views/home/home_view.dart';
import 'package:pilar_app/app/ui/views/profile/profile_view.dart';

class NavigationView extends GetView<NavigationController> {
  NavigationView({Key? key}) : super(key: key);

  final screens = [
    const HomeView(),
    const ChatView(),
    ProfileView(),
  ];

  // final User? user = Auth()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(37, 138, 216, 1.0),
        ),
        toolbarHeight: 0.0,
        elevation: 0.0,
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromRGBO(37, 138, 216, 1.0),
          unselectedItemColor: const Color.fromRGBO(96, 96, 96, 1),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) {
            controller.changeIndex(index);
          },
          currentIndex: controller.selectedIndex.value,
          iconSize: 28.0,
          selectedLabelStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
