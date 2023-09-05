import 'package:btms_member/Pages/BirdInformationCheckin/controller/bird_information_checkin_controller.dart';
import 'package:get/get.dart';

class BirdInformationCheckinBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<BirdInformationCheckinController>(
        () => BirdInformationCheckinController());
  }
}
