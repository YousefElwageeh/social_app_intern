import 'package:flutter/material.dart';
import 'package:social_app_intern/src/conifg/theme/colorManger.dart';

import '../theme/valuseManger.dart';

class CommonWidgets {
  static Widget DefultButton(BuildContext context,
      {required String text, void Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p28),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: AppSize.s50,
              decoration: BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.circular(AppSize.s25),
              ),
              child: MaterialButton(
                  onPressed: onPressed,
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: ColorManager.scaffoldBackgroundColor),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  static Widget DefultTextFormField({
    required String label,
    TextEditingController? textEditingController,
    Color? fillColor,
    Widget? prefixIcon,
    void Function()? onTap,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s18),
          hintText: label,
          labelText: label,
          fillColor: fillColor,
          prefixIcon: prefixIcon

          // errorText: _loginViewModel.isUserNameVaild.value
          //     ? null
          //     : AppStrings.usernameError.tr
          ),
    );
  }

  static Widget DefultTextButton(
      {required String text1,
      required String text2,
      void Function()? onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text2,
            style: TextStyle(
                color: ColorManager.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  static Widget TextTitle(
    context, {
    required String title,
    required String SubTitle,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontSize: AppSize.s28),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: AppSize.s18,
        ),
        Text(
          SubTitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: AppSize.s16,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: AppSize.s18,
        ),
      ],
    );
  }
}
