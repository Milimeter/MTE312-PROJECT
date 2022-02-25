import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:mteiot/const/values.dart';
import 'package:mteiot/screens/app/controller.dart/app_controller.dart';
import 'package:mteiot/shared/text.dart';
import 'package:mteiot/utils/colors.dart';
import 'package:mteiot/utils/sizes.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.find();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Obx(
                () => Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.8,
                  decoration: BoxDecoration(
                    color: appController.isLockedState.value == true
                        ? kLockedColor
                        : kUnlockedColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Values().stateRadius),
                      bottomRight: Radius.circular(Values().stateRadius),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AvatarGlow(
                        glowColor: kWhiteColor.withOpacity(0.9),
                        endRadius: 200.0,
                        duration: const Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: const Duration(milliseconds: 100),
                        child: CircleAvatar(
                          backgroundColor: kWhiteColor,
                          radius: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                appController.isLockedState.value == true
                                    ? Entypo.lock
                                    : Entypo.lock_open,
                                color: appController.isLockedState.value == true
                                    ? kLockedColor
                                    : kUnlockedColor,
                                size: 120,
                              ),
                              SizedBox(height: heightSize(10)),
                              CText(
                                text: appController.isLockedState.value == true
                                    ? "Locked"
                                    : "Unlocked",
                                fontWeight: FontWeight.w600,
                                color: appController.isLockedState.value == true
                                    ? kLockedColor
                                    : kUnlockedColor,
                                height: 1.5,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 10),
                      child: Column(
                        children: const [
                          CText(
                            text: "Main Entrance",
                            fontWeight: FontWeight.w700,
                            color: kWhiteColor,
                            height: 1.5,
                            size: 40,
                          ),
                          CText(
                            text: "Requires stable internet connection*",
                            color: kWhiteColor,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      appController.isLockedState.value == true
                          ? appController.unLockDoor()
                          : appController.lockDoor();
                    },
                    child: Obx(
                      () => Container(
                        height: heightSize(120),
                        width: widthSize(120),
                        margin: EdgeInsets.only(
                            bottom: constraints.maxHeight * 0.15),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          border: Border.all(color: kWhiteColor, width: 5),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CText(
                            text: appController.isLockedState.value == true
                                ? "Unlock"
                                : "Lock",
                            fontWeight: FontWeight.w600,
                            color: kWhiteColor,
                            height: 1.5,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: constraints.maxWidth * 0.5,
                      margin: const EdgeInsets.only(bottom: 40),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
                        borderRadius:
                            BorderRadius.circular(Values().defaultRadius),
                      ),
                      child: const CText(
                        text: "Beta",
                        color: kBlackColor,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                      ),
                    )),
              )
            ],
          );
        }),
      ),
    );
  }
}
