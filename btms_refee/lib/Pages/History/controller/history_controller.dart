import 'dart:io';

import 'package:btms_refee/Models/tournament.dart';
import 'package:btms_refee/Pages/HistoryDetail/controller/history_detail_controller.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:btms_refee/Services/GlobalStates/share_states.dart';
import 'package:btms_refee/Services/api/history_tournament_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/io_client.dart';
import 'package:signalr_core/signalr_core.dart';

class HistoryController extends GetxController {
  SharedStates states = Get.find();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getHistoryTournament();
    realTime();
  }

  //Load data of history tournament
  IHistoryTournamentService historyTournamentService = Get.find();
  final listHistoryTournament = <Tournament>[].obs;
  Future<void> getHistoryTournament() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    listHistoryTournament.value =
        (await historyTournamentService.getAllHistoryTournament())!;
    // listEvents.value = await eventService.getEvents();

    print("dien=== ${listHistoryTournament.string}");
    for (var item in listHistoryTournament) {
      print("=========== ${item.name}");
    }
  }

  Future<void> goHistoryDetails(int? id) async {
    print("id" + id.toString());
    if (id != null) {
      states.tournamentId = id;
      Get.toNamed(Routes.historyDetail,
          parameters: {"tournament_Id": id.toString()});
      HistoryDetailsController t = Get.find();
      t.onInit();
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
    connection.on('ReceiveTournaments', (message) {
      print("HELLO ");
      getHistoryTournament();
    });
  }
}
