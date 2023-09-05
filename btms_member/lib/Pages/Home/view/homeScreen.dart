// import 'package:btms/Widgets/custom_search_bar.dart';
// import 'package:btms/Widgets/home_tab_view.dart';
import 'package:btms_member/Widgets/custom_search_bar.dart';
import 'package:btms_member/Widgets/home_tab_view.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_tab_indicator_styler/flutter_tab_indicator_styler.dart';
import 'package:get/get.dart';
import '../../../Widgets/custom_bottom_bar.dart';
import '../controller/homeController.dart';

class HomeScreen extends GetView<HomeController> {
  final double _minValue = 8.0;
  // final controller = Get.put(HomeController());
  ScrollController tcontroller = ScrollController();
  ScrollPhysics t = const ScrollPhysics();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    // return Obx(() {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: Container(
              // margin: EdgeInsets.only(bottom: 10),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    width: 450,
                    child: const Text(
                      "Giải đấu chào mào",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 110),
                    child: const HomeSearchBar(),
                  ),
                  Container(
                    // margin: EdgeInsets.only(top: 0),
                    child: const HomeTabView(),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: const CustomBottombar(),
          ),
        ),
      ),
    );
    // });
  }
}
