import 'package:bot_toast/bot_toast.dart';
import 'package:btms_member/Data/selected_bird.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final ScrollController scrollController = ScrollController();

  // @override
  // void onInit() {
  //   super.onInit();

  //   // getCartList();
  //   // print("test " + birdListSelected.length.toString());
  //   // print("result " + birdListSelected.toString());
  //   cartList.value.addAll(st.birdListSelectedTm.t);
  // }

  final cartList = <SelectedBird>[].obs;
  SharedStates st = Get.find();
  // void getCartList() {
  //   cartList.value = st.birdListSelectedTmp.value;
  // }
}
