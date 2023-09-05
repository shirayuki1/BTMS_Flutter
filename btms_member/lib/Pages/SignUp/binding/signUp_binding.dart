// import 'package:btms/Pages/SignUp/controller/signUpController.dart';
import 'package:btms_member/Pages/SignUp/controller/signUpController.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
