import 'package:btms_refee/Pages/Login/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
