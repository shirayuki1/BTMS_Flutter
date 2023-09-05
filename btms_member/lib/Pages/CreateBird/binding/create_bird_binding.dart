// import 'package:btms/Pages/CreateBird/controller/create_bird_controller.dart';
import 'package:btms_member/Pages/CreateBird/controller/create_bird_controller.dart';
import 'package:get/get.dart';

class CreateBirdBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<CreateBirdController>(() => CreateBirdController());
  }
}
