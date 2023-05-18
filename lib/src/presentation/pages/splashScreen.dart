import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:social_app_intern/src/conifg/theme/colorManger.dart';
import 'package:social_app_intern/src/conifg/utils/assetsManger.dart';
import 'package:social_app_intern/src/presentation/viewModel/authViewMOdel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  var authViewModel = Get.put(AuthViewModel());
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    controller.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        Get.off(() => authViewModel.startWidget,
            transition: Transition.leftToRight);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Center(
          child: LottieBuilder.asset(
        JsonManger.SplashScreen,
        fit: BoxFit.cover,
        controller: controller,
        onLoaded: (p0) {
          controller.forward();
        },
      )),
    );
  }
}
