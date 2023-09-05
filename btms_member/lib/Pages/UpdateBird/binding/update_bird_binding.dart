// import 'package:btms/Pages/UpdateBird/controller/update_bird_controller.dart';
import 'package:btms_member/Pages/UpdateBird/controller/update_bird_controller.dart';
import 'package:get/get.dart';

class UpdateBirdBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<UpdateBirdController>(() => UpdateBirdController());
  }
}
