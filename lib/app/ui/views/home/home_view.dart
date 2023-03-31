import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/ui/views/bottom_navbar/navigation_controller.dart';
import 'package:pilar_app/app/ui/views/home/widgets/energy.dart';
import 'package:pilar_app/app/ui/views/home/widgets/greeting.dart';
import 'package:pilar_app/app/ui/views/home/widgets/schedule.dart';

class HomeView extends GetView<NavigationController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Greeting(
            // name: controller.user.displayName!.split(" ")[0],
            name: 'Jhomar',
          ),
          const Energy(),
          const Schedule(),
        ],
      ),
    );
  }
}
