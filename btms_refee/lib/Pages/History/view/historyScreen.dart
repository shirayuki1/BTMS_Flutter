import 'package:btms_refee/Models/tournament.dart';
import 'package:btms_refee/Pages/History/controller/history_controller.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:btms_refee/Utils/formatter.dart';
import 'package:btms_refee/Widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends GetView<HistoryController> {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size screenSize = MediaQuery.of(context).size;
    // return Obx(() {
    return Scaffold(
      body: SafeArea(
        // child: SingleChildScrollView(
        //   controller: controller.scrollController,
        //   scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 10),
              alignment: Alignment.center,
              child: const Text(
                "Lịch sử giải đấu",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 703.5,
              margin: const EdgeInsets.only(
                top: 20,
              ),
              // decoration: const BoxDecoration(
              //   color: Colors.lightGreen,
              // ),
              child: Obx(
                () {
                  var historyList = controller.listHistoryTournament;
                  if (historyList.isEmpty) {
                    return const Center(
                      child: Text("Chưa có danh sách lịch sử giải đấu!!!"),
                    );
                  } else {
                    return Container(
                      height: 650,
                      margin: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                        // bottom: 5,
                      ),
                      child: ListView.builder(
                        addSemanticIndexes: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: historyList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          final tournament = historyList[index];
                          return GestureDetector(
                            onTap: () {
                              // Get.toNamed(Routes.birdInfo);
                              controller
                                  .goHistoryDetails(tournament.tournament_Id);
                            },
                            child: Container(
                              height: screenSize.height * 0.51,
                              margin: const EdgeInsets.only(
                                top: 5,
                                bottom: 15,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black),
                                color: Colors.black12,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    height: 180,
                                    width: 250,
                                    child: Image.network(
                                      // "https://cdn.wikifarm.vn/2023/03/chim-chao-mao-7.jpg",
                                      tournament.banner_URL.toString(),
                                      height: 180,
                                      width: 250,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        // "Giải đấu mùa hè",
                                        tournament.name.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepOrange),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        // crossAxisAlignment:
                                        //     CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "Ngày diễn ra:",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            // "02 - 06 -2023",
                                            Formatter.date(
                                                tournament.startDate),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "Địa điểm:",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Text(
                                              // "FPT University",
                                              tournament.location.toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "Ngày bắt đầu đăng kí:",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            // "8h30",
                                            Formatter.date(
                                                tournament.startRegisterDate),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "Ngày kết thúc đăng kí:",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            // "8h30",
                                            Formatter.date(
                                                tournament.endRegisterDate),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "Số lồng giải đấu:",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            // "8h30",
                                            "${tournament.maxParticipant} Lồng",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "Lệ phí đăng ký:",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            // "8h30",
                                            "${tournament.participantFee} VND",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "Trạng thái giải đấu:",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Text(
                                              tournament.status.toString() ==
                                                      "END"
                                                  ? "Giải đấu đã kết thúc"
                                                  : "Giải đấu chưa kết thúc",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
        // ),
      ),
      bottomNavigationBar: const CustomBottombar(),
    );
    // });
  }
}
