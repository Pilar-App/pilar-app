import 'package:get/get.dart';
import 'package:pilar_app/app/routes/app_routes.dart';
import 'package:pilar_app/app/ui/views/onboarding/onboarding_1.dart';
import 'package:pilar_app/app/ui/views/splash/splash_binding.dart';
import 'package:pilar_app/app/ui/views/splash/splash_view.dart';

abstract class AppViews {
  static final views = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding1,
      page: () => const Onboarding1(),
    ),
  ];
}
