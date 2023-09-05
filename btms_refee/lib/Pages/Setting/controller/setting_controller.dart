import 'package:btms_refee/Services/GlobalStates/share_states.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  SharedStates shareState = Get.find();
  void logOut() {
    shareState.logout();
    shareState.bottomBarSelectedIndex.value = 0;
  }
}
