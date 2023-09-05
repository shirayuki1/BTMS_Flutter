import 'package:bot_toast/bot_toast.dart';
import 'package:btms_member/Routes/routes.dart';
// import 'package:btms/Routes/routes.dart';
// import 'package:btms/Services/api/user_service.dart';
import 'package:btms_member/Services/api/user_service.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final IUserService _userService = Get.find();
  final fullname = "".obs;
  final phone = "".obs;
  final email = "".obs;
  final pass = "".obs;
  final confirmPass = "".obs;

  void registerUsers() async {
    BotToast.showLoading();
    if (email.isEmpty ||
        pass.isEmpty ||
        fullname.isEmpty ||
        phone.isEmpty ||
        confirmPass.isEmpty) {
      BotToast.showText(text: "Vui lòng điền đầy đủ thông tin.");
    } else {
      if (confirmPass.value == pass.value) {
        final data = {
          "fullName": fullname.value,
          "phone": phone.value,
          "email": email.value,
          "password": pass.value,
          "emailVertify": true,
          "phoneVertify": true,
        };
        final result = await _userService.registerUser(data);
        if (result != null) {
          BotToast.showText(text: "Đăng kí thành công.");
          Get.toNamed(Routes.login);
        }
      } else {
        BotToast.showText(
            text: "Confirm password với password không trùng khớp!");
      }
    }
    BotToast.closeAllLoading();
  }
}
