import 'package:flutter/material.dart';
import 'package:future_jobs_clone/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel newUser) {
    _user = newUser;
    notifyListeners();
  }
}
