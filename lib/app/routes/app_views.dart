import 'package:get/get.dart';
import 'package:pilar_app/app/routes/app_routes.dart';
import 'package:pilar_app/app/ui/views/home/home_view.dart';
import 'package:pilar_app/app/ui/views/login/login_view.dart';
import 'package:pilar_app/app/ui/views/onboarding/onboarding_1.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/quizz_home.dart';
import 'package:pilar_app/app/ui/views/quizz_cronotipo/quizz_info.dart';
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
      name: AppRoutes.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoutes.onboarding1,
      page: () => const Onboarding1(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const Login(),
    ),
    GetPage(
      name: AppRoutes.quizzHome,
      page: () => const QuizzHome(),
    ),
    GetPage(
      name: AppRoutes.quizzPage,
      page: () => const QuizzPage(),
    ),

  ];
}
