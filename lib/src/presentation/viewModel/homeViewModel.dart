import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app_intern/src/data/models/postsmodel.dart';
import 'package:social_app_intern/src/data/repositories/RepoImplemnter.dart';
import 'package:social_app_intern/src/domain/repositories/repo.dart';

class HomeViewModel extends GetxController {
  final AppRepo _appRepo = ApprepoImplmenter();
  RxBool isLoading = true.obs;
  var searchtextfield = TextEditingController();

  @override
  void onInit() {
    getPosts();
    super.onInit();
  }

  PostsModel? postsModel;

  void getPosts() {
    _appRepo.getPosts().then((value) => value.fold((Faulier) {
          print(Faulier);
          isLoading = false.obs;
        }, (data) {
          postsModel = data;
          isLoading = false.obs;
        }));
  }

  Iterable<Post>? searchedposts;
  RxBool change = false.obs;
  void searchInPosts() {
    change.value = false;
    searchedposts = postsModel!.posts
        .where((element) => element.text.contains(searchtextfield.text));
    change.value = true;
    print(searchedposts?.length);
    update();
  }
}
