// ignore_for_file: must_be_immutable

part of 'models.dart';


class User {
  String username;
  String password;
  String token;

  User({required this.username, required this.password, required this.token});
}

class UserModel {
  List<User> users = [];
}