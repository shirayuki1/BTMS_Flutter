import 'dart:io';
import 'package:btms_member/Pages/BirdInformationCheckin/controller/bird_information_checkin_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:cached_video_preview/cached_video_preview.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class BirdInformationCheckinScreen
    extends GetView<BirdInformationCheckinController> {
  bool isDownloading = true;

  BirdInformationCheckinScreen({super.key});
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
              'Thông tin về chim',
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
              Obx(() {
                var bird = controller.bird.value;
                print("123 $bird");
                return Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 15,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      height: screenSize.height * 0.25,
                      width: screenSize.width * 0.5,
                      child: Image.network(
                        bird.qrCode.toString() == "null"
                            ? "https://media.discordapp.net/attachments/396988408242765855/1142366345158205531/75231-200.png"
                            : bird.qrCode.toString(),
                      ),
                      // child: Image.network(
                      //   "https://drive.google.com/uc?id=1p1FOg1uB67i-uwafdU6cu-1lHgayRiTC",
                      //   cacheHeight: 300,
                      //   cacheWidth: 300,
                      // ),
                    ),
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
                      child: const Text(
                        "Hình ảnh:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      // margin: EdgeInsets.only(left:),
                      height: screenSize.height * 0.35,
                      width: screenSize.width * 0.95,
                      child: _buildGalleries(),
                    ),
                    //Videoconst
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: const Text(
                        "Video:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(left:),
                      height: screenSize.height * 0.35,
                      width: screenSize.width * 0.95,
                      child: _buildGalleries(),
                    ),
                    //Button
                    const SizedBox(
                      height: 35,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGalleries() {
    return Container(
      child: Expanded(
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
                children: List.generate(imageList.length, (int index) {
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
                        child: CachedVideoPreviewWidget(
                          path: img.link.toString(),
                          type: SourceType.remote,
                          remoteImageBuilder: (BuildContext context, url) =>
                              Image.network(url),
                        ),
                      ),
                      onTap: () {
                        openFile(
                          url: img.link.toString(),
                          // opt. fileName: file.pdf
                        );
                        //showViewer(_document);
                        //OpenFile.open("/sdcard/example.pptx");
                      },
                    ),
                  );
                }));
            //   Container(
            //       padding: EdgeInsets.only(right: 5, left: 5),
            //       alignment: Alignment.center,
            //       child: ListView.separated(
            //           separatorBuilder: (context, index) =>
            //               Divider(
            //                 height: 3,
            //                 thickness: 0.1,
            //                 color: Colors.white,
            //                 indent: 5,
            //                 endIndent: 10,
            //               ),
            //           addSemanticIndexes: true,
            //           shrinkWrap: true,
            //           scrollDirection: Axis.vertical,
            //           itemCount: imageList.length,
            //           itemBuilder: (BuildContext ctv, index) {
            //             final Images = imageList[index];
            //             return Card(
            //               child: Image.network(
            //                 Images.link.toString(),
            //               ),
            //             );
            //           }));
          }
        }),
      ),
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
