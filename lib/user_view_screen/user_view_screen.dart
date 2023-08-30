import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:users_list_app/constants/text_style.dart';
import 'package:users_list_app/user_view_screen/user_view_screen_controller.dart';

import '../models/user.dart';

class UserViewScreen extends StatelessWidget {
  final User? userInfo;
  const UserViewScreen({super.key, this.userInfo});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserViewScreenController>(
      init: UserViewScreenController(userInfo: Get.arguments),
      builder: (userViewController) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black45,
            title: Text(
              '${userViewController.userInfo.firstName} ${userViewController.userInfo.lastName}',
            ),
          ),
          body: Align(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: Get.width * 0.1),
                  child: userViewController.userInfo.avatarUrl
                              .substring(0, 4) ==
                          "http"
                      ? Image.network(
                          userViewController.userInfo.avatarUrl,
                          height: Get.height * 0.3,
                          errorBuilder: (context, error, stackTrace) =>
                              const Text('ERROR'),
                          loadingBuilder: (context, child, loadingProgress) =>
                              child,
                          fit: BoxFit.contain,
                        )
                      : Image.memory(
                          base64Decode(userViewController.userInfo.avatarUrl),
                          height: Get.height * 0.3,
                          fit: BoxFit.contain,
                        ),
                ),
                Text(
                  'ID: ${userViewController.userInfo.id} ',
                  style: AppTextStyle.forIdInCard,
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${userViewController.userInfo.firstName} ${userViewController.userInfo.lastName}',
                  style: AppTextStyle.forNameInCard,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'email: ${userViewController.userInfo.email}',
                    style: AppTextStyle.forEmailInCard,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
