import 'package:get/get.dart';

import 'package:users_list_app/home_screen/home_screen.dart';
import 'package:users_list_app/user_view_screen/user_view_screen.dart';

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreen>(() => const HomeScreen());
    Get.lazyPut<UserViewScreen>(() => const UserViewScreen());
  }
}
