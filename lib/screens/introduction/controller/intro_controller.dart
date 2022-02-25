import 'dart:async';

import 'package:get/get.dart';
import 'package:mteiot/routes/app_pages.dart';

class IntroController extends GetxController {
  navigator() {
    Timer(const Duration(seconds: 4), () {
      Get.offNamed(Routes.MAINVIEW);
    });
  }

  @override
  void onReady() {
    navigator();
    super.onReady();
  }
}
