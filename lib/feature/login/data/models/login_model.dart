import 'package:e_store/feature/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    this.message, required super.user, required super.token,

  });

  LoginModel.fromJson(dynamic json) :this(
    token: json['token'],
    user : User.fromJson(json['user']),
    message : json['message'],
  );

  /// 1:5:00
  String? message;

}

class User extends UserEntity {
  User({
    this.role,
    required String name,
    required String email,
  }) : super(name: name, email: email);

  User.fromJson(dynamic json)
      : this(
    role: json['role'],
    name: json['name'],
    email: json['email'],
  );

  String? role;
}
