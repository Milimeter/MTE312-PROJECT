// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:mteiot/screens/app/binding/app_binding.dart';
import 'package:mteiot/screens/app/view/main_view.dart';
import 'package:mteiot/screens/introduction/binding/intro_binding.dart';
import 'package:mteiot/screens/introduction/view/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const SPLASHSCREEN = Routes.INITIAL;

  static final routes = [
    GetPage(
        name: SPLASHSCREEN,
        page: () => const SplashScreen(),
        binding: IntroBinding()),
    GetPage(
        name: Routes.MAINVIEW,
        page: () => const MainView(),
        binding: AppBinding()),
  ];
}
