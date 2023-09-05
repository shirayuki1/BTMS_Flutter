// import 'package:btms/Pages/Setting/controller/setting_controller.dart';
// import 'package:btms/Routes/routes.dart';
// import 'package:btms/Widgets/custom_bottom_bar.dart';
// import 'package:btms/Widgets/setting_title.dart';
import 'package:btms_member/Constants/Color/hexa_color.dart';
import 'package:btms_member/Models/tournament.dart';
import 'package:btms_member/Pages/Cart/controller/cart_controller.dart';
import 'package:btms_member/Pages/ChooseBird/controller/choose_bird_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:btms_member/Utils/formatter.dart';
import 'package:btms_member/Widgets/custom_bottom_bar.dart';
import 'package:btms_member/Widgets/setting_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class CartScreen extends GetView<ChooseBirdController> {
  const CartScreen({super.key});
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
            // controller.birdService;
          },
        ),
        elevation: 1,
        title: const Column(
          children: [
            Text(
              'Danh sách chọn chim',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 35),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Obx(() {
                  var cartList = controller.cartList;
                  if (cartList.isEmpty) {
                    return const Center(
                      child: Text(
                        "Chưa chọn chim để đăng ký hội thi",
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
                      child: ListView.builder(
                        addSemanticIndexes: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: cartList.length,
                        itemBuilder: (BuildContext ctv, index) {
                          final bird = cartList[index];
                          return GestureDetector(
                            onTap: () {
                              // controller.goToDetail(bird.bird_Id);
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
                                color: HexColor("#CCFFCC"),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black),
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
                                      bird.bannerUrl.toString() == "null"
                                          ? "https://cdn.wikifarm.vn/2023/03/chim-chao-mao-7.jpg"
                                          : bird.bannerUrl.toString(),
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
                                                "${bird.weight} Kg",
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
                                                "${bird.height} Cm",
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
                                                      bird.status.toString())!,
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
                          );
                        },
                      ),
                    );
                  }
                }),
              ),
              // Container(
              //   height: 50,
              //   margin: const EdgeInsets.only(
              //     top: 20,
              //     bottom: 10,
              //     left: 20,
              //     right: 20,
              //   ),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       const Text(
              //         "Số tiền của một lồng: ",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //             color: Colors.red,
              //             fontSize: 20,
              //             fontWeight: FontWeight.w500),
              //       ),
              //       Container(
              //         margin: const EdgeInsets.only(
              //           left: 70,
              //           // right: 20,
              //         ),
              //         child: Text(
              //           "${controller.price} VNĐ",
              //           textAlign: TextAlign.right,
              //           style: const TextStyle(
              //             color: Colors.red,
              //             fontSize: 20,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // // Row(
              //   // crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Text(
              //       "Giá tiền của một lồng: ",
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //           color: Colors.red,
              //           fontSize: 20,
              //           fontWeight: FontWeight.w500),
              //     ),
              //     SizedBox(
              //       width: 55,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              //     Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Text(
              //           "Tổng thanh toán: ",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               color: Colors.red,
              //               fontSize: 20,
              //               fontWeight: FontWeight.w500),
              //         ),
              //         SizedBox(
              //           width: 55,
              //         ),
              //         Text(
              //           " VND",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               color: Colors.red,
              //               fontSize: 20,
              //               fontWeight: FontWeight.w500),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                alignment: Alignment.bottomCenter,
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         Get.back(closeOverlays: true);
                //       },
                //       child: Container(
                //         width: 170,
                //         height: 50,
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //             color: Color(0xffFF0000),
                //             borderRadius: BorderRadius.circular(4)),
                //         child: const Text(
                //           "Hủy thanh toán",
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 20,
                //               fontWeight: FontWeight.w500),
                //         ),
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 38,
                //     ),
                child: GestureDetector(
                  onTap: () {
                    controller.registerTournament();
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 72, 255, 0),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text(
                      "Đăng ký thi đấu",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                // ],
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
