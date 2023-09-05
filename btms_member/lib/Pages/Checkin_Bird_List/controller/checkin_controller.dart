import 'dart:io';

import 'package:btms_member/Models/register_history.dart';
import 'package:btms_member/Pages/BirdInformation/controller/bird_information_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:btms_member/Services/api/list_bird_register_service.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:get/get.dart';
import 'package:signalr_core/signalr_core.dart';

class CheckinController extends GetxController {
  SharedStates states = Get.find();
  final ScrollController scrollController = ScrollController();
  final showSlider = true.obs;

  @override
  void onInit() {
    super.onInit();
    // if (!initPage()) return;
    // initPage();
    String? id = Get.parameters['tournament_Id'];
    // String? id1 = Get.parameters['image_Id'];
    if (id == null) return;
    tournamentId.value = int.parse(id);
    print("mmm" + tournamentId.value.toString());
    getBirdRegisterList();
    realTime();
  }

  final tournamentId = 0.obs;
  // final roundResult_Id = 0.obs;

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
  IBirdRegisterService birdRegisterService = Get.find();
  final birdRegisterList = <register_history>[].obs;
  Future<void> getBirdRegisterList() async {
    print("hmmm");
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    // print("123" + roundId.value.toString());
    birdRegisterList.value =
        (await birdRegisterService.getById(tournamentId.value))!;

    // states.birdLists = birdList.value;
    // listEvents.value = await eventService.getEvents();
    print("bird Register=== ${birdRegisterList.string}");
    for (var element in birdRegisterList) {
      print("id..." + element.toString());
    }
  }

  Future<void> goToDetailBird(int? id) async {
    print("id round" + id.toString());
    if (id != null) {
      Get.toNamed(Routes.checkinBird, parameters: {"bird_Id": id.toString()});
      BirdInformationController t = Get.find();
      t.onInit();
    }
  }

  String? updateStatus(String payment_Status) {
    String newStatus = payment_Status;
    if (payment_Status == "COMPLETED") {
      return newStatus = "Đã thanh toán";
    } else if (payment_Status == "null") {
      return newStatus = "Chưa có trạng thái";
    } else if (payment_Status == "completed") {
      return newStatus = "Đã thanh toán";
    } else if (payment_Status == "REFUNDED") {
      return newStatus = "Hoàn tiền";
    } else if (payment_Status == "FAILED") {
      return newStatus = "Thanh toán bị lỗi";
    }
    // else if (payment_Status == "completed") {
    //   return newStatus = "Đã thanh toán";
    // }
  }

  String? updateStatus1(String status) {
    String newStatus = status;
    if (status == "PENDING") {
      return newStatus = "Chờ xét duyệt";
    } else if (status == "CANCEL") {
      return newStatus = "Đã hủy";
    } else if (status == "REJECTED") {
      return newStatus = "Bị từ chối";
    } else if (status == "APPROVED") {
      return newStatus = "Được xác nhận";
    } else if (status == "CLOSED") {
      return newStatus = "Đóng điểm danh";
    } else if (status == "CHECK_IN") {
      return newStatus = "Đang điểm danh";
    } else if (status == "null") {
      return newStatus = "Chưa có";
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
    connection.on('ReceiveCheckinForms', (message) {
      print("HELLO ");
      getBirdRegisterList();
    });
  }
}
