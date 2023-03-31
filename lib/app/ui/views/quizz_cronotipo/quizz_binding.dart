import 'package:get/get.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/quizz_controller.dart';

class QuizzBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<QuizzController>(QuizzController());
  }
}
