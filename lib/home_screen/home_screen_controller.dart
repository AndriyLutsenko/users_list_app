import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:users_list_app/SERVICES/users_repository.dart';
import 'package:users_list_app/home_screen/widgets/progress_dialog.dart';
import 'package:users_list_app/models/user.dart';

class HomeScreenController extends GetxController {
  int page = 1;
  int perPage = 5;
  int totalPages = 0;
  int totalUsers = 0;
  ScrollController scrollController = ScrollController();
  bool isAvailableGetRequest = true;
  List<User> listUsers = [];
  UsersRepository usersRepository = UsersRepository();

  @override
  void onInit() async {
    await getListUsers(page: page, perPage: perPage);
    scrollController.addListener(() async {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = 80;
      if (maxScroll - currentScroll <= delta &&
          isAvailableGetRequest &&
          listUsers.length < totalUsers) {
        isAvailableGetRequest = false;
        page++;
        await getListUsers(page: page, perPage: perPage);
        Future.delayed(const Duration(milliseconds: 800), () {
          isAvailableGetRequest = true;
        });
      }
    });
    super.onInit();
  }

  getListUsers({required int page, required int perPage}) async {
    List<User> listUsersFromRepositary =
        await usersRepository.getListUsers(page, perPage);
    listUsers.addAll(listUsersFromRepositary);
    update();
  }

  Future<void> onRefreshList() async {
    page = 1;
    List<User> listUsersFromRepositary =
        await usersRepository.getListUsers(page, perPage);
    listUsers.clear();
    listUsers.addAll(listUsersFromRepositary);
    update();
  }

  onTapCard(int id) async {
    Get.dialog(const ProgressDialog(massege: 'Please wait...'),
        barrierDismissible: false);
    User userInfo;
    try {
      userInfo = await usersRepository.getOneUser(id);
    } catch (e) {
      userInfo = listUsers.firstWhere((element) => element.id == id);
    }
    Get.back();
    Get.toNamed('/UserView', arguments: userInfo);
  }
}
