// import 'package:btms/Routes/routes.dart';
// import 'package:btms/Utils/formatter.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:btms_refee/Utils/formatter.dart';
import 'package:cached_video_preview/cached_video_preview.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_tab_indicator_styler/flutter_tab_indicator_styler.dart';
import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../Pages/Home/controller/homeController.dart';

class HomeTabView extends GetView<HomeController> {
  const HomeTabView({super.key});

  // final String buildingName;
  // HomeSearchBar({
  //   required this.buildingName,
  // });

  @override
  Widget build(BuildContext context) {
    // final screen = MediaQuery.of(context).size;
    return Container(
      child: Column(children: [
        const SizedBox(
          height: 100,
        ),
        Container(
          // padding: const EdgeInsets.only(bottom: 10),
          margin: const EdgeInsets.only(bottom: 5, right: 10, top: 90),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade400, width: 0.5),
            ),
          ),
          child: TabBar(
            //automaticIndicatorColorAdjustment: true,
            indicatorColor: Colors.green.shade100,
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle: const TextStyle(overflow: TextOverflow.clip),
            // indicator: BoxDecoration(
            //   border: Border.all(color: Colors.white),
            //   borderRadius: BorderRadius.circular(10),
            //   color: Colors.white,
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.grey.shade200,
            //       blurRadius: 4.0,
            //       offset: Offset(0, 0),
            //     ),
            //   ],
            // ),
            //indicatorWeight: 10,
            tabs: [
              Container(
                width: 120,
                margin: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: const Tab(
                  // text: "Đang diễn ra",
                  child: Text(
                    "Đang diễn ra",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  // icon: Icon(
                  //   Icons.file_copy_outlined,
                  //   color: Colors.grey,
                  // ),
                  //child: Expanded(child: Text),
                ),
              ),
              Container(
                width: 120,
                margin: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: const Tab(
                  // text: "Đang diễn ra",
                  child: Text(
                    "Sắp diễn ra",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
            labelColor: const Color(0xFF0C9869),
            indicatorPadding: const EdgeInsets.all(10),
            indicatorSize: TabBarIndicatorSize.tab,
            //padding: EdgeInsetsGeometry.lerp(EdgeInsets.only(left: 10), EdgeInsets.only(left: 10), 30),

            indicator: MaterialIndicator(
              height: 5,
              topLeftRadius: 8,
              topRightRadius: 8,
              horizontalPadding: 30,
              tabPosition: TabPosition.bottom,
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              // _buildReports(),
              _onGoing(),
              _inComing(),
              // _buildGalleries(),
              // _buildComment(),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _onGoing() {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller.scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 1,
            ),
            Obx(() {
              var onGoingList = controller.listOngoingTournament;
              if (onGoingList.isEmpty) {
                return const Center(
                  child: Text(
                    "Chưa có giải đấu nào sắp diễn ra!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                );
              } else {
                return Container(
                  height: 585,
                  margin: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                    bottom: 20,
                  ),
                  // padding: const EdgeInsets.only(right: 20, left: 20),
                  // alignment: Alignment.center,
                  child: ListView.builder(
                      addSemanticIndexes: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: onGoingList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        final ongoningTournament = onGoingList[index];
                        return GestureDetector(
                          onTap: () {
                            // Get.toNamed(Routes.birdInfo);
                            controller.goToGoingDetail(
                                ongoningTournament.tournament_Id);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            padding: const EdgeInsets.only(
                              top: 15,
                              left: 10,
                              right: 10,
                              bottom: 10,
                            ),
                            height: 470,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 180,
                                  width: 250,
                                  child: Image.network(
                                    // "https://cdn.wikifarm.vn/2023/03/chim-chao-mao-7.jpg",
                                    ongoningTournament.banner_URL.toString(),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                  height: 10,
                                ),
                                Container(
                                  // alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        // "Giải đấu mùa hè",
                                        ongoningTournament.name.toString(),
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
                                                ongoningTournament.startDate),
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
                                              ongoningTournament.location
                                                  .toString(),
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
                                            Formatter.date(ongoningTournament
                                                .startRegisterDate),
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
                                            Formatter.date(ongoningTournament
                                                .endRegisterDate),
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
                                            "${ongoningTournament.maxParticipant} Lồng",
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
                                            "${ongoningTournament.participantFee} VND",
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
                                            flex: 0,
                                            child: Text(
                                              controller.updateStatus(
                                                  ongoningTournament.status
                                                      .toString())!,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _inComing() {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller.scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 1,
            ),
            Obx(
              () {
                var inComingList = controller.listIncomingTournament;
                if (inComingList.isEmpty) {
                  return const Center(
                    child: Text(
                      "Chưa có giải đấu nào sắp diễn ra!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 585,
                    margin: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                      bottom: 20,
                    ),
                    // alignment: Alignment.center,
                    child: ListView.builder(
                        addSemanticIndexes: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: inComingList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          final incomingTournament = inComingList[index];
                          return GestureDetector(
                            onTap: () {
                              // Get.toNamed(Routes.birdInfo);
                              controller.goToComingDetail(
                                  incomingTournament.tournament_Id);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                bottom: 20,
                              ),
                              padding: const EdgeInsets.only(
                                top: 15,
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              height: 470,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 180,
                                    width: 250,
                                    child: Image.network(
                                      // "https://cdn.wikifarm.vn/2023/03/chim-chao-mao-7.jpg",
                                      incomingTournament.banner_URL.toString(),
                                      cacheHeight: 180,
                                      cacheWidth: 250,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                    height: 15,
                                  ),
                                  Container(
                                    // alignment: Alignment.center,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          // "Giải đấu mùa hè",
                                          incomingTournament.name.toString(),
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
                                                  incomingTournament.startDate),
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
                                                incomingTournament.location
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
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              // "8h30",
                                              Formatter.date(incomingTournament
                                                  .startRegisterDate),
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
                                              Formatter.date(incomingTournament
                                                  .endRegisterDate),
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
                                              "${incomingTournament.maxParticipant} Lồng",
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
                                              "${incomingTournament.participantFee} VND",
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
                                              "Trạng thái giải đấu:",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              flex: 0,
                                              child: Text(
                                                controller.updateStatus(
                                                    incomingTournament.status
                                                        .toString())!,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
