import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app_intern/src/data/models/postsmodel.dart';
import 'package:social_app_intern/src/data/models/registerRequestMOdel.dart';
import 'package:social_app_intern/src/data/models/usermodel.dart';
import 'package:social_app_intern/src/domain/repositories/repo.dart';

import '../datasources/remote_data_source.dart';

class ApprepoImplmenter extends AppRepo {
  RemoteDataSource remoteDataSource = RemoteDataSourceImplFB();

  @override
  Future<Either<Exception, UserCredential>> login(
      RegisterRequest loginRequest) async {
    try {
      UserCredential result = await remoteDataSource.login(loginRequest);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, void>> logout() async {
    try {
      void result = await remoteDataSource.logout();
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, UserCredential>> register(
      RegisterRequest registerRequest) async {
    try {
      UserCredential result = await remoteDataSource.register(registerRequest);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, PostsModel>> getPosts() async {
    try {
      PostsModel result = await remoteDataSource.getPosts();
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, String>> uplodeImage(File profileImage) async {
    try {
      var result = await remoteDataSource.uplodeImage(profileImage);

      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, void>> creatUser(UserModel userModel) async {
    try {
      void result = await remoteDataSource.creatUser(userModel);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, void>> updateUser(UserModel userModel) async {
    try {
      void result = await remoteDataSource.UpdateUser(userModel);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, UserModel>> getUser(String uid) async {
    try {
      var result = await remoteDataSource.getUser(uid);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
