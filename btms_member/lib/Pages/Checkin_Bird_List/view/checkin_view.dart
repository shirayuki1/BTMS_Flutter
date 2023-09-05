// import 'package:btms/Pages/CheckinList/controller/checkin_controller.dart';
// import 'package:btms/Routes/routes.dart';
import 'package:btms_member/Constants/Color/hexa_color.dart';
import 'package:btms_member/Pages/Checkin_Bird_List/controller/checkin_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckinScreen extends GetView<CheckinController> {
  const CheckinScreen({super.key});

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
        title: const Column(
          children: [
            Text(
              "Điểm danh",
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
              Obx(() {
                var listBirdRegister = controller.birdRegisterList;
                if (listBirdRegister.isEmpty) {
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
                    margin: const EdgeInsets.only(right: 15, left: 15, top: 15),
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      addSemanticIndexes: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listBirdRegister.length,
                      itemBuilder: (BuildContext ctv, index) {
                        final birdRegister = listBirdRegister[index];
                        if (birdRegister.status!.toUpperCase() == "CHECK_IN") {
                          return GestureDetector(
                            onTap: () {
                              // controller.goToDetail(bird.bird_Id);
                              controller.goToDetailBird(birdRegister.birdId);
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
                              // alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black),
                                color: HexColor("#CCFFFF"),
                              ),
                              child: GestureDetector(
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 70,
                                      ),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Số báo danh:",
                                            // textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 0,
                                            child: Text(
                                              birdRegister.candidate_Number
                                                          .toString() ==
                                                      "null"
                                                  ? "Chưa có số báo danh"
                                                  : birdRegister
                                                      .candidate_Number
                                                      .toString(),
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Tên chim:",
                                            // textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 0,
                                            child: Text(
                                              birdRegister.bird!.name
                                                  .toString(),
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              left: 15,
                                            ),
                                            child: const Text(
                                              "Ngày đã đăng ký:",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            Formatter.date(
                                                birdRegister.createdDate),
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Trạng thái thanh toán:",
                                            // textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 0,
                                            child: Text(
                                              // birdRegister.payment_Status
                                              //     .toString(),
                                              controller.updateStatus(
                                                  birdRegister.payment_Status
                                                      .toString())!,
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Trạng thái điểm danh:",
                                            // textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 0,
                                            child: Text(
                                              // birdRegister.status.toString(),
                                              controller.updateStatus1(
                                                  birdRegister.status
                                                      .toString())!,
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              // controller.goToDetail(bird.bird_Id);
                              controller.goToDetailBird(birdRegister.birdId);
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
                              // alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black),
                                color: HexColor("#e5e4e2"),
                              ),
                              child: GestureDetector(
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 70,
                                      ),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Số báo danh:",
                                            // textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 0,
                                            child: Text(
                                              birdRegister.candidate_Number
                                                          .toString() ==
                                                      "null"
                                                  ? "Chưa có số báo danh"
                                                  : birdRegister
                                                      .candidate_Number
                                                      .toString(),
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Tên chim:",
                                            // textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 0,
                                            child: Text(
                                              birdRegister.bird!.name
                                                  .toString(),
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              left: 15,
                                            ),
                                            child: const Text(
                                              "Ngày đã đăng ký:",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            Formatter.date(
                                                birdRegister.createdDate),
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Trạng thái thanh toán:",
                                            // textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 0,
                                            child: Text(
                                              // birdRegister.payment_Status
                                              //     .toString(),
                                              controller.updateStatus(
                                                  birdRegister.payment_Status
                                                      .toString())!,
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Trạng thái điểm danh:",
                                            // textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 0,
                                            child: Text(
                                              // birdRegister.status.toString(),
                                              controller.updateStatus1(
                                                  birdRegister.status
                                                      .toString())!,
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  );
                }
              }),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
