import 'package:btms_member/Models/images.dart';

import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:btms_member/Services/api/bird_service.dart';
import 'package:btms_member/Services/api/images_bird_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Models/bird.dart';

class BirdInformationCheckinController extends GetxController {
  final ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    String? id = Get.parameters['bird_Id'];
    // String? id1 = Get.parameters['image_Id'];
    if (id == null) return;
    birdId.value = int.parse(id);
    getBirdById();
    // if (!initPage()) return;
    // if (id1 == null) return;
    // imagesId.value = int.parse(id1);
    getImageList();
  }

  IBirdService birdService = Get.find();
  var bird = Bird().obs;
  final birdId = 0.obs;
  SharedStates st = Get.find();

  Future<void> getBirdById() async {
    print("========== ${birdId.value}");

    bird.value = (await birdService.getById(birdId.value))!;
    print("sau khi update: " + bird.value.toString());
    st.birdId = birdId.value;
  }

//load data
  final birdList = <Bird>[].obs;
  Future<void> getBirdList() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    birdList.value = (await birdService.getAllBird())!;
    // listEvents.value = await eventService.getEvents();

    print("Bird=== ${birdList.string}");
  }
  // final image = Images().obs;
  // final imagesId = 0.obs;
  // Future<void> getImageById() async {
  //   print("========== " + imagesId.value.toString());

  //   image.value = (await imagesService.getById(imagesId.value))!;
  // }

  IImagesService imgService = Get.find();
  final imgList = <Images>[].obs;
  Future<void> getImageList() async {
    print("bird id" + st.birdId.toString());
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    imgList.value = (await imgService.getAllById(st.birdId))!;
    // listEvents.value = await eventService.getEvents();

    print("image=== ${imgList.string}");
  }

  @override
  void onClose() {
    super.onClose();
    //closeShopping();
  }
}
