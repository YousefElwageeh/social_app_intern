import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app_intern/src/conifg/theme/colorManger.dart';
import 'package:social_app_intern/src/conifg/utils/AppStrings.dart';
import 'package:social_app_intern/src/conifg/utils/commonWidgets.dart';
import 'package:social_app_intern/src/data/models/postsmodel.dart';
import 'package:social_app_intern/src/data/models/usermodel.dart';
import 'package:social_app_intern/src/presentation/pages/search%20screen.dart';

import '../../conifg/theme/hexcolor.dart';

class HomeWidgets {
  static Widget upperHomeWidget({
    required Size size,
    required BuildContext context,
    required UserModel userModel,
    required bool isfirsttime,
  }) {
    var personimage =
        'https://icons-for-free.com/iconfiles/png/512/person-1324760545186718018.png';
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: size.height * .36,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: ColorManager.primaryColor),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      Spacer(),
                      Icon(
                        Icons.category_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: isfirsttime
                              ? DecorationImage(
                                  image: FileImage(
                                      File(userModel.profileImage ?? '')))
                              : DecorationImage(
                                  image: NetworkImage(
                                      userModel.profileImage ?? personimage)),
                          color: Colors.amber[800],
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(25),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 7,
                    )
                  ],
                ),
                Text(
                  'welcom back,',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: HexColor('#B9AAFA'), fontSize: 20),
                ),
                Text(
                  userModel.name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorManager.scaffoldBackgroundColor,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 80,
              width: size.width * 0.8,
              child: CommonWidgets.DefultTextFormField(
                  onTap: () => Get.to(() => SearchScreen(),
                      transition: Transition.leftToRight),
                  label: AppStrings.Search,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ],
    );
  }

  static Widget textSepratorWidget(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            'Latest news',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              'see all',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: HexColor('#95959D')),
            ),
          ),
        ],
      ),
    );
  }

  static Widget postWidget(context, Post post) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(post.content), fit: BoxFit.contain),
              )),
          Text(
            post.text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              // ignore: deprecated_member_use
              Text(
                post.author,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'May 23, 2022',
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          )
        ]),
      ),
    );
  }

  static Widget homeBottomNavgitorWidget() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      ),
      child: SizedBox(
        height: 70,
        child: BottomNavigationBar(iconSize: 30, items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_outlined,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.schedule_outlined,
              ),
              label: ''),
        ]),
      ),
    );
  }
}
