import 'package:auth_laravel/controllers/uiControllers/home_screen_uiController.dart';
import 'package:get/get.dart';

class HomeScreenUiBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenUiController>(() => HomeScreenUiController());
  }
}
