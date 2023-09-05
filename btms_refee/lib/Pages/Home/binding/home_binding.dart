import 'package:get/get.dart';

import '../controller/homeController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
