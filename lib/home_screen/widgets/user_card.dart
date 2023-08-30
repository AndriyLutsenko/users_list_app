import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:users_list_app/constants/text_style.dart';
import 'package:users_list_app/home_screen/home_screen_controller.dart';
import 'package:users_list_app/models/user.dart';

class UserCard extends StatelessWidget {
  final User userInfo;
  const UserCard({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<HomeScreenController>().onTapCard(userInfo.id);
      },
      child: Card(
        color: Colors.black12,
        child: Padding(
          padding: EdgeInsets.all(Get.width * 0.03),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * 0.3,
                height: Get.width * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: userInfo.avatarUrl.substring(0, 4) == "http"
                          ? Image.network(
                              userInfo.avatarUrl,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Text('ERROR'),
                              loadingBuilder:
                                  (context, child, loadingProgress) => child,
                              fit: BoxFit.contain,
                            )
                          : Image.memory(
                              base64Decode(userInfo.avatarUrl),
                              fit: BoxFit.contain,
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: Get.width * 0.06),
              SizedBox(
                width: Get.width * 0.55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${userInfo.firstName} ${userInfo.lastName}',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.forNameOnCard,
                    ),
                    const SizedBox(height: 20),
                    Text(userInfo.email,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.forEmailOnCard),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
