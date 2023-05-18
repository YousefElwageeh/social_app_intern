import 'dart:convert';

class UserModel {
  String name;
  String email;
  String phone;
  String uId;

  String? profileImage;

  UserModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.uId,
    this.profileImage,

    // this.isEmailVerified,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'phone': phone});
    result.addAll({'uId': uId});
    if (profileImage != null) {
      result.addAll({'profileImage': profileImage});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      uId: map['uId'] ?? '',
      profileImage: map['profileImage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
