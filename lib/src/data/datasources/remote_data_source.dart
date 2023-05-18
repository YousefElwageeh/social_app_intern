// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:social_app_intern/src/data/models/postsmodel.dart';
import 'package:social_app_intern/src/data/models/registerRequestMOdel.dart';
import 'package:social_app_intern/src/data/models/usermodel.dart';

abstract class RemoteDataSource {
  Future<UserCredential> login(RegisterRequest loginRequest);
  Future<void> logout();

  Future<UserCredential> register(RegisterRequest registerRequest);

  Future<void> creatUser(UserModel userModel);

  Future<void> UpdateUser(UserModel userModel);

  Future<PostsModel> getPosts();
  Future<String> uplodeImage(File profileImage);
  Future<UserModel> getUser(String Uid);
}

class RemoteDataSourceImplFB implements RemoteDataSource {
  @override
  Future<UserCredential> login(RegisterRequest loginRequest) async {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginRequest.email, password: loginRequest.password);
  }

  @override
  Future<void> logout() {
    return FirebaseAuth.instance.signOut();
  }

  @override
  Future<UserCredential> register(RegisterRequest registerRequest) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerRequest.email, password: registerRequest.password);
  }

  @override
  Future<PostsModel> getPosts() async {
    var result = await FirebaseFirestore.instance.collection('posts').get();

    PostsModel model = PostsModel(posts: []);
    for (var element in result.docs) {
      model.posts.add(Post.fromMap(element.data()));
    }
    return model;
  }

  @override
  Future<String> uplodeImage(File profileImage) async {
    var result = FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage);

    return result.snapshot.ref.getDownloadURL();
  }

  @override
  Future<void> UpdateUser(UserModel userModel) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(userModel.toMap());
  }

  @override
  Future<void> creatUser(UserModel userModel) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .set(userModel.toMap());
  }

  @override
  Future<UserModel> getUser(String Uid) async {
    var result =
        await FirebaseFirestore.instance.collection('users').doc(Uid).get();
    return UserModel.fromMap(result.data()!);
  }
}
