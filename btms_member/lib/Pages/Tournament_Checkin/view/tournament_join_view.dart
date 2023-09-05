import 'package:btms_member/Constants/Color/hexa_color.dart';
import 'package:btms_member/Pages/Tournament_Checkin/controller/tournament_join_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Utils/formatter.dart';
import 'package:btms_member/Widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TournamentJoinScreen extends GetView<TournamentJoinController> {
  const TournamentJoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    // return Obx(() {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller.scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                alignment: Alignment.center,
                child: const Text(
                  "Giải đấu tham gia",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 726,
                child: Obx(
                  () {
                    var joinList = controller.listJoinTournament;
                    if (joinList.isEmpty) {
                      return const Center(
                        child: Text(
                            "Chưa có danh sách lịch sử tham gia giải đấu!!!"),
                      );
                    } else {
                      return Container(
                        height: 726,
                        margin: const EdgeInsets.only(
                          top: 5,
                          right: 20,
                          left: 20,
                        ),
                        child: ListView.builder(
                          addSemanticIndexes: true,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: joinList.length,
                          itemBuilder: (BuildContext ctx, index) {
                            final joinTournament = joinList[index];
                            if (joinTournament.status!.toUpperCase() == "END") {
                              return GestureDetector(
                                onTap: () {
                                  // Get.toNamed(Routes.checkinList);
                                  controller.goToCheckInList(
                                      joinTournament.tournament_Id);
                                },
                                child: Container(
                                  height: screenSize.height * 0.54,
                                  margin: const EdgeInsets.only(
                                    bottom: 15,
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor("#EEEEEE"),
                                    border: Border.all(color: Colors.black),
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
                                          joinTournament.banner_URL.toString(),
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
                                            joinTournament.name.toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFFFFAB91),
                                            ),
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
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                // "02 - 06 -2023",
                                                Formatter.date(
                                                    joinTournament.startDate),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.normal),
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
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  // "FPT University",
                                                  joinTournament.location
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black38,
                                                      fontWeight:
                                                          FontWeight.normal),
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
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                // "8h30",
                                                Formatter.date(joinTournament
                                                    .startRegisterDate),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.normal),
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
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                // "8h30",
                                                Formatter.date(joinTournament
                                                    .endRegisterDate),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.normal),
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
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                // "8h30",
                                                "${joinTournament.maxParticipant} Lồng",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.normal),
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
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                // "8h30",
                                                "${joinTournament.participantFee} VND",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.normal),
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
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  // joinTournament.status
                                                  //             .toString() ==
                                                  //         "END"
                                                  //     ? "Giải đấu đã kết thúc"
                                                  //     : "Giải đấu chưa kết thúc",
                                                  controller.updateStatus(
                                                      joinTournament.status
                                                          .toString())!,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  // Get.toNamed(Routes.checkinList);
                                  controller.goToCheckInList(
                                      joinTournament.tournament_Id);
                                },
                                child: Container(
                                  height: screenSize.height * 0.54,
                                  margin: const EdgeInsets.only(
                                    bottom: 15,
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.black)),
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
                                          joinTournament.banner_URL.toString(),
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
                                            joinTournament.name.toString(),
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
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                // "02 - 06 -2023",
                                                Formatter.date(
                                                    joinTournament.startDate),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w300),
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
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  // "FPT University",
                                                  joinTournament.location
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w300),
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
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                // "8h30",
                                                Formatter.date(joinTournament
                                                    .startRegisterDate),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w300),
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
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                // "8h30",
                                                Formatter.date(joinTournament
                                                    .endRegisterDate),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w300),
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
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                // "8h30",
                                                "${joinTournament.maxParticipant} Lồng",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w300),
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
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                // "8h30",
                                                "${joinTournament.participantFee} VND",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w300),
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
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  // joinTournament.status
                                                  //             .toString() ==
                                                  //         "END"
                                                  //     ? "Giải đấu đã kết thúc"
                                                  //     : "Giải đấu chưa kết thúc",
                                                  controller.updateStatus(
                                                      joinTournament.status
                                                          .toString())!,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottombar(),
    );
    // });
  }
}
