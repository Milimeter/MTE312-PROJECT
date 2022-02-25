import 'package:get/get.dart';
import 'package:mteiot/screens/app/controller.dart/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
  }
}
