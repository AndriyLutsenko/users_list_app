import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:users_list_app/constants/text_style.dart';

class ProgressDialog extends StatelessWidget {
  final String massege;
  const ProgressDialog({Key? key, required this.massege}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        margin: EdgeInsets.all(Get.width * 0.04),
        width: Get.width * 0.5,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Get.width * 0.01)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Get.width * 0.01, right: Get.width * 0.03),
              child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
            ),
            Text(
              massege,
              style: AppTextStyle.progressDialog,
            )
          ],
        ),
      ),
    );
  }
}
