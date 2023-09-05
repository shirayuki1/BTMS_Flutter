import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:btms_refee/Models/round.dart';
import 'package:btms_refee/Models/score_criteria.dart';
import 'package:btms_refee/Models/score_type.dart';
import 'package:btms_refee/Pages/RoundResult/controller/round_result_controller.dart';
import 'package:btms_refee/Pages/RoundResultEnd/controller/round_result_end_controller.dart';
import 'package:btms_refee/Pages/TournamentDetail_Ongoing/controller/tournament_detail_ongoing_controller.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:btms_refee/Services/GlobalStates/share_states.dart';
import 'package:btms_refee/Services/api/round_service.dart';
import 'package:btms_refee/Services/api/score_type_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:http/io_client.dart';

class RoundController extends GetxController {
  SharedStates states = Get.find();
  final ScrollController scrollController = ScrollController();
  final showSlider = true.obs;

  @override
  void onInit() {
    super.onInit();
    if (!initPage()) return;
    initPage();
    getRoundList();
    realTime();
  }

  final roundId = 0.obs;
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
  IRoundService roundService = Get.find();
  final roundList = <Round>[].obs;
  Future<void> getRoundList() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    roundList.value = (await roundService.getById(st.tournamentId))!;
    // states.birdLists = birdList.value;
    // listEvents.value = await eventService.getEvents();
    print("round=== ${roundList.string}");
    for (var element in roundList) {
      print("id..." + element.toString());
    }
    // RoundController t = Get.find();
    // t.onInit();
  }

  Future<void> goRoundResult(int? id, int? id2) async {
    print("id" + id.toString());
    if (id != null) {
      states.roundNumber = id2!.toInt();
      // states.roundId = id;
      Get.toNamed(Routes.roundResult, parameters: {"round_Id": id.toString()});
      checkLastRound(id);
      RoundResultController t = Get.find();
      t.onInit();
      RoundController t2 = Get.find();
      t2.onInit();
    }
  }

//Round Result End
  Future<void> goRoundResult2(int? id, int? id2) async {
    print("id" + id.toString());
    if (id != null) {
      states.roundNumber = id2!.toInt();
      // states.roundId = id;
      Get.toNamed(Routes.roundResultEnd,
          parameters: {"round_Id": id.toString()});
      checkLastRound(id);
      RoundResultEndController t = Get.find();
      t.onInit();
      RoundController t2 = Get.find();
      t2.onInit();
    }
  }

  String? updateStatus(String status) {
    String newStatus = status;
    if (status == "NONE") {
      return newStatus = "Chưa bắt đầu";
    } else if (status == "START") {
      return newStatus = "Đã bắt đầu";
    } else if (status == "null") {
      return newStatus = "Vòng đấu đang lỗi";
    } else if (status == "END") {
      return newStatus = "Đã kết thúc";
    }
  }

  bool isLastRound = false;

  void checkLastRound(int roundId) {
    for (var element in roundList) {
      if (element.round_Id == roundId) {
        if (element.isLastRound == true) {
          isLastRound = true;
        } else {
          isLastRound = false;
        }
      }
    }

    states.isEva = isLastRound;
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
    connection.on('ReceiveRounds', (message) {
      print("HELLO ");
      getRoundList();
    });
// message
    // await connection.invoke('ReceiveRounds', args: ['Bob', 'Says hi!']);
  }
}
