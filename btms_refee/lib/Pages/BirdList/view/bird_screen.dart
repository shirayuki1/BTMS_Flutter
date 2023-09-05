import 'package:btms_refee/Pages/BirdList/controller/bird_controller.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BirdScreen extends GetView<BirdController> {
  const BirdScreen({super.key});

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
                    height: screenSize.height * 0.75,
                    margin: const EdgeInsets.only(right: 15, left: 15, top: 15),
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
                            height: 110,
                            margin: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black)),
                            child: GestureDetector(
                              child: Row(
                                // mainAxisSize: MainAxisSize.min,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.network(
                                      "https://cdn.wikifarm.vn/2023/03/chim-chao-mao-7.jpg",
                                      height: 80,
                                      width: 150,
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
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Tên:",
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
                                                bird.name.toString(),
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Cân nặng:",
                                              // textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "${bird.weight} Kg",
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Chiều cao:",
                                              // textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "${bird.height} Cm",
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
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
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                width: screenSize.width * 0.9,
                height: screenSize.height * 0.05,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xff00CC00),
                    borderRadius: BorderRadius.circular(4)),
                child: GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.createBird);
                  },
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
