import 'package:get/get.dart';

String? requiredValidator(String? val) {
  if (val == null || val.trim().isEmpty) return "8".tr;
  return null;
}
