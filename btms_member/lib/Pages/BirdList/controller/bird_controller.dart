// import 'package:btms/Models/bird.dart';
// import 'package:btms/Routes/routes.dart';
// import 'package:btms/Services/GlobalStates/share_states.dart';
// import 'package:btms/Services/api/bird_service.dart';
import 'dart:io';

import 'package:btms_member/Pages/BirdInformation/controller/bird_information_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:btms_member/Services/api/bird_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signalr_core/signalr_core.dart';

import 'package:http/io_client.dart';
import '../../../Models/bird.dart';

class BirdController extends GetxController {
  SharedStates states = Get.find();
  final ScrollController scrollController = ScrollController();
  final showSlider = true.obs;

  List birdListSelected = [];

  @override
  void onInit() {
    super.onInit();
    // super.onInit();
    if (!initPage()) return;
    initPage();
    getBirdList();
    realTime();
  }

  // final birdId = 0.obs;
  bool initPage() {
    scrollController.addListener(() {
      final fromTop = scrollController.position.pixels;
      if (fromTop > 10) {
        showSlider.value = false;
      } else if (fromTop == 0) {
        showSlider.value = true;
      }
    });
    //eventName.value = states.events.value.eventName!;
    return true;
  }

  @override
  void onClose() {
    super.onClose();
    //closeShopping();
  }

  //Load data of Bird list
  IBirdService birdService = Get.find();
  final birdList = <Bird>[].obs;
  Future<void> getBirdList() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    birdList.value = (await birdService.getAllBird())!;
    // states.birdLists = birdList.value;
    // listEvents.value = await eventService.getEvents();
    print("Bird=== ${birdList.string}");
    for (var element in birdList) {
      print("id..." + element.toString());
    }
    states.birdList1.value = birdList.value;
    BirdInformationController t = Get.find();
    t.onInit();
  }

  Future<void> goToDetail(int? id) async {
    print("id round" + id.toString());
    if (id != null) {
      Get.toNamed(Routes.birdInfo, parameters: {"bird_Id": id.toString()});
      BirdInformationController t = Get.find();
      t.onInit();
    }
  }

  String? updateGender(String gender) {
    String newGender = gender;
    if (gender == "FEMALE") {
      return newGender = "Cái";
    } else if (gender == "MALE") {
      return newGender = "Đực";
    } else if (gender == "null") {
      return newGender = "Không có giới tính";
    }
  }

  Future<void> realTime() async {
    final connection = HubConnectionBuilder()
        .withUrl(
            'https://bird-tournament-service.azurewebsites.net/hubs/refreshListHub',
            HttpConnectionOptions(
              client: IOClient(
                  HttpClient()..badCertificateCallback = (x, y, z) => true),
              logging: (level, message) => print(message),
            ))
        .build();

    await connection.start();
    // print("HELLLOLOOOOOOOO");
    connection.on('ReceiveBird', (message) {
      print("HELLO ");
      getBirdList();
    });
  }
}
