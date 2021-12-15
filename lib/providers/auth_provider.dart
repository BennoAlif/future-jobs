import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future_jobs_clone/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthProfider extends ChangeNotifier {
  Future<UserModel?> register(
    String email,
    String password,
    String name,
    String goal,
  ) async {
    try {
      var body = {
        'email': email,
        'password': password,
        'name': name,
        'goal': goal,
      };

      var response = await http.post(
        Uri.parse('https://bwa-jobs.herokuapp.com/register'),
        body: body,
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<UserModel?> login(String email, String password) async {
    try {
      var body = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse("https://bwa-jobs.herokuapp.com/login"),
        body: body,
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
