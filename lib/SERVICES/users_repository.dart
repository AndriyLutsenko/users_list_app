import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:users_list_app/SERVICES/user_api_services.dart';
import 'package:users_list_app/home_screen/home_screen_controller.dart';
import 'package:users_list_app/models/user.dart';

class UsersRepository {
  final UserApiServices userApiServices = UserApiServices();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  getListUsers(int page, int perPage) async {
    final SharedPreferences prefs = await _prefs;
    dynamic source;
    dynamic responseForSave;
    dynamic response;

    try {
      source = await userApiServices.getUsersList(page, perPage);
      responseForSave = json.decode(source);
      for (int i = 0; i < responseForSave["data"].length; i++) {
        String imageForSave =
            await funcForSaveImage(responseForSave["data"][i]["avatar"]);
        responseForSave["data"][i]["avatar"] = imageForSave;
      }
      debugPrint(responseForSave["data"].toString());
      var sourceForSave = json.encode(responseForSave);
      prefs.setString('page$page', sourceForSave);
    } catch (e) {
      source = prefs.getString('page$page');
    }

    List<User> listUsers = [];
    debugPrint(source.toString());
    HomeScreenController homeControler = Get.find();
    if (source != null) {
      response = json.decode(source);

      homeControler.page = response["page"];
      homeControler.totalUsers = response["total"];
      homeControler.totalPages = response["total_pages"];

      response["data"].forEach((user) {
        listUsers.add(User.fromMap(user));
      });
    } else {
      homeControler.totalUsers = homeControler.listUsers.length;
    }
    return listUsers;
  }

  funcForSaveImage(String url) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String base64Image = base64Encode(response.bodyBytes);
      return base64Image;
    }
  }

  getOneUser(int id) async {
    var source = await userApiServices.getOneUser(id);
    User usersInfo;
    debugPrint(source.toString());
    var response = json.decode(source);
    usersInfo = User.fromMap(response["data"]);
    return usersInfo;
  }
}
