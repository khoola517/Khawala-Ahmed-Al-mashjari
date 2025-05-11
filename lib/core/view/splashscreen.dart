import 'dart:async';

import 'package:finallproject/core/view/LoginScreen.dart';
import 'package:finallproject/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.off(Login());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("images/logo.png",height: 137,width: 127,fit: BoxFit.fill,), // تأكد من إضافة الشعار في المجلد المناسب
      ),
    );
  }
}

