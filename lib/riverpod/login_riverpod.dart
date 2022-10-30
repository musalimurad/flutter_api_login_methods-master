import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_methods/service/service.dart';
import 'package:flutter_api_methods/views/home.dart';
import 'package:flutter_api_methods/views/login.dart';
import 'package:flutter_api_methods/widgets/loading_popup.dart';
import 'package:grock/grock.dart';

class LoginRiverpod extends ChangeNotifier {
  Service service = Service();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = true;
  void fetch() {
    try {
      loadingPopup();

      service
          .loginCall(username: username.text, password: password.text)
          .then((value) {
        if (value != null) {
          Grock.back();
          Grock.toRemove(Home());
        } else {
          Grock.back();
          Grock.snackBar(
              position: SnackbarPosition.bottom,
              blur: 2000,
              titleColor: Colors.white,
              descriptionColor: Colors.white,
              color: Colors.red,
              titleStyle: TextStyle(color: Colors.white),
              descriptionStyle: TextStyle(color: Colors.white),
              title: "Xəta",
              description: value?.message.toString() ??
                  "istifadəçi adı və ya şifrə yanlışdır!");
        }
      });
    } on DioError catch (e) {
      Grock.back();
      Grock.snackBar(title: "Xəta", description: "Xəta baş verdi!");
    }
  }
}
