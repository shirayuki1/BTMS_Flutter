import 'dart:io';

// import 'package:btms/Pages/UpdateBird/controller/update_bird_controller.dart';
// import 'package:btms/Routes/routes.dart';
import 'package:btms_member/Pages/UpdateBird/controller/update_bird_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../Services/GlobalStates/share_states.dart';

class UpdateBirdScreen extends GetView<UpdateBirdController> {
  bool isDownloading = true;
  final SharedStates sharedStates = Get.find();
  bool showPassword = false;
  String? accountId;

  UpdateBirdScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SharedStates st = Get.find();
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
              'Cập nhật hồ sơ chim',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 35),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(children: [
            Obx(() {
              var bird = controller.bird1.value;
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {
                      controller.setName(value);
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 1),
                        labelText: "Tên: ",
                        labelStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: bird!.name.toString(),
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    onChanged: (value) {
                      controller.setCharacter(value);
                    },
                    // obscureText: isPasswordTextField ? showPassword : false,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 1),
                        labelText: "Đặc tính nhận dạng: ",
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: bird!.identifyingCharacteristics.toString(),
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // TextField(
                  //   onChanged: (value) {
                  //     controller.setGender(value);
                  //   },
                  //   // obscureText: isPasswordTextField ? showPassword : false,
                  //   decoration: InputDecoration(
                  //       contentPadding: const EdgeInsets.only(bottom: 3),
                  //       labelText: "Giới tính",
                  //       labelStyle: const TextStyle(
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 20,
                  //       ),
                  //       floatingLabelBehavior: FloatingLabelBehavior.always,
                  //       hintText: bird.gender.toString(),
                  //       hintStyle: const TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.black,
                  //       )),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  TextField(
                    onChanged: (value) {
                      controller.setWeight(value);
                    },
                    // obscureText: isPasswordTextField ? showPassword : false,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 1),
                        labelText: "Cân nặng: ",
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: bird.weight.toString() + " gram",
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    onChanged: (value) {
                      controller.setHeight(value);
                    },
                    // obscureText: isPasswordTextField ? showPassword : false,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 1),
                        labelText: "Chiều cao: ",
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: bird.height.toString() + " cm",
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    onChanged: (value) {
                      controller.setColor(value);
                    },
                    // obscureText: isPasswordTextField ? showPassword : false,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 1),
                        labelText: "Màu sắc: ",
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: bird.color.toString(),
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  // const SizedBox(
                  //   height: 35,
                  // ),
                  GestureDetector(
                    onTap: () {
                      controller.updateBird(bird.bird_Id!);
                    },
                    child: Container(
                      width: 220,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xff00CC00),
                          borderRadius: BorderRadius.circular(4)),
                      child: const Text(
                        "Cập nhật thông tin chim",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      // child: Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 63,
                      //     vertical: 13,
                      //   ),
                      //   child: Container(
                      //     width: 170,
                      //     height: 20,

                      //   ),
                      // ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              );
            }),
          ]),
          //             // Text(
          //             //   "Tên:",
          //             //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //             // ),
          //             TextField(
          //               onSubmitted: (value) {
          //                 controller.setName(value);
          //               },
          //               decoration: InputDecoration(
          //                   border: new OutlineInputBorder(
          //                       borderSide: new BorderSide(
          //                           color: Colors.grey.withOpacity(0.6))),
          //                   hintText: 'Enter name' + bird.name.toString(),
          //                   labelText: "Name",
          //                   hintStyle: TextStyle(color: Colors.black45),
          //                   prefixIcon: Icon(
          //                     Icons.person_pin_rounded,
          //                     color: Colors.grey,
          //                   )),
          //               //controller: phoneController,
          //             ),
          //             Text(
          //               "Tên:",
          //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //             ),
          //             TextField(
          //               onSubmitted: (value) {
          //                 controller.setGender(value);
          //               },
          //               decoration: InputDecoration(
          //                   border: new OutlineInputBorder(
          //                       borderSide: new BorderSide(
          //                           color: Colors.grey.withOpacity(0.6))),
          //                   hintText: 'Enter gender',
          //                   hintStyle: TextStyle(color: Colors.black45),
          //                   prefixIcon: Icon(
          //                     Icons.person_pin_rounded,
          //                     color: Colors.grey,
          //                   )),
          //               //controller: phoneController,
          //             ),
          //             Text(
          //               "Tên:",
          //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //             ),
          //             TextField(
          //               onSubmitted: (value) {
          //                 controller.setCharacter(value);
          //               },
          //               decoration: InputDecoration(
          //                   border: new OutlineInputBorder(
          //                       borderSide: new BorderSide(
          //                           color: Colors.grey.withOpacity(0.6))),
          //                   hintText: 'Enter characteristic',
          //                   hintStyle: TextStyle(color: Colors.black45),
          //                   prefixIcon: Icon(
          //                     Icons.person_pin_rounded,
          //                     color: Colors.grey,
          //                   )),
          //               //controller: phoneController,
          //             ),
          //             Text(
          //               "Tên:",
          //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //             ),
          //             TextField(
          //               onSubmitted: (value) {
          //                 controller.setWeight(value);
          //               },
          //               decoration: InputDecoration(
          //                   border: new OutlineInputBorder(
          //                       borderSide: new BorderSide(
          //                           color: Colors.grey.withOpacity(0.6))),
          //                   hintText: 'Enter weight',
          //                   hintStyle: TextStyle(color: Colors.black45),
          //                   prefixIcon: Icon(
          //                     Icons.person_pin_rounded,
          //                     color: Colors.grey,
          //                   )),
          //               //controller: phoneController,
          //             ),
          //             Text(
          //               "Tên:",
          //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //             ),
          //             TextField(
          //               onSubmitted: (value) {
          //                 controller.setHeight(value);
          //               },
          //               decoration: InputDecoration(
          //                   border: new OutlineInputBorder(
          //                       borderSide: new BorderSide(
          //                           color: Colors.grey.withOpacity(0.6))),
          //                   hintText: 'Enter height',
          //                   // labelText: ,
          //                   hintStyle: TextStyle(color: Colors.black45),
          //                   prefixIcon: Icon(
          //                     Icons.person_pin_rounded,
          //                     color: Colors.grey,
          //                   )),
          //               //controller: phoneController,
          //             ),
          //             Text(
          //               "Tên:",
          //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //             ),
          //             TextField(
          //               onSubmitted: (value) {
          //                 controller.setColor(value);
          //               },
          //               decoration: InputDecoration(
          //                   border: new OutlineInputBorder(
          //                       borderSide: new BorderSide(
          //                           color: Colors.grey.withOpacity(0.6))),
          //                   hintText: 'Enter color',
          //                   hintStyle: TextStyle(color: Colors.black45),
          //                   prefixIcon: Icon(
          //                     Icons.person_pin_rounded,
          //                     color: Colors.grey,
          //                   )),
          //               //controller: phoneController,
          //             ),

          //             const SizedBox(
          //               height: 25,
          //             ),
          //             Row(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 const Text(
          //                   "Hình ảnh:",
          //                   style: TextStyle(
          //                       fontSize: 20, fontWeight: FontWeight.bold),
          //                 ),
          //                 const SizedBox(
          //                   width: 25,
          //                 ),
          //                 Container(
          //                   child: Row(
          //                     children: [
          //                       Card(
          //                         child: Image.network(
          //                           "https://chimchaomao.vn/upload/baiviet/logomobile-4993.png",
          //                           width: 80,
          //                           height: 80,
          //                         ),
          //                       ),
          //                       const SizedBox(
          //                         width: 15,
          //                       ),
          //                       Card(
          //                         child: Image.network(
          //                           "https://chimchaomao.vn/upload/baiviet/logomobile-4993.png",
          //                           width: 80,
          //                           height: 80,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),

          //             const SizedBox(
          //               height: 25,
          //             ),
          //             Row(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 const Text(
          //                   "Video:",
          //                   style: TextStyle(
          //                       fontSize: 20, fontWeight: FontWeight.bold),
          //                 ),
          //                 const SizedBox(
          //                   width: 25,
          //                 ),
          //                 Container(
          //                   child: Row(
          //                     children: [
          //                       Card(
          //                         child: Image.network(
          //                           "https://chimchaomao.vn/upload/baiviet/logomobile-4993.png",
          //                           width: 80,
          //                           height: 80,
          //                         ),
          //                       ),
          //                       const SizedBox(
          //                         width: 15,
          //                       ),
          //                       Card(
          //                         child: Image.network(
          //                           "https://chimchaomao.vn/upload/baiviet/logomobile-4993.png",
          //                           width: 80,
          //                           height: 80,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             const SizedBox(
          //               height: 35,
          //             ),

          //             GestureDetector(
          //               child: Container(
          //                 width: 170,
          //                 height: 50,
          //                 alignment: Alignment.center,
          //                 // child: Padding(
          //                 //   padding: const EdgeInsets.symmetric(
          //                 //     horizontal: 63,
          //                 //     vertical: 13,
          //                 //   ),
          //                 //   child: Container(
          //                 //     width: 170,
          //                 //     height: 20,

          //                 //   ),
          //                 // ),
          //                 decoration: BoxDecoration(
          //                     color: const Color(0x0fffcc00),
          //                     borderRadius: BorderRadius.circular(4)),
          //                 // child: GestureDetector(
          //                 //   onTap: () {
          //                 //     Get.toNamed(Routes.birdInfo);
          //                 //   },
          //                 child: const Text(
          //                   "Cập nhật hồ sơ chim",
          //                   textAlign: TextAlign.center,
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 20,
          //                       fontWeight: FontWeight.w500),
          //                 ),
          //               ),
          //             ),

          //             // GestureDetector(
          //             //   child: Container(
          //             //     width: 170,
          //             //     height: 50,
          //             //     alignment: Alignment.center,
          //             //     decoration: BoxDecoration(
          //             //         color: const Color(0x0fffcc00),
          //             //         borderRadius: BorderRadius.circular(4)),
          //             //     // child: GestureDetector(
          //             //     //   onTap: () {
          //             //     //     Get.toNamed(Routes.birdInfo);
          //             //     //   },
          //             //     child: const Text(
          //             //       "Cập nhật hồ sơ chim",
          //             //       textAlign: TextAlign.center,
          //             //       style: TextStyle(
          //             //           color: Colors.white,
          //             //           fontSize: 20,
          //             //           fontWeight: FontWeight.w500),
          //             //     ),
          //             //   ),
          //             // ),

          //             const SizedBox(
          //               height: 25,
          //             ),
          //           ],
          //         );
          //       })
        ),
      ),
    );
  }

  // Widget buildTextField(
  //     String labelText, String placeholder, Widget ) {
  //   return Container(
  //     margin: const EdgeInsets.only(left: 20, right: 20),
  //     child: Padding(
  //       padding: const EdgeInsets.all(10),
  //       child:
  //     ),
  //   );
  // }

  Widget buildTextField(String labelText, String placeholder) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          initialValue: placeholder,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 3),
              labelText: labelText,
              labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
        ),
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
