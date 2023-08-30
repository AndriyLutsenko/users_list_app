import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:users_list_app/home_screen/home_screen_controller.dart';
import 'package:users_list_app/home_screen/widgets/app_loading.dart';
import 'package:users_list_app/home_screen/widgets/user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (homeController) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black12,
            title: const Text('Users list'),
            centerTitle: false,
          ),
          body: RefreshIndicator(
            onRefresh: homeController.onRefreshList,
            child: homeController.listUsers.isNotEmpty
                ? ListView.builder(
                    controller: homeController.scrollController,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: homeController.listUsers.length + 1,
                    itemBuilder: (context, index) {
                      if (index < homeController.listUsers.length) {
                        return UserCard(
                          userInfo: homeController.listUsers[index],
                        );
                      } else {
                        return homeController.listUsers.length <
                                homeController.totalUsers
                            ? const AppLoadingLess()
                            : const SizedBox();
                      }
                    })
                : ListView(
                    padding: EdgeInsets.only(top: Get.height * 0.4),
                    children: const [
                        AppLoadingLess(),
                      ]),
          ),
        );
      },
    );
  }
}
