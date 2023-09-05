import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:btms_member/Models/round_result.dart';
import 'package:btms_member/Models/score_criteria.dart';
import 'package:btms_member/Models/score_type.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:btms_member/Services/api/round_result_service.dart';
import 'package:btms_member/Services/api/score_type_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryRoundResultController extends GetxController {
  SharedStates states = Get.find();
  final ScrollController scrollController = ScrollController();
  final showSlider = true.obs;
  final note = "".obs;

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

  //Load data of Bird list
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

  // void evaluateBird() async {
  //   // BotToast.showLoading();
  //   // getBirdList();
  //   List<Map<String, int>> criteriaIdList = [];

  //   for (var element in scoreTypeList) {
  //     // scoreCriteriaList.value = element.scoringCriterias!;
  //     for (var i = 0; i < element.scoringCriterias!.length; i++) {
  //       if (element.scoringCriterias![i].isSelected == true) {
  //         criteriaIdList
  //             .add({"scoringCriteria_Id": element.scoringCriterias![i].id!});
  //       }
  //     }
  //   }

  //   print("1 " + scoreCriteriaList.string);

  //   // for (var tmp in scoreCriteriaList) {
  //   // print("name " + tmp.name.toString());
  //   // if (tmp.isSelected == true) {
  //   //   criteriaIdList.add({"scoringCriteria_Id": tmp.id!});
  //   // }
  //   final data = {
  //     "roundResult_Id": states.roundResultId,
  //     // "note": note.value,
  //     "note": note.value,
  //     "isWarn": isWarn,
  //     "scoringCriterias": criteriaIdList,
  //   };
  //   print("data=== " + data.toString());
  //   final result = await scoreTypeService.evaluate(data);

  //   if (result) {
  //     BotToast.showText(text: "Đánh giá thành công.");
  //     Get.toNamed(Routes.homeScreen);
  //   } else {
  //     BotToast.showText(text: "Đánh giá thất bại !!!");
  //     //     BotToast.showText(text: "Xin vui lòng đăng ký lại !!!");
  //     //     // getBirdList();
  //   }
  // }

  // if (birdListSelected != null) {
  //   for (var element in birdListSelected) {
  //     if (element.isSelected.isTrue) {
  //       birdIdList.add({"scoringCriteria_Id": element.bird_id!});
  //     }
  //   }
  //   final data = {
  //     "roundResult_Id": st.,
  //     "birds": birdIdList,
  //     "payment_Id": "Test",
  //     "payment_Status": 3
  //   };
  //   print("tmp " + data.toString());
  //   final result = await registerService.register(data);
  //   if (result) {
  //     BotToast.showText(text: "Đăng kí thành công.");
  //     Get.toNamed(Routes.homeScreen);
  //     // Get.toNamed(Routes.createBird);
  //     // BirdController b = Get.find();
  //     // b.onInit();
  //     // ChooseBirdController t = Get.find();
  //     // t.onInit();
  //   } else {
  //     BotToast.showText(
  //         text: "Chim đăng kí đã có hoặc hiện trong giải đấu khác !!!");
  //     BotToast.showText(text: "Xin vui lòng đăng ký lại !!!");
  //     // getBirdList();
  //   }
  // }
  //   BotToast.closeAllLoading();
  // }

  Future<void> getRoundResultId(int? id) async {
    print("id round result" + id.toString());
    states.roundResultId = id!.toInt();
  }
  // getBirdList();
}
