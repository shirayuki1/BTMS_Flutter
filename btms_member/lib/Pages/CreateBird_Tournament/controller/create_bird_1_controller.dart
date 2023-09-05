import 'package:bot_toast/bot_toast.dart';
import 'package:btms_member/Pages/BirdList/controller/bird_controller.dart';
import 'package:btms_member/Pages/ChooseBird/controller/choose_bird_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/api/bird_service.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

class CreateBird1Controller extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  IBirdService birdService = Get.find();

  // name
  final birdName = "".obs;

  // set name
  void setName(String name) {
    birdName.value = name;
  }

  // gender
  final birdGender = "".obs;

  // set gender
  void setGender(String gender) {
    birdGender.value = gender;
  }

  // character
  final birdCharacter = "".obs;

  // set character
  void setCharacter(String character) {
    birdCharacter.value = character;
  }

  // weight
  final birdWeight = 0.0.obs;

  // set character
  void setWeight(String weight) {
    birdWeight.value = weight.toDouble()!;
  }

  // height
  final birdHeight = 0.0.obs;

  // set height
  void setHeight(String height) {
    birdHeight.value = height.toDouble()!;
  }

  // color
  final birdColor = "".obs;

  // set height
  void setColor(String color) {
    birdColor.value = color;
  }

  void createBird1() async {
    BotToast.showLoading();
    if (birdName.isEmpty ||
        birdGender.isEmpty ||
        birdCharacter.isEmpty ||
        birdWeight.value.isEqual(0.0) ||
        birdHeight.value.isEqual(0.0) ||
        birdColor.isEmpty) {
      BotToast.showText(text: "Vui lòng điền tất cả các field.");
    } else {
      if (birdWeight.value < 0.0 || birdHeight.value < 0.0) {
        BotToast.showText(text: "Cân nặng và chiều cao phải là số dương.");
      } else {
        final data = {
          "birdType_Id": 1,
          "name": birdName.value,
          "gender": birdGender.value,
          "identifyingCharacteristics": birdCharacter.value,
          "weight": birdWeight.value,
          "height": birdHeight.value,
          "color": birdColor.value,
        };
        final result = await birdService.createBird(data);
        if (result) {
          BotToast.showText(text: "Tạo thành công.");
          Get.toNamed(Routes.homeScreen);
          // BirdController b = Get.find();
          // b.onInit();
          ChooseBirdController c = Get.find();
          c.getBirdList();
        } else {
          BotToast.showText(text: "Tên chim này đã tồn tại!!!.");
        }
      }
    }
    BotToast.closeAllLoading();
  }

  @override
  void onClose() {
    super.onClose();
    //closeShopping();
  }
}
