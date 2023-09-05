import 'dart:io';

import 'package:btms_member/Models/tournament.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:btms_member/Services/api/join_tournament_service.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:get/get.dart';
import 'package:signalr_core/signalr_core.dart';

class TournamentJoinController extends GetxController {
  SharedStates states = Get.find();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getHistoryTournament();
    realTime();
  }

  //Load data of history tournament
  IJoinTournamentService joinTournamentService = Get.find();
  final listJoinTournament = <Tournament>[].obs;
  Future<void> getHistoryTournament() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    listJoinTournament.value =
        (await joinTournamentService.getAllJoinTournament())!;
    // listEvents.value = await eventService.getEvents();

    print("dien=== ${listJoinTournament.string}");
    for (var item in listJoinTournament) {
      print("=========== ${item.name}");
    }
  }

  Future<void> goToCheckInList(int? id) async {
    print("id" + id.toString());
    if (id != null) {
      states.tournamentId = id;
      Get.toNamed(Routes.checkinList,
          parameters: {"tournament_Id": id.toString()});
      // HistoryDetailsController t = Get.find();
      // t.onInit();
    }
  }

  String? updateStatus(String status) {
    String newStatus = status;
    if (status == "OPEN_REGISTER") {
      return newStatus = "Mở đăng kí";
    } else if (status == "NONE") {
      return newStatus = "Sắp diễn ra";
    } else if (status == "CLOSE_REGISTER") {
      return newStatus = "Đóng đăng ký";
    } else if (status == "END_VALIDATION") {
      return newStatus = "Kết thúc duyệt đơn";
    } else if (status == "CHECK_IN") {
      return newStatus = "Đang điểm danh";
    } else if (status == "START") {
      return newStatus = "Giải đấu đã bắt đầu";
    } else if (status == "END") {
      return newStatus = "Giải đấu đã kết thúc";
    } else if (status == "null") {
      return newStatus = "Sắp diễn ra";
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
    connection.on('ReceiveTournamentDetail', (message) {
      print("HELLO ");
      getHistoryTournament();
    });
  }
}
