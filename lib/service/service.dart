import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_methods/model/login_model.dart';
import 'package:flutter_api_methods/widgets/loading_popup.dart';
import 'package:grock/grock.dart';

class Service {
  final String baseUrl = "YOUR_API_URL";
  final dio = Dio();

  Future<LoginModel?> loginCall(
      {required String username, required String password}) async {
    Map<String, dynamic> json = {"username": username, "password": password};

    try {
      var response = await dio.post(baseUrl + "user/" + "login", data: json);
      if (response.statusCode == 200) {
        var result = LoginModel.fromJson(response.data);
        return result;
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }
}
