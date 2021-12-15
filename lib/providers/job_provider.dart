import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future_jobs_clone/models/job_model.dart';
import 'package:http/http.dart' as http;

class JobProvider extends ChangeNotifier {
  Future<List<JobModel>> getJobs() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://bwa-jobs.herokuapp.com/jobs",
        ),
      );

      if (response.statusCode == 200) {
        List<JobModel> jobs = [];
        List parsedJson = jsonDecode(response.body);

        for (var job in parsedJson) {
          jobs.add(JobModel.fromJson(job));
        }

        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<JobModel>> getJobsByCategory(String category) async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://bwa-jobs.herokuapp.com/jobs?category=$category",
        ),
      );

      if (response.statusCode == 200) {
        List<JobModel> jobs = [];
        List parsedJson = jsonDecode(response.body);

        for (var job in parsedJson) {
          jobs.add(JobModel.fromJson(job));
        }

        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
