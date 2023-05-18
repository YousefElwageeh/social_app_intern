import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app_intern/src/conifg/utils/commonWidgets.dart';
import 'package:social_app_intern/src/presentation/viewModel/homeViewModel.dart';
import 'package:social_app_intern/src/presentation/widgets/home%20widgets.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  var homeViewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CommonWidgets.DefultTextFormField(
                label: 'search',
                textEditingController: homeViewModel.searchtextfield,
                onChanged: (p0) {
                  homeViewModel.searchInPosts();
                },
              ),
              Obx(
                () => homeViewModel.change.value
                    ? Expanded(
                        child: ListView.builder(
                            itemBuilder: (context, index) =>
                                HomeWidgets.postWidget(
                                    context,
                                    homeViewModel.searchedposts!
                                        .elementAt(index)),
                            itemCount:
                                homeViewModel.searchedposts?.length ?? 0),
                      )
                    : const Text('no result'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
