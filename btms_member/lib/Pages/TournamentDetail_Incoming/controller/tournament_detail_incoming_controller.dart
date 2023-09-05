import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:btms_member/Models/prizes.dart';
import 'package:btms_member/Models/tournament_detail.dart';
import 'package:btms_member/Pages/ChooseBird/controller/choose_bird_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:btms_member/Services/api/bird_service.dart';
import 'package:btms_member/Services/api/prizes_service.dart';
import 'package:btms_member/Services/api/tournament_detail_service.dart';
import 'package:get/get.dart';

import 'package:http/io_client.dart';
import 'package:signalr_core/signalr_core.dart';
import '../../../Data/selected_bird.dart';
import '../../../Models/bird.dart';

class TournamentDetailIncomingController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    String? id = Get.parameters['tournament_Id'];
    // String? id1 = Get.parameters['image_Id'];
    if (id == null) return;
    tournamentId.value = int.parse(id);
    getTournamentById();
    getPrizeList();
    realTime();
  }

  SharedStates st = Get.find();

  ITournamentDetailService tournamentService = Get.find();
  var tournament = TournamentDetails().obs;
  final tournamentId = 0.obs;

  Future<void> getTournamentById() async {
    print("========== ${tournamentId.value}");

    tournament.value = (await tournamentService.getById(tournamentId.value))!;
    print("infor" + tournament.toString());
    st.tournamentId = tournamentId.value;
  }

  void navigate() {
    Get.toNamed(Routes.chooseBird);
    // ChooseBirdController t = Get.find();
    // t.onInit();
  }

  final birdList1 = <Bird>[].obs;
  // final birdListSelected = <SelectedBird>[].obs;
  List birdListSelected = [];
  List<Map<String, int>> birdIdList = [];
  // SharedStates st = Get.find();
  // final bird = SelectedBird().obs;
  List<bool> selected = List.generate(50, (i) => false).obs;

  // void loadData() {
  //   print("test " + birdList1.length.toString());
  //   List.generate(
  //       birdList1.length,
  //       (index) => birdListSelected.add(SelectedBird(
  //           bird_id: birdList1[index].bird_Id,
  //           name: birdList1[index].name,
  //           isSelected: false.obs)));
  //   print("test " + birdListSelected.toString());
  //   print("test " + birdList1.length.toString());
  // }

  //Load Data
  IBirdService birdService = Get.find();

//Prizes
  IPrizesService prizeService = Get.find();
  final prizeList = <Prizes>[].obs;
  Future<void> getPrizeList() async {
    print("========== ${tournamentId.value}");
    prizeList.value = (await prizeService.getById(tournamentId.value))!;
    print("infor" + tournament.toString());
  }
  // Future<void> getBirdList() async {
  //   birdList1.value = (await birdService.getAllBird())!;
  //   // print("Bird=== ${birdList1.string}");
  //   print("test " + birdList1.toString());
  //   print("test " + birdList1.length.toString());
  //   print("Bird=== ${birdList1.string}");

  //   if (birdList1.isEmpty) {
  //     birdListSelected = [];
  //     BotToast.showText(text: "No bird!");
  //   } else {
  //     // loadData();
  //     List.generate(
  //         birdList1.length,
  //         (index) => birdListSelected.add(SelectedBird(
  //             bird_id: birdList1[index].bird_Id,
  //             name: birdList1[index].name,
  //             isSelected: false.obs)));
  //     // onInit();
  //     print("test " + birdListSelected.toString());
  //     print("test " + birdList1.length.toString());
  //   }
  //   // TournamentDetailIncomingController t = Get.find();
  //   // t.onInit();
  //   for (var element in birdList1) {
  //     print("id..." + element.toString());
  //     // birdListSelected.asMap();
  //   }
  //   // BirdController t = Get.find();
  //   // t.onInit();
  // }

  // //Load data
  // final tournamentdetailsList = <TournamentDetails>[].obs;
  // Future<void> getTournamentDetails() async {
  //   tournamentdetailsList.value = (await tournamentService.getById())!;
  // }
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
      getTournamentById();
      getPrizeList();
    });
  }
}
