import 'package:btms_refee/Models/bird_achievement.dart';
import 'package:btms_refee/Services/GlobalStates/share_states.dart';
import 'package:btms_refee/Services/api/bird_achievement_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryRankingController extends GetxController {
  SharedStates st = Get.find();
  final ScrollController scrollController = ScrollController();
  final showSlider = true.obs;

  @override
  void onInit() {
    super.onInit();
    // if (!initPage()) return;
    // initPage();
    getBirdAchivementList();
  }

  IBirdAchievementService birdAchieveService = Get.find();
  final birdAchivement = <Bird_Achievement>[].obs;
  Future<void> getBirdAchivementList() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    birdAchivement.value = (await birdAchieveService.getById(st.tournamentId))!;

    // states.birdLists = birdList.value;
    // listEvents.value = await eventService.getEvents();
    print("birdAchivement=== ${birdAchivement.string}");
  }

  @override
  void onClose() {
    super.onClose();
    //closeShopping();
  }
}
