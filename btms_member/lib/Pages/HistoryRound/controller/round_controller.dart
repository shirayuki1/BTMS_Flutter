import 'package:btms_member/Models/round.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:btms_member/Services/api/round_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundHistoryController extends GetxController {
  SharedStates states = Get.find();
  final ScrollController scrollController = ScrollController();
  final showSlider = true.obs;

  @override
  void onInit() {
    super.onInit();
    if (!initPage()) return;
    initPage();
    getRoundList();
  }

  final roundId = 0.obs;
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
  IRoundService roundService = Get.find();
  final roundList = <Round>[].obs;
  Future<void> getRoundList() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    roundList.value = (await roundService.getById(st.tournamentId))!;
    // states.birdLists = birdList.value;
    // listEvents.value = await eventService.getEvents();
    print("round=== ${roundList.string}");
    for (var element in roundList) {
      print("id..." + element.toString());
    }
  }

  Future<void> goRoundResultHistory(int? id) async {
    print("id" + id.toString());
    if (id != null) {
      // states.roundId = id;
      Get.toNamed(Routes.roundResultHistory,
          parameters: {"round_Id": id.toString()});
      // HistoryDetailsController t = Get.find();
      // t.onInit();
    }
  }

  String? updateStatus(String status) {
    String newStatus = status;
    if (status == "NONE") {
      return newStatus = "Chưa có trạng thái vòng đấu";
    } else if (status == "START") {
      return newStatus = "Vòng đấu đang bắt đầu";
    } else if (status == "null") {
      return newStatus = "Vòng đấu đang lỗi";
    } else if (status == "END") {
      return newStatus = "Vòng đấu đã kết thúc";
    }
  }
}
