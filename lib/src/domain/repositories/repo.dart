import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app_intern/src/data/models/postsmodel.dart';
import 'package:social_app_intern/src/data/models/registerRequestMOdel.dart';
import 'package:social_app_intern/src/data/models/usermodel.dart';

abstract class AppRepo {
  Future<Either<Exception, UserCredential>> login(RegisterRequest loginRequest);

  Future<Either<Exception, UserCredential>> register(
      RegisterRequest registerRequest);
  Future<Either<Exception, void>> logout();
  Future<Either<Exception, void>> creatUser(UserModel userModel);
  Future<Either<Exception, void>> updateUser(UserModel userModel);
  Future<Either<Exception, String>> uplodeImage(File profileImage);
  Future<Either<Exception, PostsModel>> getPosts();
  Future<Either<Exception, UserModel>> getUser(String uid);
}
