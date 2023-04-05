import 'package:get/get.dart';
import 'package:pilar_app/app/routes/app_routes.dart';
import 'package:pilar_app/app/ui/views/bottom_navbar/navigation_binding.dart';
import 'package:pilar_app/app/ui/views/bottom_navbar/navigation_view.dart';
import 'package:pilar_app/app/ui/views/home/energy_views/boost_your_wellness_view.dart';
import 'package:pilar_app/app/ui/views/home/energy_views/energy_drains_view.dart';
import 'package:pilar_app/app/ui/views/login/login_binding.dart';
import 'package:pilar_app/app/ui/views/login/login_view.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/quizz_binding.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/quizz_home.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/quizz_page.dart';
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
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.navbar,
      page: () => NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: AppRoutes.quizzHome,
      page: () => const QuizzHome(),
      binding: QuizzBinding(),
    ),
    GetPage(
      name: AppRoutes.quizzPage,
      page: () => const QuizzPage(),
    ),
    GetPage(
      name: AppRoutes.lessEnergy,
      page: () => const EnergyDrainsView(),
    ),
    GetPage(
      name: AppRoutes.boostYourWellness,
      page: () => const BoostYourWellnessView(),
    ),
  ];
}
