import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:users_list_app/constants/constants.dart';

class UserApiServices {
  Future getUsersList(int page, int perPage) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: apiHost,
        path: 'api/users',
        queryParameters: {
          'page': page.toString(),
          'per_page': perPage.toString(),
        });
    try {
      http.Response response = await http.get(uri);
      return response.body;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future getOneUser(int id) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: apiHost,
      path: 'api/users/$id',
    );
    try {
      http.Response response = await http.get(uri);
      return response.body;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
