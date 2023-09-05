// import 'package:btms/Pages/BirdList/controller/bird_controller.dart';
// import 'package:btms/Routes/routes.dart';
// import 'package:btms/Widgets/fade_amimation.dart';
import 'package:btms_member/Constants/Color/hexa_color.dart';
import 'package:btms_member/Pages/BirdList/controller/bird_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

class BirdScreen extends GetView<BirdController> {
  BirdScreen({super.key});

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
            // Get.back(closeOverlays: true);
            Get.toNamed(Routes.setting);
          },
        ),
        elevation: 1,
        title: const Column(
          children: [
            Text(
              'Danh sách chim',
              style: TextStyle(color: Colors.black, fontSize: 35),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(() {
                var listBird = controller.birdList;
                if (listBird.isEmpty) {
                  return const Center(
                    child: Text(
                      "Chưa có sở hữu chim chào mào nào!",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: screenSize.height * 0.8,
                    margin: const EdgeInsets.only(
                      right: 15,
                      left: 15,
                      top: 5,
                    ),
                    alignment: Alignment.center,
                    child: ListView.builder(
                      addSemanticIndexes: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listBird.length,
                      itemBuilder: (BuildContext ctv, index) {
                        final bird = listBird[index];
                        return GestureDetector(
                          onTap: () {
                            controller.goToDetail(bird.bird_Id);
                          },
                          child: Container(
                            height: 150,
                            margin: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: HexColor("#CCFFFF"),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black)),
                            child: GestureDetector(
                              child: Row(
                                // mainAxisSize: MainAxisSize.min,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    margin: const EdgeInsets.only(
                                      left: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black12,
                                      ),
                                    ),
                                    child: Image.network(
                                      bird.bannerUrl.toString() == "null"
                                          ? "https://cdn.wikifarm.vn/2023/03/chim-chao-mao-7.jpg"
                                          : bird.bannerUrl.toString(),
                                      cacheHeight: 95,
                                      cacheWidth: 95,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.only(
                                            left: 40,
                                            bottom: 5,
                                          ),
                                          child: Row(
                                            children: [
                                              const Text(
                                                "Tên:",
                                                // textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                flex: 0,
                                                child: Text(
                                                  bird.name.toString(),
                                                  textAlign: TextAlign.right,
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.deepPurple,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.only(
                                            left: 5,
                                          ),
                                          child: Row(
                                            children: [
                                              const Text(
                                                "Cân nặng:",
                                                // textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "${bird.weight} gram",
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.only(
                                            left: 5,
                                          ),
                                          child: Row(
                                            children: [
                                              const Text(
                                                "Chiều cao:",
                                                // textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                "${bird.height} cm",
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.only(
                                            left: 5,
                                          ),
                                          child: Row(
                                            children: [
                                              const Text(
                                                "Trạng thái: ",
                                                // textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Expanded(
                                                flex: 0,
                                                child: Text(
                                                  bird.status.toString() ==
                                                          "READY"
                                                      ? "Có thể đăng ký"
                                                      : "Đang trong giải đấu",
                                                  textAlign: TextAlign.right,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Container(
                                        //   alignment: Alignment.center,
                                        //   margin: const EdgeInsets.only(
                                        //     left: 5,
                                        //   ),
                                        //   child: Row(
                                        //     children: [
                                        //       const Text(
                                        //         "Giống chim: ",
                                        //         // textAlign: TextAlign.right,
                                        //         style: TextStyle(
                                        //           fontSize: 18,
                                        //           fontWeight: FontWeight.bold,
                                        //           // color: Colors.red,
                                        //         ),
                                        //       ),
                                        //       const SizedBox(
                                        //         width: 1,
                                        //       ),
                                        //       Expanded(
                                        //         flex: 0,
                                        //         child: Text(
                                        //           bird.gender.toString() ==
                                        //                   "FEMALE"
                                        //               ? "Cái"
                                        //               : "Đực",
                                        //           // controller.updateGender(
                                        //           //     bird.gender.toString())!,
                                        //           textAlign: TextAlign.right,
                                        //           style: const TextStyle(
                                        //             fontSize: 18,
                                        //             fontWeight: FontWeight.w500,
                                        //             // color: Colors.red,
                                        //           ),
                                        //         ),
                                        //       )
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.createBird);
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 15,
                    left: 5,
                    right: 5,
                    bottom: 10,
                  ),
                  width: screenSize.width * 0.75,
                  height: screenSize.height * 0.05,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xff00CC00),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Tạo mới hồ sơ chim",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
