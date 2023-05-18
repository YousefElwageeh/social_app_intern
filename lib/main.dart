import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app_intern/firebase_options.dart';
import 'package:social_app_intern/src/core/sharedPrefrence/shared_prefrence.dart';

import 'src/conifg/theme/themes.dart';
import 'src/presentation/pages/splashScreen.dart';
import 'src/presentation/viewModel/authViewMOdel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PrefData.init();
  runApp(SocialApp());
}

class SocialApp extends StatelessWidget {
  SocialApp({super.key});
  var authViewModel = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: const SplashScreen(),
    );
  }
}
