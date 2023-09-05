import 'package:get/get.dart';
import '../controller/forgotPassController.dart';

class ForgotPassBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<ForgotPassController>(() => ForgotPassController());
  }
}
