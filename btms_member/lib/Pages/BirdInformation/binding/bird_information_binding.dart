// import 'package:btms/Pages/BirdInformation/controller/bird_information_controller.dart';
import 'package:btms_member/Pages/BirdInformation/controller/bird_information_controller.dart';
import 'package:btms_member/Pages/BirdList/controller/bird_controller.dart';
import 'package:get/get.dart';

class BirdInformationBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<BirdInformationController>(() => BirdInformationController());
  }
}
