import 'package:btms_refee/Pages/Setting/controller/setting_controller.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:btms_refee/Widgets/custom_bottom_bar.dart';
import 'package:btms_refee/Widgets/setting_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    // return Obx(() {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Tài khoản",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              SettingsTile(
                color: Colors.blue,
                icon: Ionicons.person_circle_outline,
                title: "Thông tin người dùng",
                onTap: () {
                  Get.toNamed(Routes.account);
                },
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              // SettingsTile(
              //   color: Colors.green,
              //   icon: Icons.pets_outlined,
              //   title: "Bird List",
              //   onTap: () {
              //     Get.toNamed(Routes.listBird);
              //   },
              // ),
              const SizedBox(
                height: 40,
              ),
              // SettingsTile(
              //   color: Colors.orange,
              //   icon: Icons.star_sharp,
              //   title: "Bird Ranking",
              //   onTap: () {
              //     // Get.toNamed(Routes.listBird);
              //   },
              // ),
              // const SizedBox(
              //   height: 40,
              // ),
              // SettingsTile(
              //   color: Colors.black,
              //   icon: Ionicons.moon_outline,
              //   title: "Theme",
              //   onTap: () {},
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // SettingsTile(
              //   color: Colors.purple,
              //   icon: Ionicons.language_outline,
              //   title: "Language",
              //   onTap: () {},
              // ),
              // const SizedBox(
              //   height: 40,
              // ),
              SettingsTile(
                color: Colors.red,
                icon: Ionicons.log_out_outline,
                title: "Đăng xuất",
                onTap: () {
                  controller.logOut();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottombar(),
    );
    // });
  }
}
