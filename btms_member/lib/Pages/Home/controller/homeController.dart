import 'dart:io';

import 'package:btms_member/Models/tournament.dart';
import 'package:btms_member/Pages/TournamentDetail_Incoming/controller/tournament_detail_incoming_controller.dart';
import 'package:btms_member/Pages/TournamentDetail_Ongoing/controller/tournament_detail_ongoing_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:btms_member/Services/api/incoming_tournament_service.dart';
import 'package:btms_member/Services/api/ongoing_tournament_service.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:get/get.dart';
import 'package:signalr_core/signalr_core.dart';

class HomeController extends GetxController {
  SharedStates states = Get.find();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getIncomingTournaments();
    getOngoingTournaments();
    // if (!initPage()) return;
    realTime();
  }
  // set gender
  // void setStatus(String status) {
  //   tourStatus.value = status;
  // }

  // load data of incoming tournament
  IIncomingTournamentService incomingTournamentService = Get.find();

  // load data of ongoing tournament
  IOngoingTournamentService ongoingTournamentService = Get.find();
  final listIncomingTournament = <Tournament>[].obs;
  final listOngoingTournament = <Tournament>[].obs;

  Future<void> getIncomingTournaments() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    listIncomingTournament.value =
        (await incomingTournamentService.getAllIncomingTournament())!;
    // listEvents.value = await eventService.getEvents();

    print("dien=== ${listIncomingTournament.string}");
    // for (var item in listIncomingTournament) {
    //   print("=========== ${item.name}");
    // }

    for (var element in listIncomingTournament) {
      print("ID...." + element.toString());
    }
    // TournamentDetailIncomingController t = Get.find();
    // t.onInit();
  }

  Future<void> getOngoingTournaments() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    listOngoingTournament.value =
        (await ongoingTournamentService.getAllOngoingTournament())!;
    // listEvents.value = await eventService.getEvents();

    print("ongoing=== ${listOngoingTournament.string}");
    for (var element in listOngoingTournament) {
      print("ID...." + element.toString());
    }
    // TournamentDetailOngoingController t = Get.find();
    // t.onInit();
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

  Future<void> goToGoingDetail(int? id) async {
    print("id" + id.toString());
    if (id != null) {
      Get.toNamed(Routes.goingTourDetail,
          parameters: {"tournament_Id": id.toString()});
      states.tournamentId = id;
      TournamentDetailOngoingController t = Get.find();
      t.onInit();
    }
  }

  Future<void> goToComingDetail(int? id) async {
    for (var element in listIncomingTournament) {
      if (element.tournament_Id == id) {
        states.price = element.participantFee!;
      }
    }
    print("id" + id.toString());
    if (id != null) {
      Get.toNamed(Routes.comingTourDetail,
          parameters: {"tournament_Id": id.toString()});
      TournamentDetailIncomingController t = Get.find();
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
      getIncomingTournaments();
      getOngoingTournaments();
    });
  }
}
