import 'package:flutter/material.dart';
import 'package:get/get.dart';

class mylocalcontroller extends GetxController{
  void changlang(String codelang){
    //متغير نمرر له براميتر
    Locale locale=Locale(codelang);
    //كود  تحديث
    Get.updateLocale(locale);
  }
}