// import 'package:btms/Models/tournament.dart';
// import 'package:btms/Services/GlobalStates/share_states.dart';
// import 'package:btms/Services/api/incoming_tournament_service.dart';
// import 'package:btms/Services/api/ongoing_tournament_service.dart';
import 'package:btms_member/Models/tournament.dart';
import 'package:btms_member/Pages/TournamentDetail_Incoming/controller/tournament_detail_incoming_controller.dart';
import 'package:btms_member/Pages/TournamentDetail_Ongoing/controller/tournament_detail_ongoing_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:btms_member/Services/api/incoming_tournament_service.dart';
import 'package:btms_member/Services/api/ongoing_tournament_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  SharedStates states = Get.find();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getIncomingTournaments();
    getOngoingTournaments();
    // if (!initPage()) return;
  }

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

  Future<void> goToGoingDetail(int? id) async {
    print("id" + id.toString());
    if (id != null) {
      Get.toNamed(Routes.goingTourDetail,
          parameters: {"tournament_Id": id.toString()});
      TournamentDetailOngoingController t = Get.find();
      t.onInit();
    }
  }

  Future<void> goToComingDetail(int? id) async {
    print("id" + id.toString());
    if (id != null) {
      Get.toNamed(Routes.comingTourDetail,
          parameters: {"tournament_Id": id.toString()});
      TournamentDetailIncomingController t = Get.find();
      t.onInit();
    }
  }
}
