import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:users_list_app/SERVICES/sample_bindings.dart';
import 'package:users_list_app/home_screen/home_screen.dart';
import 'package:users_list_app/user_view_screen/user_view_screen.dart';

class UsersListApp extends StatelessWidget {
  const UsersListApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/Home',
      getPages: [
        GetPage(
            name: '/Home',
            page: () => const HomeScreen(),
            binding: SampleBind()),
        GetPage(
            name: '/UserView',
            page: () => const UserViewScreen(),
            binding: SampleBind()),
      ],
    );
  }
}
