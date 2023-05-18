// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app_intern/src/conifg/utils/commonWidgets.dart';
import 'package:social_app_intern/src/core/AppStates.dart';
import 'package:social_app_intern/src/presentation/pages/loginScreen.dart';
import 'package:social_app_intern/src/presentation/viewModel/authViewMOdel.dart';
import 'package:social_app_intern/src/presentation/viewModel/homeViewModel.dart';
import 'package:social_app_intern/src/presentation/widgets/home%20widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var homeViewModel = Get.put(HomeViewModel());
  var authViewModel = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 242, 242),
      body: Obx(() => homeViewModel.isLoading.value
          ? AppStates.loadingState()
          : homeContent(context, size)),
      bottomNavigationBar: HomeWidgets.homeBottomNavgitorWidget(),
    );
  }

  Widget homeContent(BuildContext context, Size size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeWidgets.upperHomeWidget(
              size: size,
              context: context,
              userModel: authViewModel.userModel,
              isfirsttime: authViewModel.isfirsttime.value),
          const SizedBox(
            height: 20,
          ),
          HomeWidgets.textSepratorWidget(context),
          SizedBox(
            height: 350,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => HomeWidgets.postWidget(
                    context, homeViewModel.postsModel!.posts[index]),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: homeViewModel.postsModel?.posts.length ?? 0),
          ),
          CommonWidgets.DefultButton(
            context,
            text: 'logout',
            onPressed: () {
              authViewModel.logout();
              Get.off(() => LoginScreen(), transition: Transition.leftToRight);
            },
          )
        ],
      ),
    );
  }
}
