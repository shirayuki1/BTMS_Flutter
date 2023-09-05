// import 'package:btms/Services/GlobalStates/share_states.dart';
import 'package:btms_member/Pages/BirdList/controller/bird_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  SharedStates shareState = Get.find();
  void logOut() {
    shareState.logout();
    shareState.bottomBarSelectedIndex.value = 0;
  }

  void nagivateToBirdList() {
    BirdController b = Get.find();
    b.getBirdList();
    Get.toNamed(Routes.listBird);
  }
}
