import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:btms_refee/Models/prizes.dart';
import 'package:btms_refee/Models/tournament_detail.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:btms_refee/Services/GlobalStates/share_states.dart';
import 'package:btms_refee/Services/api/bird_service.dart';
import 'package:btms_refee/Services/api/prizes_service.dart';
import 'package:btms_refee/Services/api/tournament_detail_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../../Data/selected_bird.dart';
import '../../../Models/bird.dart';
import 'package:http/io_client.dart';

class TournamentDetailIncomingController extends GetxController {
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
  var tournament = TournamentDetails().obs;
  final tournamentId = 0.obs;

  Future<void> getTournamentById() async {
    print("========== ${tournamentId.value}");

    tournament.value = (await tournamentService.getById(tournamentId.value))!;
    print("infor" + tournament.toString());
    st.tournamentId = tournamentId.value;
  }

  void navigate() {
    // Get.toNamed(Routes.chooseBird);
    // ChooseBirdController t = Get.find();
    // t.onInit();
  }

  final birdList1 = <Bird>[].obs;
  // final birdListSelected = <SelectedBird>[].obs;
  List birdListSelected = [];
  List<Map<String, int>> birdIdList = [];
  // SharedStates st = Get.find();
  // final bird = SelectedBird().obs;
  List<bool> selected = List.generate(50, (i) => false).obs;

  // void loadData() {
  //   print("test " + birdList1.length.toString());
  //   List.generate(
  //       birdList1.length,
  //       (index) => birdListSelected.add(SelectedBird(
  //           bird_id: birdList1[index].bird_Id,
  //           name: birdList1[index].name,
  //           isSelected: false.obs)));
  //   print("test " + birdListSelected.toString());
  //   print("test " + birdList1.length.toString());
  // }

  //Load Data
  IBirdService birdService = Get.find();

  // Future<void> getBirdList() async {
  //   birdList1.value = (await birdService.getAllBird())!;
  //   // print("Bird=== ${birdList1.string}");
  //   print("test " + birdList1.toString());
  //   print("test " + birdList1.length.toString());
  //   print("Bird=== ${birdList1.string}");

  //   if (birdList1.isEmpty) {
  //     birdListSelected = [];
  //     BotToast.showText(text: "No bird!");
  //   } else {
  //     // loadData();
  //     List.generate(
  //         birdList1.length,
  //         (index) => birdListSelected.add(SelectedBird(
  //             bird_id: birdList1[index].bird_Id,
  //             name: birdList1[index].name,
  //             isSelected: false.obs)));
  //     // onInit();
  //     print("test " + birdListSelected.toString());
  //     print("test " + birdList1.length.toString());
  //   }
  //   // TournamentDetailIncomingController t = Get.find();
  //   // t.onInit();
  //   for (var element in birdList1) {
  //     print("id..." + element.toString());
  //     // birdListSelected.asMap();
  //   }
  //   // BirdController t = Get.find();
  //   // t.onInit();
  // }

  // //Load data
  // final tournamentdetailsList = <TournamentDetails>[].obs;
  // Future<void> getTournamentDetails() async {
  //   tournamentdetailsList.value = (await tournamentService.getById())!;
  // }
  IPrizesService prizeService = Get.find();
  final prizeList = <Prizes>[].obs;
  Future<void> getPrizeList() async {
    print("========== ${tournamentId.value}");
    prizeList.value = (await prizeService.getById(tournamentId.value))!;
    print("infor" + tournament.toString());
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
