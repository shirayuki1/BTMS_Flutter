import 'dart:io';
import 'dart:ui';
import 'dart:async';
// import 'package:btms/Pages/BirdInformation/controller/bird_information_controller.dart';
// import 'package:btms/Routes/routes.dart';
import 'package:btms_member/Constants/Color/hexa_color.dart';
import 'package:btms_member/Pages/BirdInformation/controller/bird_information_controller.dart';
import 'package:btms_member/Pages/BirdList/controller/bird_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:cached_video_preview/cached_video_preview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:path/path.dart' as p;

class BirdInformationScreen extends GetView<BirdInformationController> {
  bool isDownloading = true;

  // BirdInformationScreen({super.key});
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
            controller.onClose();
          },
        ),
        elevation: 1,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Thông tin chim',
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
            children: [
              Obx(
                () {
                  var bird = controller.bird.value;
                  print("123 $bird");
                  if (bird.status!.toUpperCase() == "ON_TOURNAMENT") {
                    return Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 15,
                              ),
                              width: 100,
                              child: const Text(
                                "Tên:",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(
                              bird.name.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 15,
                              ),
                              width: 100,
                              child: const Text(
                                "Đặc tính nhận dạng:",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: Text(
                                bird.identifyingCharacteristics.toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       margin: const EdgeInsets.only(
                        //         left: 15,
                        //       ),
                        //       width: 100,
                        //       child: const Text(
                        //         "Giới tính:",
                        //         style: TextStyle(
                        //             fontSize: 20, fontWeight: FontWeight.bold),
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       width: 25,
                        //     ),
                        //     Text(
                        //       bird.gender.toString(),
                        //       style: const TextStyle(fontSize: 20),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 15,
                              ),
                              width: 100,
                              child: const Text(
                                "Cân nặng:",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(
                              "${bird.weight} gram",
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
                              width: 100,
                              child: const Text(
                                "Chiều cao:",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(
                              "${bird.height} cm",
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
                              width: 100,
                              child: const Text(
                                "Màu sắc:",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: Text(
                                bird.color.toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        //Image
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Row(
                            children: [
                              const Text(
                                "Hình ảnh:",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) {
                                  //   // do something
                                  //   return MultiFileUplaodScreen();
                                  // }));
                                },
                                child: Container(
                                  width: 200,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    // color: HexColor("#00EE00"),
                                    color: Colors.black54,

                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    "Chọn hình ảnh",
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
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 5,
                            right: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                          ),
                          height: screenSize.height * 0.35,
                          width: screenSize.width * 0.9,
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Obx(() {
                                    var imageList = controller.imgList.value;
                                    if (imageList.isEmpty) {
                                      return const Center(
                                        child: Text(
                                          "Chưa có sở hữu hình ảnh chào mào nào!",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return GridView.count(
                                          crossAxisCount: 2,
                                          children: List.generate(
                                              imageList.length, (int index) {
                                            final img = imageList[index];
                                            return Card(
                                              // margin: EdgeInsets.only(
                                              //   left: 15,
                                              //   right: 15,
                                              //   bottom: 10,
                                              // ),
                                              elevation: 2,
                                              child: GestureDetector(
                                                child: Container(
                                                  // child: Hero(
                                                  //   tag: "customBackground",
                                                  //   child: ClipRRect(
                                                  //     borderRadius: BorderRadius.circular(5),
                                                  //     // child: imagPr
                                                  //     child: HtmlWwidget(
                                                  //       // 'https://png.pngtree.com/element_our/md/20180517/md_5afd56a7b8054.jpg',
                                                  //       img.media.toString(),
                                                  //       fit: BoxFit.cover,
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  width: 185,
                                                  height: 185,
                                                  child:
                                                      CachedVideoPreviewWidget(
                                                    path: img.link.toString(),
                                                    type: SourceType.remote,
                                                    remoteImageBuilder:
                                                        (BuildContext context,
                                                                url) =>
                                                            Image.network(
                                                      img.link.toString(),
                                                      cacheHeight: 185,
                                                      cacheWidth: 185,
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  openFile(
                                                    url: img.link.toString(),
                                                    // opt. fileName: file.pdf
                                                  );
                                                  // showViewer(_document);
                                                  //OpenFile.open("/sdcard/example.pptx");
                                                },
                                              ),
                                            );
                                          }));
                                      // Container(
                                      //     padding: EdgeInsets.only(right: 5, left: 5),
                                      //     alignment: Alignment.center,
                                      //     child: ListView.separated(
                                      //         separatorBuilder: (context, index) => Divider(
                                      //               height: 3,
                                      //               thickness: 0.1,
                                      //               color: Colors.white,
                                      //               indent: 5,
                                      //               endIndent: 10,
                                      //             ),
                                      //         addSemanticIndexes: true,
                                      //         shrinkWrap: true,
                                      //         scrollDirection: Axis.vertical,
                                      //         itemCount: imageList.length,
                                      //         itemBuilder: (BuildContext ctv, index) {
                                      //           final Images = imageList[index];
                                      //           return Card(
                                      //             child: Image.network(
                                      //               Images.link.toString(),
                                      //             ),
                                      //           );
                                      //         }));
                                    }
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Videoconst
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Row(
                            children: [
                              const Text(
                                "Video:",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 125,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) {
                                  //   // do something
                                  //   return VideoPage();
                                  // }));
                                },
                                child: Container(
                                  width: 200,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    // color: HexColor("#00EE00"),
                                    color: Colors.black54,

                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    "Chọn videos",
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
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 5,
                            right: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                          ),
                          height: screenSize.height * 0.35,
                          width: screenSize.width * 0.9,
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Obx(() {
                                    var video = controller.videoList.value;
                                    if (video.isEmpty) {
                                      return const Center(
                                        child: Text(
                                          "Chưa có sở hữu videos chào mào nào!",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return GridView.count(
                                          crossAxisCount: 2,
                                          children: List.generate(video.length,
                                              (int index) {
                                            final v = video[index];
                                            return Card(
                                              // margin: EdgeInsets.only(
                                              //   left: 15,
                                              //   right: 15,
                                              //   bottom: 10,
                                              // ),
                                              elevation: 2,
                                              child: GestureDetector(
                                                child: Container(
                                                  // child: Hero(
                                                  //   tag: "customBackground",
                                                  //   child: ClipRRect(
                                                  //     borderRadius: BorderRadius.circular(5),
                                                  //     // child: imagPr
                                                  //     child: HtmlWwidget(
                                                  //       // 'https://png.pngtree.com/element_our/md/20180517/md_5afd56a7b8054.jpg',
                                                  //       img.media.toString(),
                                                  //       fit: BoxFit.cover,
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  width: 185,
                                                  height: 185,
                                                  child:
                                                      CachedVideoPreviewWidget(
                                                    path:
                                                        // 'https://www.youtube.com/watch?v=b_sQ9bMltGU',
                                                        v.link.toString(),
                                                    type: SourceType.remote,
                                                    remoteImageBuilder:
                                                        (BuildContext context,
                                                                url) =>
                                                            Image.network(url),
                                                  ),

                                                  // child: CachedVideoPreviewWidget(
                                                  //   path: v.link.toString(),
                                                  //   type: SourceType.remote,
                                                  //   remoteImageBuilder:
                                                  //       (BuildContext context,
                                                  //               url) =>
                                                  //           Image.network(
                                                  //     v.link.toString(),
                                                  //     cacheHeight: 185,
                                                  //     cacheWidth: 185,
                                                  //   ),
                                                  // ),
                                                ),
                                                onTap: () {
                                                  openFile(
                                                    url: v.link.toString(),
                                                    // opt. fileName: file.pdf
                                                  );
                                                  // showViewer(_document);
                                                  //OpenFile.open("/sdcard/example.pptx");
                                                },
                                              ),
                                            );
                                          }));
                                      // Container(
                                      //     padding: EdgeInsets.only(right: 5, left: 5),
                                      //     alignment: Alignment.center,
                                      //     child: ListView.separated(
                                      //         separatorBuilder: (context, index) => Divider(
                                      //               height: 3,
                                      //               thickness: 0.1,
                                      //               color: Colors.white,
                                      //               indent: 5,
                                      //               endIndent: 10,
                                      //             ),
                                      //         addSemanticIndexes: true,
                                      //         shrinkWrap: true,
                                      //         scrollDirection: Axis.vertical,
                                      //         itemCount: imageList.length,
                                      //         itemBuilder: (BuildContext ctv, index) {
                                      //           final Images = imageList[index];
                                      //           return Card(
                                      //             child: Image.network(
                                      //               Images.link.toString(),
                                      //             ),
                                      //           );
                                      //         }));
                                    }
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Container(
                        //   // margin: EdgeInsets.only(left:),
                        //   height: screenSize.height * 0.35,
                        //   width: screenSize.width * 0.95,
                        //   child: _buildGalleries(),
                        // ),
                        //Button
                        const SizedBox(
                          height: 35,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                            bottom: 15,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // controller.deleteBird();
                                },
                                child: Container(
                                  width: 170,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const Text(
                                    "Xóa hồ sơ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 38,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Get.toNamed(Routes.updateBird);
                                },
                                child: Container(
                                  width: 170,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const Text(
                                    "Chỉnh sửa",
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
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 15,
                              ),
                              width: 100,
                              child: const Text(
                                "Tên:",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(
                              bird.name.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 15,
                              ),
                              width: 100,
                              child: const Text(
                                "Đặc tính nhận dạng:",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: Text(
                                bird.identifyingCharacteristics.toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       margin: const EdgeInsets.only(
                        //         left: 15,
                        //       ),
                        //       width: 100,
                        //       child: const Text(
                        //         "Giới tính:",
                        //         style: TextStyle(
                        //             fontSize: 20, fontWeight: FontWeight.bold),
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       width: 25,
                        //     ),
                        //     Text(
                        //       bird.gender.toString(),
                        //       style: const TextStyle(fontSize: 20),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 15,
                              ),
                              width: 100,
                              child: const Text(
                                "Cân nặng:",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(
                              "${bird.weight} gram",
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
                              width: 100,
                              child: const Text(
                                "Chiều cao:",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(
                              "${bird.height} cm",
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
                              width: 100,
                              child: const Text(
                                "Màu sắc:",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: Text(
                                bird.color.toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        //Image
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Row(
                            children: [
                              const Text(
                                "Hình ảnh:",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    // do something
                                    return MultiFileUplaodScreen();
                                  }));
                                },
                                child: Container(
                                  width: 200,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: HexColor("#00EE00"),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    "Chọn hình ảnh",
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
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 5,
                            right: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                          ),
                          height: screenSize.height * 0.35,
                          width: screenSize.width * 0.9,
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Obx(() {
                                    var imageList = controller.imgList.value;
                                    if (imageList.isEmpty) {
                                      return const Center(
                                        child: Text(
                                          "Chưa có sở hữu hình ảnh chào mào nào!",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return GridView.count(
                                          crossAxisCount: 2,
                                          children: List.generate(
                                              imageList.length, (int index) {
                                            final img = imageList[index];
                                            return Card(
                                              // margin: EdgeInsets.only(
                                              //   left: 15,
                                              //   right: 15,
                                              //   bottom: 10,
                                              // ),
                                              elevation: 2,
                                              child: GestureDetector(
                                                child: Container(
                                                  // child: Hero(
                                                  //   tag: "customBackground",
                                                  //   child: ClipRRect(
                                                  //     borderRadius: BorderRadius.circular(5),
                                                  //     // child: imagPr
                                                  //     child: HtmlWwidget(
                                                  //       // 'https://png.pngtree.com/element_our/md/20180517/md_5afd56a7b8054.jpg',
                                                  //       img.media.toString(),
                                                  //       fit: BoxFit.cover,
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  width: 185,
                                                  height: 185,
                                                  child:
                                                      CachedVideoPreviewWidget(
                                                    path: img.link.toString(),
                                                    type: SourceType.remote,
                                                    remoteImageBuilder:
                                                        (BuildContext context,
                                                                url) =>
                                                            Image.network(
                                                      img.link.toString(),
                                                      cacheHeight: 185,
                                                      cacheWidth: 185,
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  openFile(
                                                    url: img.link.toString(),
                                                    // opt. fileName: file.pdf
                                                  );
                                                  // showViewer(_document);
                                                  //OpenFile.open("/sdcard/example.pptx");
                                                },
                                              ),
                                            );
                                          }));
                                      // Container(
                                      //     padding: EdgeInsets.only(right: 5, left: 5),
                                      //     alignment: Alignment.center,
                                      //     child: ListView.separated(
                                      //         separatorBuilder: (context, index) => Divider(
                                      //               height: 3,
                                      //               thickness: 0.1,
                                      //               color: Colors.white,
                                      //               indent: 5,
                                      //               endIndent: 10,
                                      //             ),
                                      //         addSemanticIndexes: true,
                                      //         shrinkWrap: true,
                                      //         scrollDirection: Axis.vertical,
                                      //         itemCount: imageList.length,
                                      //         itemBuilder: (BuildContext ctv, index) {
                                      //           final Images = imageList[index];
                                      //           return Card(
                                      //             child: Image.network(
                                      //               Images.link.toString(),
                                      //             ),
                                      //           );
                                      //         }));
                                    }
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //Videoconst
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          margin: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Row(
                            children: [
                              const Text(
                                "Video:",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    // do something
                                    return VideoPage();
                                  }));
                                },
                                child: Container(
                                  width: 200,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: HexColor("#00EE00"),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    "Chọn videos",
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
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 5,
                            right: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                          ),
                          height: screenSize.height * 0.35,
                          width: screenSize.width * 0.9,
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Obx(() {
                                    var video = controller.videoList.value;
                                    if (video.isEmpty) {
                                      return const Center(
                                        child: Text(
                                          "Chưa có sở hữu videos chào mào nào!",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return GridView.count(
                                          crossAxisCount: 2,
                                          children: List.generate(video.length,
                                              (int index) {
                                            final v = video[index];
                                            return Card(
                                              // margin: EdgeInsets.only(
                                              //   left: 15,
                                              //   right: 15,
                                              //   bottom: 10,
                                              // ),
                                              elevation: 2,
                                              child: GestureDetector(
                                                child: Container(
                                                  // child: Hero(
                                                  //   tag: "customBackground",
                                                  //   child: ClipRRect(
                                                  //     borderRadius: BorderRadius.circular(5),
                                                  //     // child: imagPr
                                                  //     child: HtmlWwidget(
                                                  //       // 'https://png.pngtree.com/element_our/md/20180517/md_5afd56a7b8054.jpg',
                                                  //       img.media.toString(),
                                                  //       fit: BoxFit.cover,
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  width: 185,
                                                  height: 185,
                                                  child:
                                                      CachedVideoPreviewWidget(
                                                    path:
                                                        // 'https://www.youtube.com/watch?v=b_sQ9bMltGU',
                                                        v.link.toString(),
                                                    type: SourceType.remote,
                                                    remoteImageBuilder:
                                                        (BuildContext context,
                                                                url) =>
                                                            Image.network(url),
                                                  ),

                                                  // child: CachedVideoPreviewWidget(
                                                  //   path: v.link.toString(),
                                                  //   type: SourceType.remote,
                                                  //   remoteImageBuilder:
                                                  //       (BuildContext context,
                                                  //               url) =>
                                                  //           Image.network(
                                                  //     v.link.toString(),
                                                  //     cacheHeight: 185,
                                                  //     cacheWidth: 185,
                                                  //   ),
                                                  // ),
                                                ),
                                                onTap: () {
                                                  openFile(
                                                    url: v.link.toString(),
                                                    // opt. fileName: file.pdf
                                                  );
                                                  // showViewer(_document);
                                                  //OpenFile.open("/sdcard/example.pptx");
                                                },
                                              ),
                                            );
                                          }));
                                      // Container(
                                      //     padding: EdgeInsets.only(right: 5, left: 5),
                                      //     alignment: Alignment.center,
                                      //     child: ListView.separated(
                                      //         separatorBuilder: (context, index) => Divider(
                                      //               height: 3,
                                      //               thickness: 0.1,
                                      //               color: Colors.white,
                                      //               indent: 5,
                                      //               endIndent: 10,
                                      //             ),
                                      //         addSemanticIndexes: true,
                                      //         shrinkWrap: true,
                                      //         scrollDirection: Axis.vertical,
                                      //         itemCount: imageList.length,
                                      //         itemBuilder: (BuildContext ctv, index) {
                                      //           final Images = imageList[index];
                                      //           return Card(
                                      //             child: Image.network(
                                      //               Images.link.toString(),
                                      //             ),
                                      //           );
                                      //         }));
                                    }
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Container(
                        //   // margin: EdgeInsets.only(left:),
                        //   height: screenSize.height * 0.35,
                        //   width: screenSize.width * 0.95,
                        //   child: _buildGalleries(),
                        // ),
                        //Button
                        const SizedBox(
                          height: 35,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                            bottom: 15,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.deleteBird();
                                },
                                child: Container(
                                  width: 170,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFF0000),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const Text(
                                    "Xóa hồ sơ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 38,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.updateBird);
                                },
                                child: Container(
                                  width: 170,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFFBF00),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const Text(
                                    "Chỉnh sửa",
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
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      //   body: Container(
      //     padding: EdgeInsets.only(left: 16, top: 25, right: 16),
      //     child: GestureDetector(
      //       onTap: () {
      //         FocusScope.of(context).unfocus();
      //       },
      //       child: ListView(
      //         children: [
      //           Row(
      //             children: [
      //               Text(
      //                 "Tên:",
      //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //               ),
      //               SizedBox(
      //                 width: 25,
      //               ),
      //               Text(
      //                 "Bird",
      //                 style: TextStyle(fontSize: 20),
      //               ),
      //             ],
      //           ),
      //           SizedBox(
      //             height: 15,
      //           ),
      //
    );
  }

  Future openFile({required String url, String? fileName}) async {
    final name = fileName ?? url.split('/').last;
    final file = await (isDownloading ? downloadFile(url, name) : pickFile());
    if (file == null) return;

    print('Path: ${file.path}');
    print('Length: ${file.lengthSync()}');

    OpenFile.open(file.path);
  }

  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return null;

    return File(result.files.first.path!);
  }

  /// Download file into private folder not visible to user
  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');

    try {
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          // receiveTimeout: 0,
        ),
      );

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      print('---------------------');
      return null;
    }
  }
}

// class UploadImage extends StatefulWidget {
//   @override
//   _UploadImageState createState() => _UploadImageState();
// }

// class _UploadImageState extends State<UploadImage> {
//   GlobalKey? globalKey;

//   @override
//   void initState() {
//     super.initState();
//     globalKey = GlobalKey();
//   }

//   List<String> _listImagePaths = [];
//   List<Media> _listVideoPaths = [];
//   List<File> _listImageVideoPaths = [];
//   String? dataImagePath = "";
//   BirdInformationController b = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             Get.back(result: Routes.birdInfo);
//             // controller.onClose();
//           },
//         ),
//         elevation: 1,
//         title: const Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               'Thông tin chim',
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.black, fontSize: 35),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Column(
//           children: <Widget>[
//             GridView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: _listImagePaths.length,
//                 shrinkWrap: true,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     mainAxisSpacing: 20.0,
//                     crossAxisSpacing: 10.0,
//                     childAspectRatio: 1.0),
//                 itemBuilder: (BuildContext context, int index) {
//                   return GestureDetector(
//                     onTap: () {
//                       // BirdInformationController b = Get.find();
//                       // b.getImages();
// //                        ImagePickers.previewImage(_listImagePaths[index].path);

// //                      List<String> paths = [];
// //                        _listImagePaths.forEach((media){
// //                          paths.add(media.path);
// //                        });
// //
// //                        ImagePickers.previewImages(paths,index);
//                       // ImagePickers.previewImages(b.listImagePath, index);
//                       ImagePickers.previewImages(_listImagePaths, index);
//                     },
//                     child: Image.file(
//                       File(
//                         b.listImagePath[index]!,
//                       ),
//                       fit: BoxFit.cover,
//                     ),
//                   );
//                 }),

//             // ElevatedButton(
//             //   onPressed: () async {
//             //     _listImagePaths = await ImagePickers.pickerPaths(
//             //       galleryMode: GalleryMode.image,
//             //       showGif: true,
//             //       selectCount: 5,
//             //       showCamera: true,
//             //       cropConfig:
//             //           CropConfig(enableCrop: true, height: 1, width: 1),
//             //       compressSize: 500,
//             //       uiConfig: UIConfig(
//             //         uiThemeColor: Color(0xffff0000),
//             //       ),
//             //     );
//             //     print(_listImagePaths);
//             //     if (_listImagePaths.length > 0) {
//             //       _listImagePaths.forEach((media) {
//             //         print(media);
//             //       });
//             //     }
//             //     setState(() {});
//             //   },
//             //   child: Text("Chọn ảnh"),
//             // ),
//             // ElevatedButton(
//             //   onPressed: () async {
//             //     ImagePickers.openCamera(
//             //             cropConfig: CropConfig(
//             //                 enableCrop: true, width: 2, height: 3))
//             //         .then((Media? media) {
//             //       _listImagePaths.clear();
//             //       if (media != null) {
//             //         _listImagePaths.add(media);
//             //         print(media.toString());
//             //       }
//             //       setState(() {});
//             //     });
//             //   },
//             //   child: Text("Chụp ảnh"),
//             // ),
//             // ElevatedButton(
//             //   onPressed: () {
//             //     ImagePickers.openCamera(
//             //             cameraMimeType: CameraMimeType.video,
//             //             videoRecordMinSecond: 3,
//             //             videoRecordMaxSecond: 10)
//             //         .then((media) {
//             //       _listVideoPaths.clear();
//             //       if (media != null) {
//             //         print(media.toString());
//             //         _listVideoPaths.add(media);
//             //       }
//             //       setState(() {});
//             //     });
//             //   },
//             //   child: Text("Quay video"),
//             // ),
//             // GridView.builder(
//             //     physics: NeverScrollableScrollPhysics(),
//             //     itemCount: _listVideoPaths.length,
//             //     shrinkWrap: true,
//             //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             //         crossAxisCount: 3,
//             //         mainAxisSpacing: 20.0,
//             //         crossAxisSpacing: 10.0,
//             //         childAspectRatio: 1.0),
//             //     itemBuilder: (BuildContext context, int index) {
//             //       return GestureDetector(
//             //         onTap: () {
//             //           ImagePickers.previewVideo(
//             //             _listVideoPaths[index].path!,
//             //           );
//             //         },
//             //         child: Image.file(
//             //           File(
//             //             _listVideoPaths[index].thumbPath!,
//             //           ),
//             //           fit: BoxFit.cover,
//             //         ),
//             //       );
//             //     }),
//             // ElevatedButton(
//             //   onPressed: () async {
//             //     _listVideoPaths = await ImagePickers.pickerPaths(
//             //       galleryMode: GalleryMode.video,
//             //       videoRecordMinSecond: 3,
//             //       videoRecordMaxSecond: 10,
//             //       // videoSelectMaxSecond: 300,
//             //       videoSelectMinSecond: 5,
//             //       selectCount: 2,
//             //       showCamera: true,
//             //     );
//             //     setState(() {});
//             //     print(_listVideoPaths);
//             //   },
//             //   child: Text("Chọn video"),
//             // ),
//             GridView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: _listImageVideoPaths.length,
//                 shrinkWrap: true,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     mainAxisSpacing: 20.0,
//                     crossAxisSpacing: 10.0,
//                     childAspectRatio: 1.0),
//                 itemBuilder: (BuildContext context, int index) {
//                   File media = _listImageVideoPaths[index];
//                   return GestureDetector(
//                     onTap: () {
//                       // ImagePickers.previewImages(
//                       //     _listImageVideoPaths, index);
//                       // // if (media.galleryMode == GalleryMode.image) {
//                       // //   ImagePickers.previewImage(media.path!);
//                       // // } else {
//                       // //   ImagePickers.previewVideo(
//                       // //     media.path!,
//                       // //   );
//                       // // }
//                     },
//                     child: Image.file(
//                       File(
//                         // _listImageVideoPaths[index].thumbPath!,

//                       ),
//                       fit: BoxFit.cover,
//                     ),
//                   );
//                 }),
//             ElevatedButton(
//               onPressed: () async {
//                 _listImageVideoPaths = await ImagePickers.pickerPaths(
//                   galleryMode: GalleryMode.all,
//                   selectCount: 8,
//                   showCamera: true,
//                   videoRecordMinSecond: 3,
//                   videoRecordMaxSecond: 10,
//                   videoSelectMaxSecond: 300,
//                   videoSelectMinSecond: 5,
//                 );

//                 b.selectMultipleImage();
//                 b.uploadFiles();
//                 setState(() {});
//                 print(_listImageVideoPaths);
//               },
//               child: Text("Chọn ảnh và video"),
//             ),

//             ElevatedButton(
//               onPressed: () async {
//                 BirdInformationController b = Get.find();

//                 b.updateProfile();
//               },
//               child: Text("Thêm ảnh"),
//             ),
//           ],
//         ),
//       ),
//     );
//     // RepaintBoundary(
//     //   key: globalKey,
//     //   child: MaterialApp(
//     //     theme: ThemeData(
//     //       backgroundColor: Colors.white,
//     //       primaryColor: Colors.white,
//     //     ),
//     //     home:
//     //   ),
//     // );
//   }
// }

class MultiFileUplaodScreen extends StatefulWidget {
  const MultiFileUplaodScreen({Key? key}) : super(key: key);

  @override
  _MultiFileUplaodScreenState createState() => _MultiFileUplaodScreenState();
}

class _MultiFileUplaodScreenState extends State<MultiFileUplaodScreen> {
  List<File> images = [];

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload multiple files")),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                getMultipImage();
              },
              child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Icon(
                      Icons.upload_file,
                      size: 50,
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width,
              height: 150,
              child: images.length == 0
                  ? Center(
                      child: Text("No Images found"),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, i) {
                        return Container(
                            width: 100,
                            margin: EdgeInsets.only(right: 10),
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8)),
                            child: Image.file(
                              images[i],
                              fit: BoxFit.cover,
                            ));
                      },
                      itemCount: images.length,
                    ),
            ),
            const SizedBox(
              height: 50,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: TextField(
            //     controller: nameController,
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(), hintText: 'Your name'),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                color: Colors.blue,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                height: 50,
                onPressed: () async {
                  for (int i = 0; i < images.length; i++) {
                    String url = await uploadFile(images[i]);
                    downloadUrls.add(url);
                    BirdInformationController p = Get.find();
                    if (i == images.length - 1) {
                      p.storeEntry(downloadUrls);
                    }
                  }
                },
                child: Text("Upload"),
              ),
            )
          ]),
        ),
      ),
    );
  }

  List<String> downloadUrls = [];

  final ImagePicker _picker = ImagePicker();

  getMultipImage() async {
    final List<XFile>? pickedImages = await _picker.pickMultiImage();

    if (pickedImages != null) {
      pickedImages.forEach((e) {
        images.add(File(e.path));
      });

      setState(() {});
    }
  }

  Future<String> uploadFile(File file) async {
    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef
        .child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file, metaData);

    final taskSnapshot = await uploadTask.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }
}

class VideoPage extends StatefulWidget {
  // VideoPage({Key? key}) : super(key: key);
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  // UploadTask? task;
  // late final VideoPlayerController c1;
  // File? file;
  File? video;
  List<File> videos = [];
  late VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  late File? videoFile;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller!.dispose();
    super.dispose();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   c1 = VideoPlayerController.asset('assets/images/bird.mp4');

  //   c1.addListener(() {
  //     setState(() {});
  //   });
  //   c1.setLooping(true);
  //   c1.initialize().then((_) => setState(() {}));
  //   c1.play();
  // }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Sample Video Player Demo'),
    //   ),
    //   // Use a FutureBuilder to display a loading spinner while waiting for the
    //   // VideoPlayerController to finish initializing.
    //   body: Column(
    //     children: <Widget>[
    //       Visibility(
    //         visible: _controller != null,
    //         child: FutureBuilder(
    //           future: _initializeVideoPlayerFuture,
    //           builder: (context, snapshot) {
    //             if (snapshot.connectionState == ConnectionState.done) {
    //               // If the VideoPlayerController has finished initialization, use
    //               // the data it provides to limit the aspect ratio of the video.
    //               return AspectRatio(
    //                 aspectRatio: _controller!.value.aspectRatio,
    //                 // Use the VideoPlayer widget to display the video.
    //                 child: VideoPlayer(_controller!),
    //               );
    //             } else {
    //               // If the VideoPlayerController is still initializing, show a
    //               // loading spinner.
    //               return Center(child: CircularProgressIndicator());
    //             }
    //           },
    //         ),
    //       ),
    //       Center(
    //         child: MaterialButton(
    //           hoverColor: Colors.blue,
    //           child: Text("Upload Video"),
    //           onPressed: () {
    //             getVideo();
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    //   floatingActionButton: _controller == null
    //       ? null
    //       : FloatingActionButton(
    //           onPressed: () {
    //             // Wrap the play or pause in a call to `setState`. This ensures the
    //             // correct icon is shown.
    //             setState(() {
    //               // If the video is playing, pause it.
    //               if (_controller!.value.isPlaying) {
    //                 _controller!.pause();
    //               } else {
    //                 // If the video is paused, play it.
    //                 _controller!.play();
    //               }
    //             });
    //           },
    //           // Display the correct icon depending on the state of the player.
    //           child: Icon(
    //             _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
    //           ),
    //         ), // This trailing comma makes auto-formatting nicer for build methods.
    // );
    // final fileName = file != null ? basename(file!.path) : 'No File Selected';
    return Scaffold(
      appBar: AppBar(title: Text("Upload multiple files")),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                selectFiles();
              },
              child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Icon(
                      Icons.upload_file,
                      size: 50,
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            // Container(
            //   width: 100,
            //   margin: EdgeInsets.only(right: 10),
            //   height: 100,
            //   decoration: BoxDecoration(
            //       border: Border.all(color: Colors.black),
            //       borderRadius: BorderRadius.circular(8)),
            //   // child: Image.file(
            //   //   videos[i],
            //   //   fit: BoxFit.cover,
            //   // ));
            //   child: CachedVideoPreviewWidget(
            //     path: video.toString(),
            //     type: SourceType.local,
            //     fileImageBuilder: (BuildContext context, path) =>
            //         Image.file(videos!),
            //   ),
            //   // child: CachedVideoPreviewWidget(
            //   //   path:
            //   //       // 'https://www.youtube.com/watch?v=b_sQ9bMltGU',
            //   //       videos[i].toString(),
            //   //   type: SourceType.remote,
            //   //   remoteImageBuilder: (BuildContext context, path) =>
            //   //       // Image.network(path),

            //   // ),
            // ),
            Container(
              width: Get.width,
              height: 150,
              child: videos.length == 0
                  ? Center(
                      child: Text("No Videos found"),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, i) {
                        // c1 = VideoPlayerController.asset(videos[i].toString());
                        // var t1 = getVideo(videos[i].toString());
                        return Container(
                          width: 100,
                          margin: EdgeInsets.only(right: 10),
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(8)),
                          // child: Image.file(
                          //   videos[i],
                          //   fit: BoxFit.cover,
                          // ));
                          child: CachedVideoPreviewWidget(
                            path: video.toString(),
                            type: SourceType.local,
                            fileImageBuilder: (BuildContext context, path) =>
                                Image.file(videos[i]),
                          ),
                          // child: CachedVideoPreviewWidget(
                          //   path:
                          //       // 'https://www.youtube.com/watch?v=b_sQ9bMltGU',
                          //       videos[i].toString(),
                          //   type: SourceType.remote,
                          //   remoteImageBuilder: (BuildContext context, path) =>
                          //       // Image.network(path),

                          // ),
                        );
                      },
                      itemCount: videos.length,
                    ),
            ),
            const SizedBox(
              height: 50,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: TextField(
            //     controller: nameController,
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(), hintText: 'Your name'),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                color: Colors.blue,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                height: 50,
                onPressed: () async {
                  for (int i = 0; i < videos.length; i++) {
                    String url = await uploadFile(videos[i]);
                    downloadUrls.add(url);
                    BirdInformationController p = Get.find();
                    if (i == videos.length - 1) {
                      p.storeEntry(downloadUrls);
                    }
                  }
                },
                child: Text("Upload"),
              ),
            )
          ]),
        ),
      ),
    );
    ////
  }

  List<String> downloadUrls = [];
  final ImagePicker _picker2 = ImagePicker();
  Future selectFiles() async {
    List<XFile>? pickedVideos = await _picker2.pickMultipleMedia();
    // FilePickerResult? result =
    //     await FilePicker.platform.pickFiles(allowMultiple: true);

    // if (result != null) {
    //   List<File> files = result.paths.map((path) => File(path!)).toList();
    // } else {
    //   // User canceled the picker
    // }
    if (pickedVideos != null) {
      pickedVideos.forEach((e) {
        videos.add(File(e.path));
      });

      setState(() {});
    }
  }

  Future getVideo() async {
    var picker;
    Future<File>? _videoFile = picker.pickVideo(source: ImageSource.gallery);
    _videoFile!.then((file) async {
      setState(() {
        videoFile = file;
        _controller = VideoPlayerController.file(videoFile!);

        // Initialize the controller and store the Future for later use.
        _initializeVideoPlayerFuture = _controller!.initialize();

        // Use the controller to loop the video.
        _controller!.setLooping(true);
      });
    });
  }

  // Future getVideo(dynamic videofile) async {
  //   final uint8list = await VideoThumbnail.thumbnailData(
  //     video: videofile.path,
  //     imageFormat: ImageFormat.JPEG,
  //     maxWidth:
  //         128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
  //     quality: 25,
  //   );
  // }

  //  getMultipVideos() async {
  //   final List<XFile>? pickedVideos = await _picker.pickMultiImage();

  //   if (pickedImages != null) {
  //     pickedImages.forEach((e) {
  //       images.add(File(e.path));
  //     });

  //     setState(() {});
  //   }
  // }

  Future<String> uploadFile(File file) async {
    final metaData = SettableMetadata(contentType: 'video/mp4');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef
        .child('pictures/${DateTime.now().microsecondsSinceEpoch}.video');
    final uploadTask = ref.putFile(file, metaData);

    final taskSnapshot = await uploadTask.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}
