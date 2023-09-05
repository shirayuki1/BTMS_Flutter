import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../Common/constants.dart';
import '../Routes/routes.dart';
import '../Services/GlobalStates/share_states.dart';

class CustomBottombarController extends GetxController {
  final SharedStates states = Get.find();
  Future<void> changeSelected(int index) async {
    Get.offAndToNamed(items[index].route);
    states.bottomBarSelectedIndex.value = index;
  }
}

class BottomItem extends SalomonBottomBarItem {
  final String route;
  final String text;
  @override
  final Icon icon;
  final Color color;

  BottomItem({
    required this.route,
    required this.text,
    required this.icon,
    this.color = AppColors.primary,
  }) : super(
          title: Text(text),
          icon: icon,
          selectedColor: color,
        );
}

final items = [
  BottomItem(
    text: 'Trang chủ',
    icon: const Icon(Icons.home),
    route: Routes.homeScreen,
  ),
  BottomItem(
    text: 'Giải đấu của tôi',
    icon: const Icon(Icons.storage_sharp),
    route: Routes.tournamentJoinScreen,
  ),
  BottomItem(
    text: 'Lịch sử giải đấu',
    icon: const Icon(Icons.work_history_sharp),
    route: Routes.history,
  ),
  BottomItem(
    text: 'Tài khoản',
    icon: const Icon(Icons.manage_accounts_rounded),
    route: Routes.setting,
  ),
];

class CustomBottombar extends GetView<CustomBottombarController> {
  const CustomBottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 4.0,
              offset: const Offset(-2, 0),
            ),
          ],
        ),
        child: SalomonBottomBar(
          currentIndex: controller.states.bottomBarSelectedIndex.value,
          //currentIndex: bottomBarSelectedIndex.value,
          onTap: (i) => controller.changeSelected(i),
          items: items,
        ),
      );
    });
  }
}
