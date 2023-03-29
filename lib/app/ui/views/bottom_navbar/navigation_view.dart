import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/ui/views/bottom_navbar/navigation_controller.dart';
import 'package:pilar_app/app/ui/views/chat/chat_view.dart';
import 'package:pilar_app/app/ui/views/home/home_view.dart';
import 'package:pilar_app/app/ui/views/profile/profile_view.dart';

class NavigationView extends StatelessWidget {
  NavigationController navigationController = Get.put(NavigationController());
  NavigationView({Key? key}) : super(key: key);

  final screens = [
    const HomeView(),
    const ChatView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: navigationController.selectedIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color.fromRGBO(37, 138, 216, 1.0),
            unselectedItemColor: const Color.fromRGBO(96, 96, 96, 1),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (index) {
              navigationController.changeIndex(index);
            },
            currentIndex: navigationController.selectedIndex.value,
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
          )),
    );
  }
}
