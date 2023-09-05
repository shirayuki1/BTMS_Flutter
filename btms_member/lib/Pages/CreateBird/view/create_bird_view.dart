import 'dart:io';

// import 'package:btms/Pages/CreateBird/controller/create_bird_controller.dart';
// import 'package:btms/Routes/routes.dart';
import 'package:btms_member/Pages/CreateBird/controller/create_bird_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../Services/GlobalStates/share_states.dart';

class CreateBirdScreen extends GetView<CreateBirdController> {
  bool isDownloading = true;
  final SharedStates sharedStates = Get.find();
  bool showPassword = false;
  String? accountId;

  CreateBirdScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
              'Tạo mới hồ sơ chim',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 30,
              ),
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
          child: ListView(
            children: [
              // Center(
              //   child: Stack(
              //     children: [
              //       Container(
              //           width: 130,
              //           height: 130,
              //           decoration: BoxDecoration(
              //             border: Border.all(
              //                 width: 4,
              //                 color: Theme.of(context).scaffoldBackgroundColor),
              //             boxShadow: [
              //               BoxShadow(
              //                   spreadRadius: 2,
              //                   blurRadius: 10,
              //                   color: Colors.black.withOpacity(0.1),
              //                   offset: Offset(0, 10))
              //             ],
              //             shape: BoxShape.circle,
              //             image: DecorationImage(
              //               fit: BoxFit.cover,
              //               image:
              //                   // AuthServices.isLoggedIn()
              //                   //     ? NetworkImage(
              //                   //         AuthServices.userLoggedIn.value.imageUrl!,
              //                   //       )
              //                   //     :
              //                   NetworkImage(
              //                       'https://mcss.co.za/images/Member-Login.jpg'),
              //             ),
              //           )),
              //       Positioned(
              //           bottom: 0,
              //           right: 0,
              //           child: Container(
              //             height: 40,
              //             width: 40,
              //             decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               border: Border.all(
              //                 width: 4,
              //                 color: Theme.of(context).scaffoldBackgroundColor,
              //               ),
              //               color: Colors.green,
              //             ),
              //             child: Icon(
              //               Icons.camera_alt,
              //               color: Colors.white,
              //             ),
              //           )),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {
                  controller.setName(value);
                },
                // obscureText: isPasswordTextField ? showPassword : false,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 3),
                    labelText: "Tên",
                    labelStyle: const TextStyle(
                      fontSize: 18,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Nhập tên: ",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {
                  controller.setCharacter(value);
                },
                // obscureText: isPasswordTextField ? showPassword : false,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 3),
                    labelText: "Đặc tính nhận dạng",
                    labelStyle: const TextStyle(
                      fontSize: 18,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Nhập mô tả: ",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: 20,
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
              //         fontSize: 18,
              //       ),
              //       floatingLabelBehavior: FloatingLabelBehavior.always,
              //       hintText: "Nhập giới tính: ",
              //       hintStyle: const TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.black,
              //       )),
              // ),
              TextField(
                onChanged: (value) {
                  controller.setWeight(value);
                },
                // obscureText: isPasswordTextField ? showPassword : false,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 3),
                    labelText: "Cân nặng",
                    labelStyle: const TextStyle(
                      fontSize: 18,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Nhập cân nặng: ",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {
                  controller.setHeight(value);
                },
                // obscureText: isPasswordTextField ? showPassword : false,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 3),
                    labelText: "Chiều cao",
                    labelStyle: const TextStyle(
                      fontSize: 18,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Nhập chiều cao: ",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {
                  controller.setColor(value);
                },
                // obscureText: isPasswordTextField ? showPassword : false,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 3),
                    labelText: "Màu sắc",
                    labelStyle: const TextStyle(
                      fontSize: 18,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Nhập màu sắc: ",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),

              const SizedBox(
                height: 25,
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     const Text(
              //       "Hình ảnh:",
              //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //     ),
              //     const SizedBox(
              //       width: 25,
              //     ),
              //     Container(
              //       child: Row(
              //         children: [
              //           Card(
              //             child: Image.network(
              //               "https://chimchaomao.vn/upload/baiviet/logomobile-4993.png",
              //               width: 80,
              //               height: 80,
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 15,
              //           ),
              //           Card(
              //             child: Image.network(
              //               "https://chimchaomao.vn/upload/baiviet/logomobile-4993.png",
              //               width: 80,
              //               height: 80,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),

              // const SizedBox(
              //   height: 25,
              // ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     const Text(
              //       "Video:",
              //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //     ),
              //     const SizedBox(
              //       width: 25,
              //     ),
              //     Container(
              //       child: Row(
              //         children: [
              //           Card(
              //             child: Image.network(
              //               "https://chimchaomao.vn/upload/baiviet/logomobile-4993.png",
              //               width: 80,
              //               height: 80,
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 15,
              //           ),
              //           Card(
              //             child: Image.network(
              //               "https://chimchaomao.vn/upload/baiviet/logomobile-4993.png",
              //               width: 80,
              //               height: 80,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 35,
              // ),

              GestureDetector(
                onTap: () {
                  controller.createBird();
                },
                child: Container(
                  width: 170,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xff00CC00),
                      borderRadius: BorderRadius.circular(4)),
                  child: const Text(
                    "Tạo mới chim",
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
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          // obscureText: isPasswordTextField ? showPassword : false,
          decoration: InputDecoration(
              // suffixIcon: isPasswordTextField
              //     ? IconButton(
              //         onPressed: () {
              //           // setState(() {
              //           //   showPassword = !showPassword;
              //           // });
              //         },
              //         icon: Icon(
              //           Icons.remove_red_eye,
              //           color: Colors.grey,
              //         ),
              //       )
              //     : null,
              contentPadding: const EdgeInsets.only(bottom: 3),
              labelText: labelText,
              labelStyle: const TextStyle(
                fontSize: 18,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              hintStyle: const TextStyle(
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
