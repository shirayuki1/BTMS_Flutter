// import 'package:btms/Data/bird.dart';
// import 'package:btms_member/Models/bird.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:btms_member/Data/selected_bird.dart';
import 'package:btms_member/Pages/BirdList/controller/bird_controller.dart';

import 'package:btms_member/Pages/TournamentDetail_Incoming/controller/tournament_detail_incoming_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:btms_member/Services/api/bird_service.dart';
import 'package:btms_member/Services/api/register_tournament_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../Models/bird.dart';

class ChooseBirdController extends GetxController {
  final ScrollController scrollController = ScrollController();
  // bool debugFocusChanges = false;
  SharedStates st = Get.find();

  final birdListSelected = <SelectedBird>[].obs;
  // List birdListSelected = [];
  final birdList1 = <Bird>[].obs;
  final price = [];
  // SharedStates st = Get.find();
  // final bird = SelectedBird().obs;

  @override
  void onInit() {
    super.onInit();
    getBirdList();
    print("test " + birdListSelected.length.toString());
    print("result " + birdListSelected.toString());
  }

  final cartList = <Bird>[].obs;
  RegisterTournamentService registerService = Get.find();
  void addToCart() {
    for (var element in price) {
      price.remove(element);
    }
    price.add(st.price);
    List<Bird> birdData1 = [];
    birdListSelected.forEach(
      (data) {
        if (data.isSelected.isTrue) {
          birdData1.add(
            Bird(
              bird_Id: data.bird_id,
              name: data.name,
              bannerUrl: data.bannerUrl1,
              status: data.status1,
              weight: data.weight1,
              height: data.height1,
            ),
          );
        }
      },
    );
    // birdListSelected.value = [];
    cartList.value = [];
    // print("b" + birdData.toString());
    cartList.addAll(birdData1);

    print("vit" + cartList.toString());
    Get.toNamed(Routes.cartBird);
    // print("123" + st.birdListSelectedTmp.toString());
  }

  void registerTournament() async {
    BotToast.showLoading();
    // getBirdList();

    // bird.status.toString() ==
    //                                                   "ON_TOURNAMENT"
    //                                               ? "đang tham gia giải đấu"
    //                                               : "có thể đăng ký giải đấu"

    List<Map<String, int>> birdIdList = [];
    if (birdListSelected != null) {
      for (var element in birdListSelected) {
        if (element.isSelected.isTrue) {
          birdIdList.add({"bird_Id": element.bird_id!});
        }
      }
      final data = {
        "tournament_Id": st.tournamentId,
        "birds": birdIdList,
        "payment_Id": "Đã đăng ký thành công",
        "payment_Status": 1,
      };
      print("tmp " + data.toString());
      final result = await registerService.register(data);
      if (result) {
        BotToast.showText(text: "Đăng ký thành công.");
        Get.toNamed(Routes.homeScreen);
        ChooseBirdController t = Get.find();
        t.onInit();
        getBirdList();
      } else {
        BotToast.showText(
            text: "Chim đăng ký đã có hoặc hiện trong giải đấu khác !!!");
      }
    }
    BotToast.closeAllLoading();
    // getBirdList();
  }

  //Load Data
  IBirdService birdService = Get.find();
  List<SelectedBird> birdData = [];
  Future<void> getBirdList() async {
    birdList1.value = [];
    // BotToast.showLoading();
    birdList1.value = (await birdService.getAllBird1(st.tournamentId))!;
    // print("Bird=== ${birdList1.string}");
    print("test " + birdList1.toString());
    print("length " + birdList1.length.toString());
    // List<SelectedBird> birdData = [];
    birdData = [];
    birdList1.forEach(
      (data) {
        if (data.status.toString() != "ON_TOURNAMENT" &&
            data.status.toString() != "REGISTERED") {
          birdData.add(
            SelectedBird(
              bird_id: data.bird_Id,
              name: data.name,
              bannerUrl1: data.bannerUrl,
              status1: data.status,
              weight1: data.weight,
              height1: data.height,
              isSelected: false.obs,
            ),
          );
        }
      },
    );
    birdListSelected.value = [];
    // print("b" + birdData.toString());
    birdListSelected.addAll(birdData);

    // ChooseBirdController t = Get.find();
    // t.onInit();
  }

  String? updateStatus(String status) {
    String newStatus = status;
    if (status == "ON_TOURNAMENT") {
      return newStatus = "Đang tham gia giải";
    } else if (status == "READY") {
      return newStatus = "Chưa tham gia giải";
    } else if (status == "REGISTERED") {
      return newStatus = "Đã đăng ký giải";
    } else if (status == "null") {
      return newStatus = "Chưa có trạng thái";
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
