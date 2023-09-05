import 'dart:math';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:btms_refee/Models/result_evaluate.dart';
import 'package:btms_refee/Models/round_result.dart';
import 'package:btms_refee/Models/score_criteria.dart';
import 'package:btms_refee/Models/score_type.dart';
import 'package:btms_refee/Pages/Round/controller/round_controller.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:btms_refee/Services/GlobalStates/share_states.dart';
import 'package:btms_refee/Services/api/result_evaluate_service.dart';
import 'package:btms_refee/Services/api/round_result_service.dart';
import 'package:btms_refee/Services/api/score_type_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:http/io_client.dart';

class RoundResultController extends GetxController {
  SharedStates states = Get.find();
  final ScrollController scrollController = ScrollController();
  final showSlider = true.obs;

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
    getScoreTypeList();
    realTime();
  }

  final roundNumber = 0.obs;
  final roundId = 0.obs;
  final roundResult_Id = 0.obs;

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

  String? updateStatus1(String status) {
    String newStatus = status;
    if (status == "null") {
      return newStatus = "Đang thi đấu";
    } else if (status == "false") {
      return newStatus = "Bị loại";
    } else if (status == "true") {
      return newStatus = "Đi tiếp";
    }
  }

  String? updateStatus2(String isValuate) {
    String newStatus = isValuate;
    if (isValuate == "false") {
      return newStatus = "Chưa chấm";
    } else if (isValuate == "true") {
      return newStatus = "Đã chấm điểm";
    }
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

  //Load data of Bird listScore
  IScoreTypeService scoreTypeService = Get.find();
  final scoreTypeList = <ScoreType>[].obs;
  final scoreCriteriaList = <ScoreCriteria>[].obs;
  Future<void> getScoreTypeList() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    scoreTypeList.value =
        (await scoreTypeService.getAllScoreType(roundId.value))!;
    // states.birdLists = birdList.value;
    // listEvents.value = await eventService.getEvents();
    print("scoretype=== ${scoreTypeList.string}");
  }

  Future<void> getRoundResultId(int? id) async {
    print("id round result" + id.toString());
    states.roundResultId = id!.toInt();
  }

  void goToRound() {
    RoundController r = Get.find();
    r.getRoundList();
    Get.toNamed(Routes.round);
    realTime();
  }

  var isWarn = false;
  final note = "".obs;

  void evaluateBird() async {
    // BotToast.showLoading();
    // getBirdList();
    List<Map<String, int>> criteriaIdList = [];
    for (var element in scoreTypeList) {
      // scoreCriteriaList.value = element.scoringCriterias!;
      for (var i = 0; i < element.scoringCriterias!.length; i++) {
        if (element.scoringCriterias![i].isSelected == true) {
          criteriaIdList
              .add({"scoringCriteria_Id": element.scoringCriterias![i].id!});
        }
      }
    }

    print("1 " + scoreCriteriaList.string);

    // for (var tmp in scoreCriteriaList) {
    // print("name " + tmp.name.toString());
    // if (tmp.isSelected == true) {
    //   criteriaIdList.add({"scoringCriteria_Id": tmp.id!});
    // }
    if (criteriaIdList.isEmpty) {
      BotToast.showText(text: "Bạn cần chấm lỗi cho con chim này !!!");
    } else {
      final data = {
        "roundResult_Id": states.roundResultId,
        // "note": note.value,
        "note": note.value,
        "isWarn": isWarn,
        "scoringCriterias": criteriaIdList,
      };
      print("data=== " + data.toString());
      final result = await scoreTypeService.evaluate(data);

      if (result) {
        BotToast.showText(text: "Đánh giá thành công !!!");
        Get.toNamed(Routes.roundResult);
        // RoundResultController t = Get.find();
        RoundResultController r = Get.find();
        r.getRoundResultList();
      } else {
        BotToast.showText(text: "Bạn đã đánh giá con chim này rồi !!!");
        //     BotToast.showText(text: "Xin vui lòng đăng ký lại !!!");
        //     // getBirdList();
      }
    }
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
    BotToast.closeAllLoading();
  }

  final List<String> items = [
    'Nhất',
    'Nhì',
    'Ba',
    'Tư',
  ];

  String? selectedValue;
  int? rank;

  void evaluateBird2() async {
    // BotToast.showLoading();
    // getBirdList();
    List<Map<String, int>> criteriaIdList = [];
    for (var element in scoreTypeList) {
      // scoreCriteriaList.value = element.scoringCriterias!;
      for (var i = 0; i < element.scoringCriterias!.length; i++) {
        if (element.scoringCriterias![i].isSelected == true) {
          criteriaIdList
              .add({"scoringCriteria_Id": element.scoringCriterias![i].id!});
        }
      }
    }

    print("1 " + scoreCriteriaList.string);

    // for (var tmp in scoreCriteriaList) {
    // print("name " + tmp.name.toString());
    // if (tmp.isSelected == true) {
    //   criteriaIdList.add({"scoringCriteria_Id": tmp.id!});
    // }
    if (criteriaIdList.isEmpty) {
      BotToast.showText(text: "Bạn cần chấm lỗi cho con chim này !!!");
    } else {
      if (selectedValue!.toLowerCase() == "nhất") {
        rank = 1;
      } else if (selectedValue!.toLowerCase() == "nhì") {
        rank = 2;
      } else if (selectedValue!.toLowerCase() == "ba") {
        rank = 3;
      } else if (selectedValue!.toLowerCase() == "tư") {
        rank = 4;
      }
      final data = {
        "roundResult_Id": states.roundResultId,
        // "note": note.value,
        "note": note.value,
        "rank": rank,
        "scoringCriterias": criteriaIdList,
      };
      print("data=== " + data.toString());
      final result = await scoreTypeService.evaluate2(data);

      if (result) {
        BotToast.showText(text: "Đánh giá thành công !!!");
        Get.toNamed(Routes.roundResult);
        // RoundResultController t = Get.find();
        RoundResultController r = Get.find();
        r.getRoundResultList();
        // items.clear();
      } else {
        BotToast.showText(text: "Bạn đã đánh giá con chim này rồi !!!");
        //     BotToast.showText(text: "Xin vui lòng đăng ký lại !!!");
        //     // getBirdList();
      }
    }

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
    BotToast.closeAllLoading();
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
    connection.on('ReceiveEvaluate', (message) {
      print("HELLO ");
      getRoundResultList();
      evaluateBird();
      evaluateBird2();
      // getResultEvaluate(id);
    });
    connection.on('ReceiveTournamentScoringCriteria', (arguments) {
      getScoreTypeList();
    });
  }

  IResultEvaluateService resultEvaluateService = Get.find();
  final resultEvaluate = <ResultEvaluate>[].obs;
  final resultScoreType = <ScoreType>[].obs;
  String note2 = "không có";
  Future<void> getResultEvaluate(int id) async {
    resultScoreType.value = [];
    note2 = "không có";
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    resultEvaluate.value = (await resultEvaluateService.getResultById(id))!;

    for (var t1 in resultEvaluate) {
      for (var element in t1.scoreType) {
        resultScoreType.add(element);
      }
      note2 = t1.note.toString();
    }
    // states.birdLists = birdList.value;
    // listEvents.value = await eventService.getEvents();
    print("resultEvaluate=== ${resultEvaluate.string}");
  }
}

// onChanged: (newValue) {
//                                                   // controller.scoreCriteriaList
//                                                   //     .add(criti.id);
//                                                   // print("$value  value");

//                                                   setState(() {
//                                                     // criti.isSelected = newValue!;
//                                                     criti.isSelected =
//                                                         !criti.isSelected;
//                                                   });
//                                                   // addRemoveFavHealth(
//                                                   //     value, condition.id);
//                                                 },