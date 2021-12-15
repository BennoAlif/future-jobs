import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future_jobs_clone/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  Future<List<CategoryModel>> getCategories() async {
    try {
      var response = await http.get(
        Uri.parse("https://bwa-jobs.herokuapp.com/categories"),
      );

      if (response.statusCode == 200) {
        List<CategoryModel> categories = [];
        List parsedJson = jsonDecode(response.body);

        for (var category in parsedJson) {
          categories.add(CategoryModel.fromJson(category));
        }

        return categories;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
