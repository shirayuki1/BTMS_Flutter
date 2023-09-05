import 'package:btms_member/Constants/Color/hexa_color.dart';
import 'package:btms_member/Pages/TournamentDetail_Ongoing/controller/tournament_detail_ongoing_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TournamentDetailOngoingScreen
    extends GetView<TournamentDetailOngoingController> {
  const TournamentDetailOngoingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

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
            // Get.back(closeOverlays: true);
            Get.toNamed(Routes.homeScreen);
          },
        ),
        elevation: 1,
        title: const Column(
          children: [
            Text(
              'Chi tiết giải đấu',
              style: TextStyle(color: Colors.black87, fontSize: 30),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Obx(() {
              var tournament = controller.tournament.value;
              print("123 $tournament");
              return Container(
                margin: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 2,
                        right: 2,
                      ),
                      // height: screenSize.height * 0.35,
                      // width: screenSize.width * 0.95,
                      child: Image.network(tournament.banner_URL.toString()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      tournament.name.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.indigoAccent,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: const Text(
                        "Mô tả giải đấu:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Text(
                        tournament.description.toString(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: const Text(
                            "Ngày thi đấu:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: Text(
                            Formatter.date(tournament.startDate),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: const Text(
                            "Ngày đăng ký:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          Formatter.date(tournament.startRegisterDate),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: const Text(
                            "Hạn đăng ký: ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Text(
                          Formatter.date(tournament.endRegisterDate),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                          ),
                          width: 100,
                          child: const Text(
                            "Địa điểm: ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 37,
                        ),
                        Expanded(
                          child: Text(
                            tournament.location.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: const Text(
                            "Số lượng lồng: ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "${tournament.maxParticipant} Lồng",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: const Text(
                            "Chi phí đăng ký:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          "${tournament.participantFee} VND",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //Hình ảnh liên quan giải đấu này
                    // Container(
                    //   alignment: Alignment.topLeft,
                    //   margin: const EdgeInsets.only(
                    //     left: 15,
                    //   ),
                    //   child: const Text(
                    //     "Hình ảnh:",
                    //     style: TextStyle(
                    //         fontSize: 20, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: const Text(
                        "Giải thưởng:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //Prizes
                    Container(
                      margin: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: Obx(
                        () {
                          var listPrizes = controller.prizeList();
                          if (listPrizes.isEmpty) {
                            return const Center(
                              child: Expanded(
                                child: Text(
                                  style: TextStyle(fontSize: 18),
                                  "Chưa có giải thưởng",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          } else {
                            return ListView.builder(
                              addSemanticIndexes: true,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listPrizes.length,
                              itemBuilder: (BuildContext ctv, index) {
                                final prizes = listPrizes[index];
                                return Container(
                                  height: screenSize.height * 0.06,
                                  margin: const EdgeInsets.only(
                                    left: 5,
                                    right: 5,
                                    bottom: 10,
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black),
                                    color: HexColor("#efe9f9"),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        prizes.name.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 55,
                                          ),
                                          const Text(
                                            "Tiền thưởng:",
                                            // textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${prizes.price.toString()} VND",
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.round);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 5,
                          left: 30,
                          right: 30,
                          bottom: 10,
                        ),
                        width: screenSize.width * 0.55,
                        height: screenSize.height * 0.05,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xff00CC00),
                            borderRadius: BorderRadius.circular(4)),
                        child: const Text(
                          "Kết quả thi đấu",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    //Videoconst
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // Container(
                    //   alignment: Alignment.bottomLeft,
                    //   margin: const EdgeInsets.only(
                    //     left: 15,
                    //   ),
                    //   child: const Text(
                    //     "Video:",
                    //     style:
                    //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // //Button
                    // const SizedBox(
                    //   height: 35,
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.only(
                    //     left: 15,
                    //     bottom: 15,
                    //   ),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         width: 170,
                    //         height: 50,
                    //         alignment: Alignment.center,
                    //         decoration: BoxDecoration(
                    //             color: const Color(0xffFF0000),
                    //             borderRadius: BorderRadius.circular(4)),
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             controller.deleteBird();
                    //           },
                    //           child: const Text(
                    //             "Xóa hồ sơ",
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.w500),
                    //           ),
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         width: 38,
                    //       ),
                    //       Container(
                    //         width: 170,
                    //         height: 50,
                    //         alignment: Alignment.center,
                    //         decoration: BoxDecoration(
                    //             color: const Color(0xffFFBF00),
                    //             borderRadius: BorderRadius.circular(4)),
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             Get.toNamed(Routes.updateBird);
                    //           },
                    //           child: const Text(
                    //             "Chỉnh sửa",
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.w500),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                  ],
                ),
              );
              // return ListView(
              //   // crossAxisAlignment: CrossAxisAlignment.start,
              //   children: []);
            }),
            // _buildGalleries(),
          ],
        ),
      ),
      // body: SlidingUpPanel(
      //   body: Container(
      //     // alignment: Alignment.topCenter,
      //     child: Obx(() {
      //       var tmp = controller.tournament.value;
      //       print("object" + tmp.tournament_Id.toString());
      //       return Text("data");
      //     }),
      //     child: Text("This is the Widget behind the sliding panel"),
      //       child: Stack(
      //         children: [
      //           Container(
      //             margin: const EdgeInsets.only(top: 25),
      //             child: Image.network(
      //               "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2022/05/1e986ed0-chim-chao-mao-an-gi-3.jpg",
      //               // height: screenSize.height * 0.3,
      //               //width: screenSize.width * 0.9,
      //             ),
      //           ),
      //           Container(
      //             margin: const EdgeInsets.only(top: 320),
      //             child: const Column(
      //               children: [
      //                 Text(
      //                   "Mô tả",
      //                   textAlign: TextAlign.center,
      //                 ),
      //                 SizedBox(
      //                   height: 10,
      //                 ),
      //                 Expanded(
      //                     child: Text(
      //                         "NHẰM THỨC ĐẨY PHONG TRÀO CHIM CẢNH CHO ACE NGHỆ NHÂN CẢNH CHO ACE NGHỆ NHÂN Trường Chim TUẤN CÓNG")),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     panel: Container(
      //       child: Column(
      //         children: [
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           const Text(
      //             "Đăng kí",
      //             textAlign: TextAlign.center,
      //             style: TextStyle(
      //               fontSize: 25,
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           Column(
      //             children: [
      //               GestureDetector(
      //                 onTap: () {
      //                   Get.toNamed(Routes.checkinBird);
      //                 },
      //                 child: Container(
      //                   width: screenSize.width * 0.85,
      //                   height: screenSize.height * 0.08,
      //                   // alignment: Alignment.center,
      //                   decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(20),
      //                       border: Border.all(color: Colors.black)),
      //                   child: GestureDetector(
      //                     child: Row(
      //                       children: [
      //                         const SizedBox(
      //                           width: 20,
      //                         ),
      //                         Image.network(
      //                           "https://chimchaomao.vn/upload/baiviet/logomobile-4993.png",
      //                           width: 30,
      //                           height: 30,
      //                         ),
      //                         const SizedBox(
      //                           width: 20,
      //                         ),
      //                         const Text(
      //                           "Chim chào mào một",
      //                           textAlign: TextAlign.right,
      //                           style: TextStyle(
      //                               fontSize: 20, fontWeight: FontWeight.w500),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 20,
      //               ),
      //               GestureDetector(
      //                 onTap: () {
      //                   Get.toNamed(Routes.checkinBird);
      //                 },
      //                 child: Container(
      //                   width: screenSize.width * 0.85,
      //                   height: screenSize.height * 0.08,
      //                   // alignment: Alignment.center,
      //                   decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(20),
      //                       border: Border.all(color: Colors.black)),
      //                   child: GestureDetector(
      //                     child: Row(
      //                       children: [
      //                         const SizedBox(
      //                           width: 20,
      //                         ),
      //                         Image.network(
      //                           "https://chimchaomao.vn/upload/baiviet/logomobile-4993.png",
      //                           width: 30,
      //                           height: 30,
      //                         ),
      //                         const SizedBox(
      //                           width: 20,
      //                         ),
      //                         const Text(
      //                           "Chim chào mào một",
      //                           textAlign: TextAlign.right,
      //                           style: TextStyle(
      //                               fontSize: 20, fontWeight: FontWeight.w500),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           Container(
      //             width: screenSize.width * 0.55,
      //             height: screenSize.height * 0.05,
      //             alignment: Alignment.center,
      //             decoration: BoxDecoration(
      //                 color: const Color(0xff00CC00),
      //                 borderRadius: BorderRadius.circular(4)),
      //             child: GestureDetector(
      //               onTap: () {
      //                 Get.toNamed(Routes.chooseBird);
      //               },
      //               child: const Text(
      //                 "Đăng ký thi đấu",
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.w500),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //   ),
      //   // collapsed: Container(
      //   //   decoration:
      //   //       BoxDecoration(color: Colors.blueGrey, borderRadius: radius),
      //   //   child: Container(
      //   //     child: Text(
      //   //       "This is the collapsed Widget",
      //   //       style: TextStyle(color: Colors.white),
      //   //     )
      //   //     ,child: TournamentTabView(),
      //   //   ),
      //   // ),

      //   borderRadius: radius,
      // ),
    );
    // return SafeArea(
    //   child: Scaffold(
    //     // appBar: AppBar(),
    //     body: Container(
    //       child: Column(
    //         children: [
    //           Container(
    //             child: Image.network(
    //                 "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2022/05/1e986ed0-chim-chao-mao-an-gi-3.jpg"),
    //           ),
    //           SafeArea(
    //             child: Container(
    //               child: Text("A"),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
