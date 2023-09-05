import 'package:btms_member/Constants/Color/hexa_color.dart';
import 'package:btms_member/Pages/HistoryRound/controller/round_controller.dart';
import 'package:btms_member/Pages/Round/controller/round_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundScreen extends GetView<RoundController> {
  const RoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back(closeOverlays: true);
          },
        ),
        elevation: 1,
        title: const Text(
          'Kết quả vòng đấu',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () {
                  var listRound = controller.roundList;
                  if (listRound.isEmpty) {
                    return const Center(
                      child: Expanded(
                        child: Text(
                          style: TextStyle(fontSize: 18),
                          "Chưa có vòng đấu diễn ra! Hãy chờ tới khi giải đấu bắt đầu",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      height: screenSize.height * 0.88,
                      margin:
                          const EdgeInsets.only(right: 15, left: 15, top: 10),
                      child: ListView.builder(
                        addSemanticIndexes: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listRound.length,
                        itemBuilder: (BuildContext ctv, index) {
                          final round = listRound[index];
                          return GestureDetector(
                            onTap: () {
                              controller.goRoundResult(round.round_Id);
                            },
                            child: Container(
                              height: screenSize.height * 0.15,
                              margin: const EdgeInsets.only(
                                bottom: 15,
                              ),
                              padding: const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black),
                                //
                                color: HexColor("##f0ffff"),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Text(
                                        "Số vòng đấu: ",
                                        // textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${round.roundNumber}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      const Text(
                                        "Vòng đấu: ",
                                        // textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        round.name.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple,
                                          // color: HexColor("#000000"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Text(
                                        "Số lượng chim đi tiếp: ",
                                        // textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          "${round.numberBirdPass} lồng",
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Text(
                                        "Trạng thái vòng đấu:",
                                        // textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          controller.updateStatus(
                                              round.status.toString())!,
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
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
            ],
          ),
        ),
      ),

      //   body: Container(
      //     // alignment: Alignment.center,
      //     width: double.infinity,
      //     padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
      //     child: Column(
      //       children: [
      //         GestureDetector(
      //           onTap: () {
      //             Get.toNamed(Routes.resultInfoBird);
      //           },
      //           child: Container(
      //             width: screenSize.width * 0.85,
      //             height: screenSize.height * 0.08,
      //             // alignment: Alignment.center,
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 border: Border.all(color: Colors.black)),
      //             child: GestureDetector(
      //               child: Row(
      //                 children: [
      //                   const SizedBox(
      //                     width: 20,
      //                   ),
      //                   Image.network(
      //                     "https://chimchaomao.vn/upload/baiviet/logomobile-4993.png",
      //                     width: 30,
      //                     height: 30,
      //                   ),
      //                   const SizedBox(
      //                     width: 20,
      //                   ),
      //                   const Text(
      //                     "Chim chào mào một",
      //                     textAlign: TextAlign.right,
      //                     style: TextStyle(
      //                         fontSize: 20, fontWeight: FontWeight.w500),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
    );
  }
}
