import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:btms_member/Pages/BirdInformation/controller/bird_information_controller.dart';
import 'package:btms_member/Pages/BirdList/controller/bird_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:btms_member/Services/api/bird_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

import '../../../Models/bird.dart';

class UpdateBirdController extends GetxController {
  SharedStates st = Get.find();
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
  // void setGender(String gender) {
  //   birdGender.value = gender;
  // }

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

  void onInit() {
    super.onInit();

    getBirdInfo();
    // if (!initPage()) return;
    // if (id1 == null) return;
    // imagesId.value = int.parse(id1);
  }

  final bird1 = Bird().obs;
  Future<void> getBirdInfo() async {
    BirdInformationController b = Get.find();
    st.bird = b.bird.value;
    bird1.value = b.bird.value;
    print("id" + st.bird!.bird_Id.toString());
    // print("id type" + bird1.value.bird_type.toString());
    // st.birdId = bird1.value.bird_Id!;
  }

  Bird? bird;
  void updateBird(int birdId) async {
    try {
      BotToast.showLoading();
      bird = st.bird;
      if (birdName.value.isEmpty) {
        birdName.value = bird!.name!;
      }
      // if (birdGender.value.isEmpty) {
      //   birdGender.value = bird!.gender!;
      // }
      if (birdCharacter.value.isEmpty) {
        birdCharacter.value = bird!.identifyingCharacteristics!;
      }
      if (birdWeight.value.isEqual(0.0)) {
        birdWeight.value = bird!.weight!;
      }
      if (birdHeight.value.isEqual(0.0)) {
        birdHeight.value = bird!.height!;
      }
      if (birdColor.value.isEmpty) {
        birdColor.value = bird!.color!;
      }
      final data = {
        "bird_Id": st.bird!.bird_Id,
        "birdType_Id": st.bird!.bird_type,
        "name": birdName.value,
        // "gender": birdGender.value,
        "identifyingCharacteristics": birdCharacter.value,
        "weight": birdWeight.value,
        "height": birdHeight.value,
        "color": birdColor.value
      };
      print("test " + data.toString());
      bool result = false;
      Get.back();
      result = await birdService.update(
        birdId,
        data,
      );

      if (result) {
        BotToast.showText(
            text: "Cập nhật thành công !",
            textStyle: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            duration: const Duration(seconds: 5));
        BirdController m = Get.find();
        m.onInit();
        // BirdInformationController b = Get.find();
        Get.toNamed(Routes.listBird);
        // b.onInit();
      } else {
        BotToast.showText(
            text: "Không thể cập nhật hồ sơ chim khi chim đang thi đấu !",
            textStyle: TextStyle(
                fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
            duration: const Duration(seconds: 5));
      }
    } catch (e) {
      log("Lỗi: " + e.toString());
      BotToast.showText(text: "Cập nhật thất bại !!!");
    }
    BotToast.closeAllLoading();
  }
  // if(birdName.value.isEmpty) {
  //   birdName.value ==
  // }
}
