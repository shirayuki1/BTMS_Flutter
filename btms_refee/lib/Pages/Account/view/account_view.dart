// import 'package:btms/Routes/routes.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:btms_refee/Utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Login/controller/login_controller.dart';
import '../controller/account_controller.dart';

class AccountScreen extends GetView<LoginController> {
  const AccountScreen({super.key});

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
              'Thông tin cá nhân',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87, fontSize: 35),
            ),
          ],
        ),
      ),
      body: Container(
        height: 700,
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Obx(
            () {
              var user = controller.user.value;
              return Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Stack(
                    //   children: [
                    Center(
                      child: CircleAvatar(
                          radius: 10.0 * 7,
                          backgroundImage: (user.isNull)
                              ? NetworkImage(
                                  'https://pngimg.com/uploads/mouth_smile/mouth_smile_PNG42.png')
                              : NetworkImage(user.imageUrl!)),
                    ),
                    // GestureDetector(
                    //   // onTap: () {
                    //   //   Get.toNamed(Routes.editProfile);
                    //   // },
                    //   child: Align(
                    //     alignment: Alignment.bottomRight,
                    //     child: Container(
                    //       height: 10.0 * 2.5,
                    //       width: 10.0 * 2.5,
                    //       decoration: BoxDecoration(
                    //         // color: Theme.of(context).accentColor,
                    //         shape: BoxShape.circle,
                    //       ),
                    //       // child: Center(
                    //       //   heightFactor: 10.0 * 1.5,
                    //       //   widthFactor: 10.0 * 1.5,
                    //       //   child: Icon(
                    //       //     FontAwesomeIcons.pencilAlt,
                    //       //     color: Colors.black,
                    //       //     size: 10.0 * 1.5,
                    //       //   ),
                    //       // ),
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //     bottom: 0,
                    //     right: 0,
                    //     child: Container(
                    //       height: 40,
                    //       width: 40,
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         border: Border.all(
                    //           width: 4,
                    //           color: Theme.of(context)
                    //               .scaffoldBackgroundColor,
                    //         ),
                    //         color: Colors.green,
                    //       ),
                    //       child: const Icon(
                    //         Icons.camera_alt,
                    //         color: Colors.white,
                    //       ),
                    //     )),
                    //   ],
                    // ),

                    const SizedBox(
                      height: 50,
                    ),
                    //user name
                    // buildTextField(
                    //     "Name",
                    //     AuthServices.isLoggedIn()
                    //         ? AuthServices.userLoggedIn.value.name!
                    //         : "Not sigin",
                    //     false),
                    const Text(
                      "Họ và Tên",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      user.fullname.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //email
                    // buildTextField(
                    //     "Địa chỉ Email",
                    //     AuthServices.isLoggedIn()
                    //         ? AuthServices.userLoggedIn.value.email!
                    //         : "Not sigin",
                    //     false),
                    const Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      user.email.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    //sdt
                    // buildTextField(
                    //     "Số điện thoại",
                    //     AuthServices.isLoggedIn()
                    //         ? AuthServices.userLoggedIn.value.phone!
                    //         : "Not sigin",
                    //     false),
                    // Container(
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Số điện thoại",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      user.phone.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Sinh Nhật",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      Formatter.date(user.dayOfBirth),
                      style: TextStyle(fontSize: 20),
                    ),
                    //buildTextField("Địa chỉ (Không bắt buộc)", "", false),
                    const SizedBox(
                      height: 35,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.editProfile);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xff2AD4D3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          "Chỉnh sửa thông tin",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
