import 'dart:io';

import 'package:btms_refee/Models/prizes.dart';
import 'package:btms_refee/Models/tournament_detail.dart';
import 'package:btms_refee/Pages/Round/controller/round_controller.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:btms_refee/Services/GlobalStates/share_states.dart';
import 'package:btms_refee/Services/api/prizes_service.dart';
import 'package:btms_refee/Services/api/tournament_detail_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/io_client.dart';
import 'package:signalr_core/signalr_core.dart';

class TournamentDetailOngoingController extends GetxController {
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    String? id = Get.parameters['tournament_Id'];
    // String? id1 = Get.parameters['image_Id'];
    if (id == null) return;
    tournamentId.value = int.parse(id);
    getTournamentById();
    getPrizeList();
    realTime();
  }

  SharedStates st = Get.find();

  ITournamentDetailService tournamentService = Get.find();
  final tournament = TournamentDetails().obs;
  final tournamentId = 0.obs;

  Future<void> getTournamentById() async {
    print("========== ${tournamentId.value}");
    tournament.value = (await tournamentService.getById(tournamentId.value))!;
    print("infor" + tournament.toString());
  }

  IPrizesService prizeService = Get.find();
  final prizeList = <Prizes>[].obs;
  Future<void> getPrizeList() async {
    print("========== ${tournamentId.value}");
    prizeList.value = (await prizeService.getById(tournamentId.value))!;
    print("infor" + tournament.toString());
  }

  void goToRound() {
    RoundController r = Get.find();
    r.getRoundList();
    Get.toNamed(Routes.round);
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
    connection.on('ReceiveTournamentDetail', (message) {
      print("HELLO ");
      getTournamentById();
      getPrizeList();
    });
  }
}
