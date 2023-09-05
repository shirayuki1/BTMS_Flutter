// import 'package:btms/Pages/EditProfile/controller/edit_profile_controller.dart';
import 'package:btms_member/Pages/EditProfile/controller/edit_profile_controller.dart';
import 'package:get/get.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<EditProfileController>(() => EditProfileController());
  }
}
