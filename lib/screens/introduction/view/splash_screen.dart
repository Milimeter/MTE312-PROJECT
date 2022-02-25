import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mteiot/const/values.dart';
import 'package:mteiot/shared/text.dart';
import 'package:mteiot/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: AvatarGlow(
                glowColor: kWhiteColor.withOpacity(0.5),
                endRadius: 200.0,
                duration: const Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: const Duration(milliseconds: 100),
                child: const CircleAvatar(
                  backgroundColor: kWhiteColor,
                  radius: 100,
                  child: Icon(
                    Entypo.tablet,
                    color: kPrimaryColor,
                    size: 90,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    border: Border.all(color: kWhiteColor),
                    borderRadius: BorderRadius.circular(Values().defaultRadius),
                  ),
                  child: const CText(
                    text: "MTE Group 6 Remote Door Controller",
                    color: kWhiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
