import 'package:get/get.dart';
import 'package:pilar_app/app/ui/views/bottom_navbar/navigation_controller.dart';

class NavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<NavigationController>(NavigationController());
  }
}
