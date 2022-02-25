import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:mteiot/utils/colors.dart';

cToast(
        {Color? color,
        IconData? icon,
        required String title,
        required String message}) =>
    Get.snackbar(
      title,
      message,
      icon: Icon(icon ?? Entypo.info_with_circle, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      backgroundColor: color ?? kPrimaryColor,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
