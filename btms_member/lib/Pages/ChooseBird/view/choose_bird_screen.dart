// import 'package:btms/Pages/ChooseBird/controller/choose_bird_controller.dart';
// import 'package:btms/Routes/routes.dart';
import 'package:btms_member/Constants/Color/hexa_color.dart';
import 'package:btms_member/Data/selected_bird.dart';
import 'package:btms_member/Models/bird.dart';
import 'package:btms_member/Pages/ChooseBird/controller/choose_bird_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class ChooseBirdScreen extends GetView<ChooseBirdController> {
  const ChooseBirdScreen({super.key});

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
            Get.toNamed(Routes.comingTourDetail);
            controller.getBirdList();
          },
        ),
        elevation: 1,
        title: const Text(
          'Danh sách chim',
          style: TextStyle(color: Colors.black, fontSize: 35),
        ),
      ),
      body: Obx(() {
        var listbird = controller.birdListSelected;
        if (listbird.isEmpty) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: HexColor("#DDDDDD"),
                ),
                // margin: const EdgeInsets.only(
                //   top: 5,
                // ),
                height: screenSize.height * 0.80,
                child: const Center(
                  child: Text(
                    "Chưa có danh sách chim sẵn sàng thi đấu!",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 15,
                  bottom: 10,
                ),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.createBird_1);
                      },
                      child: Container(
                        width: 170,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffFF0000),
                            borderRadius: BorderRadius.circular(4)),
                        child: const Text(
                          "Tạo hồ sơ chim",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        // controller.addToCart();
                      },
                      child: Container(
                        width: 170,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 88, 86, 81),
                            borderRadius: BorderRadius.circular(4)),
                        child: const Text(
                          "Lưu chim đăng ký",
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
            ],
          );
        } else {
          return Column(children: [
            Container(
              decoration: BoxDecoration(
                color: HexColor("#DDDDDD"),
              ),
              // margin: const EdgeInsets.only(
              //   top: 5,
              // ),
              height: screenSize.height * 0.82,
              child: ListView.builder(
                addSemanticIndexes: true,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: controller.birdListSelected.length,
                itemBuilder: ((context, index) {
                  // itemBuilder: (BuildContext ctv, index) {
                  final bird = listbird[index];

                  // final bird = controller.birdListSelected[index];
                  return Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              bird.isSelected.value = !bird.isSelected.value;

                              // controller
                              //         .birdListSelected[index].isSelected.value =
                              //     !controller
                              //         .birdListSelected[index].isSelected.value;
                            },
                            child: Container(
                              width: screenSize.width * 0.9,
                              height: screenSize.height * 0.15,
                              margin: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 8,
                                top: 4,
                              ),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: bird.isSelected.value
                                    ? Colors.green[200]
                                    : Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 100,
                                    margin: const EdgeInsets.only(
                                      left: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.network(
                                      bird.bannerUrl1.toString() == "null"
                                          ? "https://cdn.wikifarm.vn/2023/03/chim-chao-mao-7.jpg"
                                          : bird.bannerUrl1.toString(),
                                      cacheHeight: 80,
                                      cacheWidth: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
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
                                                "${bird.weight1} Kg",
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
                                                "${bird.height1} Cm",
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
                                                "Trạng thái:",
                                                // textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  // color: Colors.red,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 1,
                                              ),
                                              Expanded(
                                                flex: 0,
                                                child: Text(
                                                  controller.updateStatus(
                                                      bird.status1.toString())!,
                                                  textAlign: TextAlign.right,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ));
                }),
              ),
            ),
//////
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.createBird_1);
                  },
                  child: Container(
                    width: 170,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xffFF0000),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text(
                      "Tạo hồ sơ chim",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    controller.addToCart();
                  },
                  child: Container(
                    width: 170,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFBF00),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text(
                      "Lưu chim đăng ký",
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

            /////////////
          ]);
        }
      }),
    );
  }
}




             






















      //         body: Container(
      //   child: Column(
      //     children: [
      //       Container(
      //         margin: EdgeInsets.only(
      //           top: 20,
      //         ),
      //         height: screenSize.height * 0.7,
      //         child: ListView.builder(
        // addSemanticIndexes: true,
        //             shrinkWrap: true,
        //             scrollDirection: Axis.vertical,
      //           itemCount: controller.birdListSelected.length,
      //           itemBuilder: ((context, index) {
      //             // itemBuilder: (BuildContext ctv, index) {
      //             // final bird = controller.birdListSelected[index];
      //             return Obx(() => Column(
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   children: [
      //                     GestureDetector(
      //                       onTap: () {
      //                         // bird.isSelected.value = !bird.isSelected.value;

      //                         controller.birdListSelected[index].isSelected
      //                                 .value =
      //                             !controller
      //                                 .birdListSelected[index].isSelected.value;
      //                       },
      //                       child: Container(
      //                         width: screenSize.width * 0.9,
      //                         margin: const EdgeInsets.only(
      //                           left: 15,
      //                           right: 15,
      //                           bottom: 8,
      //                           top: 4,
      //                         ),
      //                         padding: EdgeInsets.all(15),
      //                         decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(10),
      //                           color: controller.birdListSelected[index]
      //                                   .isSelected.value
      //                               ? Colors.green[200]
      //                               : Colors.white,
      //                         ),
      //                         child: Text(
      //                           controller.birdListSelected[index].name
      //                               .toString(),
      //                           style: TextStyle(
      //                             fontSize: 15,
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ));
      //           }),
      //         ),
      //       ),
      //       Container(
      //         margin: EdgeInsets.only(
      //           bottom: 50,
      //         ),
      //         alignment: Alignment.bottomCenter,
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Container(
      //               width: 170,
      //               height: 50,
      //               alignment: Alignment.center,
      //               child: GestureDetector(
      //                 onTap: () {
      //                   Get.toNamed(Routes.createBird);
      //                 },
      //                 child: Text(
      //                   "Tạo hồ sơ chim",
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 20,
      //                       fontWeight: FontWeight.w500),
      //                 ),
      //               ),
      //               decoration: BoxDecoration(
      //                   color: Color(0xffFF0000),
      //                   borderRadius: BorderRadius.circular(4)),
      //             ),
      //             SizedBox(
      //               width: 38,
      //             ),
      //             Container(
      //               width: 170,
      //               height: 50,
      //               alignment: Alignment.center,
      //               child: GestureDetector(
      //                 onTap: () {
      //                   // Get.toNamed(Routes.updateBird);
      //                   controller.registerTournament();
      //                 },
      //                 child: const Text(
      //                   "Thanh toán",
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 20,
      //                       fontWeight: FontWeight.w500),
      //                 ),
      //               ),
      //               decoration: BoxDecoration(
      //                   color: Color(0xffFFBF00),
      //                   borderRadius: BorderRadius.circular(4)),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    

    // child: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             Obx(() {
    //               var listBird = controller.birdListSelected;
    //               return Container(
    //                 child: ListView.builder(
    //                   addSemanticIndexes: true,
    //                   shrinkWrap: true,
    //                   scrollDirection: Axis.vertical,
    //                   itemCount: controller.birdListSelected.length,
    //                   itemBuilder: ((BuildContext ctv, index) {
    //                     return Obx(() {
    //                       return GestureDetector(
    //                         onTap: () {
    //                           // bird.isSelected.value = !bird.isSelected.value;
    //                           controller.birdListSelected[index].isSelected
    //                                   .value =
    //                               !controller
    //                                   .birdListSelected[index].isSelected.value;
    //                         },
    //                         child: Container(
    //                           width: screenSize.width * 0.9,
    //                           margin: const EdgeInsets.only(
    //                             left: 15,
    //                             right: 15,
    //                             bottom: 8,
    //                             top: 4,
    //                           ),
    //                           padding: EdgeInsets.all(15),
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(10),
    //                             color: controller.birdListSelected[index]
    //                                     .isSelected.value
    //                                 ? Colors.green[200]
    //                                 : Colors.white,
    //                           ),
    //                           child: Text(
    //                             controller.birdListSelected[index].name
    //                                 .toString(),
    //                             style: TextStyle(
    //                               fontSize: 15,
    //                             ),
    //                           ),
    //                         ),
    //                       );
    //                     });
    //                   }),
    //                 ),
    //               );
    //             }),
    //           ],
    //         ),
    //       ),




    