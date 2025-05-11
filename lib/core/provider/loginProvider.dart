import 'dart:convert';
import 'package:finallproject/core/view/hompage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  static const String endpoint = "/api/login";
  static const String baseUrl = "http://175.10.30.16:8000/api/login";

  Future<void> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode({
          'username': username, 
          'password': password, 
        }),
      );

      print('Request body: ${jsonEncode({
            'username': username,
            'password': password
          })}');

      print('Response body: ${response.body}'); 

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];
        

        if (token != null) {
          print('Token: $token');
          print('Success: $data');
          Get.off(HomePage(),arguments: token);
          // print('true : ${response.statusCode}');
          // Get.toNamed("/HomePage");
        } 
        else {
          Get.snackbar('خطأ', 'فشل تسجيل الدخول: لا يوجد توكن TOKEN $token');
        }
      } else {
        print('Error: ${response.statusCode}');
        Get.snackbar('خطأ', 'فشل تسجيل الدخول: بيانات غير صحيحة');
      }
    } catch (e) {
      Get.snackbar('خطأ', 'حدث خطأ أثناء  ${e}');
      print(e);
      //print('Error type: ${e.runtimeType}');
      //print(e);
    } finally {
      
    }
  }
}

class LoginControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController password;

  @override
  void onInit() {
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  // void dispose() {
  //   username.dispose();
  //   password.dispose();
  //   super.dispose();
  // }

  void login() {
    var fromdata = formstate.currentState;
    if (fromdata!.validate()) {
       final authController = Get.find<AuthController>();
       authController.login(username.text, password.text);
    } 
    else {
      print("not valid");
    }
  }
}

