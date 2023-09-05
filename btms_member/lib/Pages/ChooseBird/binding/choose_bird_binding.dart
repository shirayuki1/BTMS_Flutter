// import 'package:btms/Pages/ChooseBird/controller/choose_bird_controller.dart';
import 'package:btms_member/Pages/ChooseBird/controller/choose_bird_controller.dart';
import 'package:get/get.dart';

class ChooseBirdBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<ChooseBirdController>(() => ChooseBirdController());
  }
}
