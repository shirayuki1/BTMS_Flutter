import 'dart:io';
import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:btms_refee/Models/round_result.dart';
import 'package:btms_refee/Models/score_criteria.dart';
import 'package:btms_refee/Models/score_type.dart';
import 'package:btms_refee/Pages/Round/controller/round_controller.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:btms_refee/Services/GlobalStates/share_states.dart';
import 'package:btms_refee/Services/api/round_result_service.dart';
import 'package:btms_refee/Services/api/score_type_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:http/io_client.dart';

class RoundResultHistoryController extends GetxController {
  SharedStates states = Get.find();
  final ScrollController scrollController = ScrollController();
  final showSlider = true.obs;

  @override
  void onInit() {
    super.onInit();
    if (!initPage()) return;
    initPage();
    String? id = Get.parameters['round_Id'];
    // String? id1 = Get.parameters['image_Id'];
    if (id == null) return;
    roundId.value = int.parse(id);
    states.roundId = roundId.value;
    getRoundResultList();
    // getScoreTypeList();
    realTime();
  }

  final roundId = 0.obs;
  final roundResult_Id = 0.obs;
  var isWarn = false;

  bool initPage() {
    scrollController.addListener(() {
      final fromTop = scrollController.position.pixels;
      if (fromTop > 10) {
        showSlider.value = false;
      } else if (fromTop == 0) {
        showSlider.value = true;
      }
    });
    return true;
  }

  @override
  void onClose() {
    super.onClose();
    //closeShopping();
  }

  SharedStates st = Get.find();
  //Load Data Round
  IRoundResultService roundResultService = Get.find();
  final roundResultList = <RoundResult>[].obs;
  Future<void> getRoundResultList() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    print("123" + roundId.value.toString());
    roundResultList.value = (await roundResultService.getById(roundId.value))!;

    // states.birdLists = birdList.value;
    // listEvents.value = await eventService.getEvents();
    print("roundResult=== ${roundResultList.string}");
    for (var element in roundResultList) {
      print("id..." + element.toString());
    }
  }

  // //Load data of Bird list
  // IScoreTypeService scoreTypeService = Get.find();
  // final scoreTypeList = <ScoreType>[].obs;
  // final scoreCriteriaList = <ScoreCriteria>[].obs;
  // Future<void> getScoreTypeList() async {
  //   //final events = await eventService.getEvents();
  //   //listEvents.value = events.data ?? [];
  //   scoreTypeList.value =
  //       (await scoreTypeService.getAllScoreType(roundId.value))!;
  //   // states.birdLists = birdList.value;
  //   // listEvents.value = await eventService.getEvents();
  //   print("scoretype=== ${scoreTypeList.string}");
  // }

  Future<void> getRoundResultId(int? id) async {
    print("id round result" + id.toString());
    states.roundResultId = id!.toInt();
  }

  // getBirdList();
  String? updateStatus1(String status) {
    String newStatus = status;
    if (status == "null") {
      return newStatus = "Chưa có kết quả";
    } else if (status == "false") {
      return newStatus = "Bị loại";
    } else if (status == "true") {
      return newStatus = "Đi tiếp";
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
    connection.on('ReceiveEvaluate', (message) {
      print("HELLO ");
      getRoundResultList();
    });
  }
}
