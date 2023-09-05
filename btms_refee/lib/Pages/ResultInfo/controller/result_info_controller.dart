import 'package:btms_refee/Models/score_criteria.dart';
import 'package:btms_refee/Models/score_type.dart';
import 'package:btms_refee/Services/api/score_criteria_service.dart';
import 'package:btms_refee/Services/api/score_type_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Services/GlobalStates/share_states.dart';

class ResultInfoController extends GetxController {
  SharedStates states = Get.find();
  final ScrollController scrollController = ScrollController();
  final showSlider = true.obs;

  @override
  void onInit() {
    super.onInit();
    // if (!initPage()) return;
    // initPage();
    getScoreTypeList();
  }

  @override
  void onClose() {
    super.onClose();
    //closeShopping();
  }

  //Load data of Bird list
  IScoreTypeService scoreTypeService = Get.find();
  final scoreTypeList = <ScoreType>[].obs;
  List scoreCriteriaList = [];
  Future<void> getScoreTypeList() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    scoreTypeList.value =
        (await scoreTypeService.getAllScoreType(states.roundId))!;
    // states.birdLists = birdList.value;
    // listEvents.value = await eventService.getEvents();
    print("scoretype=== ${scoreTypeList.string}");
  }

  // IScoreCriteriaService scoreCriteriaService = Get.find();
  // final scoreCriteriaList = <ScoreCriteria>[].obs;
  // Future<void> getScoreCriteriaList() async {
  //   //final events = await eventService.getEvents();
  //   //listEvents.value = events.data ?? [];
  //   scoreCriteriaList.value =
  //       (await scoreCriteriaService.getAllScoreCriteria())!;
  //   // states.birdLists = birdList.value;
  //   // listEvents.value = await eventService.getEvents();
  //   print("scoretype=== ${scoreCriteriaList.string}");
  //   for (var i = 0; i < idType.length; i++) {
  //     for (var element in scoreCriteriaList) {
  //       if (element.id == idType[i]) {
  //         Map<String, List<String>> h = {
  //           "$idType[i]": [],
  //         };
  //       }
  //     }
  //   }
  // }
}
