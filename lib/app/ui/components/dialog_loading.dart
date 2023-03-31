import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogLoading {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
        child: Container(
          child: const Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation(Color.fromRGBO(37, 138, 216, 1.0)),
            ),
          ),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      useSafeArea: true,
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}
