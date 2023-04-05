import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogSuccess {
  static void showDialog() {
    Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          title: const Text(
            "🎉",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 56.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: const Text(
            "Congratulations, you have surpassed the minimum energy threshold!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
              ),
              child: const Text("Perfect!"),
            ),
          ],
        ));
  }

  static void cancelDialog() {
    Get.back();
  }
}
