import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextStyle {
  static TextStyle forNameOnCard = TextStyle(
    color: Colors.black87,
    fontSize: Get.width * 0.06,
    fontWeight: FontWeight.w800,
  );

  static TextStyle forEmailOnCard = TextStyle(
    color: Colors.white,
    fontSize: Get.width * 0.04,
    fontWeight: FontWeight.w500,
  );

  static TextStyle forEmailInCard = TextStyle(
    color: Colors.black45,
    fontSize: Get.width * 0.05,
    fontWeight: FontWeight.w400,
  );

  static TextStyle forNameInCard = TextStyle(
    color: Colors.black87,
    fontSize: Get.width * 0.08,
    fontWeight: FontWeight.w800,
  );

  static TextStyle forIdInCard = TextStyle(
    color: Colors.black45,
    fontSize: Get.width * 0.05,
    fontWeight: FontWeight.w600,
  );

  static TextStyle progressDialog =
      TextStyle(color: Colors.black, fontSize: Get.width * 0.05);
}
