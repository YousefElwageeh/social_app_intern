import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app_intern/src/conifg/utils/validators.dart';
import 'package:social_app_intern/src/core/AppStates.dart';
import 'package:social_app_intern/src/presentation/pages/signupScreen.dart';
import 'package:social_app_intern/src/presentation/viewModel/authViewMOdel.dart';

import '../../conifg/theme/valuseManger.dart';
import '../../conifg/utils/AppStrings.dart';
import '../../conifg/utils/commonWidgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var LoginViewModel = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s25),
            child: Form(
              key: LoginViewModel.LoginformKey,
              child: Column(
                children: [
                  CommonWidgets.TextTitle(context,
                      title: AppStrings.Login,
                      SubTitle: AppStrings.loginDetails),
                  CommonWidgets.DefultTextFormField(
                      label: AppStrings.Email,
                      textEditingController:
                          LoginViewModel.loginemailController,
                      validator: validateEmail),
                  const SizedBox(
                    height: AppSize.s18,
                  ),
                  CommonWidgets.DefultTextFormField(
                      label: AppStrings.Password,
                      textEditingController:
                          LoginViewModel.loginPasswordController,
                      validator: validatePassword),
                  Obx(
                    () => LoginViewModel.isLoading.value
                        ? AppStates.loadingState()
                        : CommonWidgets.DefultButton(
                            context,
                            text: AppStrings.Login,
                            onPressed: () => LoginViewModel.login(),
                          ),
                  ),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  CommonWidgets.DefultTextButton(
                    text1: AppStrings.DonotHaveAnAccount,
                    text2: AppStrings.SignUp,
                    onPressed: () => Get.to(() => SignUpScreen(),
                        transition: Transition.leftToRight),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
