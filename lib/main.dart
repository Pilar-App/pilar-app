import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'login.dart';
import 'package:get/get.dart';
import 'package:pilar_app/app/routes/app_routes.dart';
import 'package:pilar_app/app/routes/app_views.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pilar App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat', primarySwatch: Colors.blue),
      initialRoute: AppRoutes.splash,
      getPages: AppViews.views,
    );
  }
}
