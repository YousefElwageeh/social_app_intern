import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app_intern/src/conifg/theme/valuseManger.dart';
import 'package:social_app_intern/src/conifg/utils/AppStrings.dart';
import 'package:social_app_intern/src/conifg/utils/commonWidgets.dart';
import 'package:social_app_intern/src/conifg/utils/validators.dart';
import 'package:social_app_intern/src/core/AppStates.dart';
import 'package:social_app_intern/src/presentation/pages/loginScreen.dart';
import 'package:social_app_intern/src/presentation/viewModel/authViewMOdel.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  var registerViewModel = Get.put(AuthViewModel());
  var personImage =
      'https://icons-for-free.com/iconfiles/png/512/person-1324760545186718018.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: registerViewModel.RegisterformKey,
              child: Column(
                children: [
                  CommonWidgets.TextTitle(context,
                      title: AppStrings.SignUp,
                      SubTitle: AppStrings.SignUpDetails),
                  Column(
                    children: [
                      GetBuilder<AuthViewModel>(
                        builder: (controller) => CircleAvatar(
                            radius: 30,
                            backgroundImage: controller
                                        .userModel.profileImage !=
                                    null
                                ? FileImage(
                                    File(controller.userModel.profileImage!))
                                : null),
                        init: AuthViewModel(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 200,
                        height: 100,
                        child: CommonWidgets.DefultButton(
                          context,
                          text: 'uplode your image',
                          onPressed: () async =>
                              await registerViewModel.getProfileImage(),
                        ),
                      ),
                    ],
                  ),
                  CommonWidgets.DefultTextFormField(
                    label: AppStrings.Name,
                    textEditingController: registerViewModel.nameController,
                    validator: (p0) => validateFullName(p0),
                  ),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  CommonWidgets.DefultTextFormField(
                    label: AppStrings.Email,
                    textEditingController:
                        registerViewModel.registerEmailController,
                    validator: validateEmail,
                  ),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  CommonWidgets.DefultTextFormField(
                    label: AppStrings.MobileNumber,
                    textEditingController: registerViewModel.phoneController,
                  ),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  CommonWidgets.DefultTextFormField(label: AppStrings.Address),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  CommonWidgets.DefultTextFormField(
                      label: AppStrings.Password,
                      textEditingController:
                          registerViewModel.registerPasswordController,
                      validator: validatePassword),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  CommonWidgets.DefultTextFormField(
                      label: AppStrings.ConfirmPassword,
                      validator: (p0) => validateConfirmPassword(
                          registerViewModel.registerPasswordController.text,
                          p0)),
                  Obx(
                    () => registerViewModel.isLoading.value
                        ? AppStates.loadingState()
                        : CommonWidgets.DefultButton(
                            context,
                            text: AppStrings.SignUp,
                            onPressed: () => registerViewModel.register(),
                          ),
                  ),
                  CommonWidgets.DefultTextButton(
                      text1: AppStrings.AlreadyHaveAnAccount,
                      text2: AppStrings.Login,
                      onPressed: () => Get.to(() => LoginScreen(),
                          transition: Transition.leftToRight))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
