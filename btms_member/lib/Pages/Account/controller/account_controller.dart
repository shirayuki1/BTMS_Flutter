import 'package:get/get.dart';

class AccountController extends GetxController {
  // SharedStates states = Get.find();
  // final ScrollController scrollController = ScrollController();
  // final showSlider = true.obs;

  // List birdListSelected = [];

  // @override
  // void onInit() {
  //   super.onInit();
  //   if (!initPage()) return;
  //   initPage();
  //   getBirdList();
  // }

  // // final birdId = 0.obs;
  // bool initPage() {
  //   scrollController.addListener(() {
  //     final fromTop = scrollController.position.pixels;
  //     if (fromTop > 10) {
  //       showSlider.value = false;
  //     } else if (fromTop == 0) {
  //       showSlider.value = true;
  //     }
  //   });
  //   //eventName.value = states.events.value.eventName!;
  //   return true;
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  //   //closeShopping();
  // }

  // //Load data of Bird list
  // IBirdService birdService = Get.find();
  // final birdList = <Bird>[].obs;
  // Future<void> getBirdList() async {
  //   //final events = await eventService.getEvents();
  //   //listEvents.value = events.data ?? [];
  //   birdList.value = (await birdService.getAllBird())!;
  //   // states.birdLists = birdList.value;
  //   // listEvents.value = await eventService.getEvents();
  //   print("Bird=== ${birdList.string}");
  //   for (var element in birdList) {
  //     print("id..." + element.toString());
  //   }
  //   states.birdList1.value = birdList.value;
  //   BirdInformationController t = Get.find();
  //   t.onInit();
  // }

  // Future<void> goToDetail(int? id) async {
  //   print("id round" + id.toString());
  //   if (id != null) {
  //     Get.toNamed(Routes.birdInfo, parameters: {"bird_Id": id.toString()});
  //     BirdInformationController t = Get.find();
  //     t.onInit();
  //   }
  // }
}
