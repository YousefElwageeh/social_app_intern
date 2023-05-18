import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app_intern/src/core/AppStates.dart';
import 'package:social_app_intern/src/core/sharedPrefrence/shared_prefrence.dart';
import 'package:social_app_intern/src/data/models/registerRequestMOdel.dart';
import 'package:social_app_intern/src/data/models/usermodel.dart';
import 'package:social_app_intern/src/data/repositories/RepoImplemnter.dart';
import 'package:social_app_intern/src/domain/repositories/repo.dart';
import 'package:social_app_intern/src/presentation/pages/home.dart';
import 'package:social_app_intern/src/presentation/pages/loginScreen.dart';

class AuthViewModel extends GetxController {
  RxBool isLoading = false.obs;

  final AppRepo _appRepo = ApprepoImplmenter();
  final PrefData _prefData = PrefData();
  GlobalKey<FormState> RegisterformKey = GlobalKey<FormState>();
  GlobalKey<FormState> LoginformKey = GlobalKey<FormState>();

  UserModel userModel = UserModel(
    email: '',
    name: '',
    phone: '',
    uId: '',
  );

  var loginemailController = TextEditingController();
  var loginPasswordController = TextEditingController();
  @override
  Future<void> onInit() async {
    await getUserAndStartPage();
    super.onInit();
  }

  void login() {
    RegisterRequest loginRequest = RegisterRequest(
        email: loginemailController.text,
        password: loginPasswordController.text);
    if (LoginformKey.currentState!.validate()) {
      isLoading.value = true;
      _appRepo.login(loginRequest).then((value) => value.fold((Faulier) {
            print(Faulier);
            AppStates.ErrorState(Faulier.toString());
            isLoading.value = false;
          }, (data) {
            isfirsttime.value = false;
            _prefData.setIsSignIn(true);
            _prefData.setToken(data.user!.uid);
            getUserData(data.user!.uid);
          }));
    }
  }

  void logout() {
    _appRepo.logout().then((value) => value.fold((Faulier) {
          print(Faulier);
        }, (data) {
          _prefData.setIsSignIn(false);
          _prefData.setToken('');
        }));
  }

  var registerEmailController = TextEditingController();
  var nameController = TextEditingController();
  var registerPasswordController = TextEditingController();
  var phoneController = TextEditingController();

  RxBool isfirsttime = false.obs;
  void register() {
    if (RegisterformKey.currentState!.validate()) {
      isLoading.value = true;

      RegisterRequest registerRequest = RegisterRequest(
          email: registerEmailController.text,
          password: registerPasswordController.text);
      _appRepo.register(registerRequest).then((value) => value.fold((Faulier) {
            isLoading.value = false;
            AppStates.ErrorState(Faulier.toString());
          }, (data) {
            userModel.email = registerEmailController.text;
            userModel.name = nameController.text;
            userModel.phone = phoneController.text;

            userModel.uId = data.user!.uid;
            uplodeImage();
            isfirsttime.value = true;
            print(data);
            isLoading.value = false;
            AppStates.SucessState('account made successfuly');
            Get.off(() => HomeScreen(), transition: Transition.leftToRight);
          }));
    }
  }

  void creatUser() {
    _appRepo.creatUser(userModel).then((value) => value.fold((Faulier) {
          print(Faulier);
        }, (data) {}));
  }

  void upddateUser(UserModel userModel) {
    _appRepo.updateUser(userModel).then((value) => value.fold((Faulier) {
          print(Faulier);
        }, (data) {}));
  }

  void uplodeImage() {
    print(userModel.profileImage);
    userModel.profileImage == null
        ? null
        : _appRepo
            .uplodeImage(File(userModel.profileImage!))
            .then((value) => value.fold((Faulier) {
                  print(Faulier);
                }, (data) {
                  userModel.profileImage = data;
                  creatUser();
                }));
  }

  Future<void> getProfileImage() async {
    // ignore: deprecated_member_use
    final ImagePicker picker = ImagePicker();

    var pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      userModel.profileImage = pickedFile.path;
      print(userModel.profileImage);
      print(pickedFile.path);
      update();
    } else {
      print('No image selected.');
    }
  }

  late Widget startWidget;
  Future<void> getUserAndStartPage() async {
    if (await _prefData.getIsSignIn()) {
      String token = await _prefData.getToken();
      print(token);
      _appRepo.getUser(token).then((value) => value.fold((faluier) {
            print(faluier);
            startWidget = LoginScreen();
          }, (data) {
            userModel = data;
            print('heyyyyyyyyyyyyyyyyyyyyyyyyyyy');
            print(userModel.name);
            startWidget = HomeScreen();
          }));
    } else {
      startWidget = LoginScreen();
    }
  }

  void getUserData(String uid) {
    print(uid);
    _appRepo.getUser(uid).then((value) => value.fold((Faulier) {
          print(Faulier);
          AppStates.ErrorState(Faulier.toString());
        }, (data) {
          userModel = data;
          isLoading.value = false;
          Get.off(() => HomeScreen(), transition: Transition.leftToRight);
          AppStates.SucessState('login  successfuly');
        }));
  }
}
