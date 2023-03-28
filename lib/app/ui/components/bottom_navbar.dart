import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/routes/app_routes.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  String currentRoute = Get.currentRoute;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35.0,
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Column(
                    children: [
                      Container(
                          width: 35.0,
                          height: 35.0,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.home,
                            size: 28.0,
                            color: currentRoute == AppRoutes.home
                                ? const Color.fromRGBO(37, 138, 216, 1.0)
                                : const Color.fromRGBO(96, 96, 96, 1),
                          )),
                      Text(
                        "Home",
                        style: currentRoute == AppRoutes.home
                            ? const TextStyle(
                                color: Color.fromRGBO(37, 138, 216, 1.0),
                                fontWeight: FontWeight.w700,
                              )
                            : const TextStyle(
                                color: Color.fromRGBO(96, 96, 96, 1),
                                fontWeight: FontWeight.w400,
                              ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Get.toNamed(AppRoutes.home);
                  },
                ),
                GestureDetector(
                  child: Column(
                    children: [
                      Container(
                          width: 35.0,
                          height: 35.0,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.chat,
                            size: 28.0,
                            color: currentRoute == AppRoutes.chat
                                ? const Color.fromRGBO(37, 138, 216, 1.0)
                                : const Color.fromRGBO(96, 96, 96, 1),
                          )),
                      Text(
                        "Chat",
                        style: currentRoute == AppRoutes.chat
                            ? const TextStyle(
                                color: Color.fromRGBO(37, 138, 216, 1.0),
                                fontWeight: FontWeight.w700,
                              )
                            : const TextStyle(
                                color: Color.fromRGBO(96, 96, 96, 1),
                                fontWeight: FontWeight.w500,
                              ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Get.toNamed(AppRoutes.chat);
                  },
                ),
                GestureDetector(
                  child: Column(
                    children: [
                      Container(
                          width: 35.0,
                          height: 35.0,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.person,
                            size: 28.0,
                            color: currentRoute == AppRoutes.viaje
                                ? const Color.fromRGBO(37, 138, 216, 1.0)
                                : const Color.fromRGBO(96, 96, 96, 1),
                          )),
                      Text(
                        "Profile",
                        style: currentRoute == AppRoutes.viaje
                            ? const TextStyle(
                                color: Color.fromRGBO(37, 138, 216, 1.0),
                                fontWeight: FontWeight.w700,
                              )
                            : const TextStyle(
                                color: Color.fromRGBO(96, 96, 96, 1),
                                fontWeight: FontWeight.w500,
                              ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Get.toNamed(AppRoutes.viaje);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
