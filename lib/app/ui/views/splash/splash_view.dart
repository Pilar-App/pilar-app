import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/ui/views/splash/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        backgroundColor: const Color.fromRGBO(36, 139, 214, 1.0),
        body: Stack(children: [
          const Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 100.00,
              height: 100.00,
              child: Image(
                image: AssetImage("assets/images/isotipo_blanco.png"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                height: 120.00,
                child: Column(
                  children: const [
                    Text(
                      "created by",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Text(
                      "PilarTeam",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )
                  ],
                )),
          )
        ]),
      ),
    );
  }
}
