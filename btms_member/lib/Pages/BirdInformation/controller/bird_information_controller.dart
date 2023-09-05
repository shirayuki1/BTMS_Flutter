// import 'package:btms/Models/images.dart';
// import 'package:btms/Services/api/bird_service.dart';
// import 'package:btms/Services/api/images_bird_service.dart';
import 'dart:developer';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:btms_member/Models/images.dart';
import 'package:btms_member/Models/videos.dart';
import 'package:btms_member/Pages/BirdList/controller/bird_controller.dart';
import 'package:btms_member/Pages/ChooseBird/controller/choose_bird_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:btms_member/Services/api/bird_service.dart';
import 'package:btms_member/Services/api/images_bird_service.dart';
import 'package:btms_member/Services/api/videos_bird_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:path/path.dart';
import 'package:http/io_client.dart';
import 'package:signalr_core/signalr_core.dart';
import '../../../Models/bird.dart';

class BirdInformationController extends GetxController {
  final ScrollController scrollController = ScrollController();

  final ImagePicker _picker = ImagePicker();
  List<XFile>? images = [];
  List<String> listImagePath = [];
  var selectedFileCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    String? id = Get.parameters['bird_Id'];
    // String? id1 = Get.parameters['image_Id'];
    if (id == null) return;
    birdId.value = int.parse(id);
    getBirdById();
    realTime();
    // getImageList();
    // if (!initPage()) return;
    // if (id1 == null) return;
    // imagesId.value = int.parse(id1);
  }

  final loading = false.obs;

  IBirdService birdService = Get.find();
  var bird = Bird().obs;
  final birdId = 0.obs;
  SharedStates st = Get.find();

  Future<void> getBirdById() async {
    print("========== ${birdId.value}");

    bird.value = (await birdService.getById(birdId.value))!;
    print("sau khi update: " + bird.value.toString());

    // if (imgList.isEmpty) {
    imgList.value = (await imgService.getAllById(birdId.value))!;
    videoList.value = (await videoService.getAllById(birdId.value))!;
    // }
    st.birdId = birdId.value;
  }

//load data
  final birdList = <Bird>[].obs;
  Future<void> getBirdList() async {
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];
    birdList.value = (await birdService.getAllBird())!;
    // listEvents.value = await eventService.getEvents();

    print("Bird=== ${birdList.string}");
  }
  // final image = Images().obs;
  // final imagesId = 0.obs;
  // Future<void> getImageById() async {
  //   print("========== " + imagesId.value.toString());

  //   image.value = (await imagesService.getById(imagesId.value))!;
  // }

  IImagesService imgService = Get.find();
  final imgList = <Images>[].obs;
  Future<void> getImageList() async {
    // for (var element in imgList) {
    //   imgList.remove(element);
    // }
    if (imgList.isEmpty) {
      imgList.value = (await imgService.getAllById(birdId.value))!;
    }
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];

    // listEvents.value = await eventService.getEvents();
    print("image=== ${imgList.string}");
  }

  //video
  IVideosService videoService = Get.find();
  final videoList = <Videos>[].obs;
  Future<void> getVideoList() async {
    // for (var element in imgList) {
    //   imgList.remove(element);
    // }
    if (videoList.isEmpty) {
      videoList.value = (await videoService.getAllById(birdId.value))!;
    }
    //final events = await eventService.getEvents();
    //listEvents.value = events.data ?? [];

    // listEvents.value = await eventService.getEvents();
    print("video=== ${videoList.string}");
  }

  void deleteBird() async {
    Get.back();
    final results = await birdService.delete(birdId.value, {});
    print("result" + results.toString());
    if (results == true) {
      BotToast.showText(text: "Successfully removed!!");
      BirdController b = Get.find();
      Get.toNamed(Routes.listBird);
      b.onInit();
      ChooseBirdController c = Get.find();
      c.getBirdList();
    } else {
      BotToast.showText(
          text: "Không thể xóa hồ sơ chim khi chim đang thi đấu!!!");
    }
    // if (!results.any((element) => false)) {
    //   BotToast.showText(text: "Successfully removed!!");
    //   loadShoppingListDetails();
    // }
  }

  @override
  void onClose() {
    super.onClose();
    //closeShopping();
  }

  // void selectMultipleImage() async {
  //   images = await _picker.pickMultiImage();
  //   if (images != null) {
  //     for (XFile file in images!) {
  //       listImagePath.add(file.path);
  //     }
  //     getImages();
  //   } else {
  //     Get.snackbar(
  //       'Fail',
  //       'No image selected',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.deepOrange,
  //       colorText: Colors.white,
  //     );
  //   }

  //   selectedFileCount.value = listImagePath.length;
  // }

  var urlImageUpload = "".obs;
  List<Map<String, dynamic>> img = [];

  // List<String> imgList = [];
  Future uploadFile(File file) async {
    if (file == null) return;
    final fileName = basename(file.path);
    try {
      UploadTask task = FirebaseStorage.instance
          .ref()
          .child('uploads/$fileName')
          .putFile(file);
      if (task == null) {
        return null;
      }
      ;
      final snapshot = await task.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      urlImageUpload.value = urlDownload;
      print('Download-Link: $urlDownload');
      print('Download-list: $img');
    } on FirebaseException catch (e) {
      print('lỗi: ' + e.toString());
    }
  }

  ImagePicker _imagePicker = Get.find();
  final filePath = ''.obs;

  Future<void> getImage() async {
    final picked = await _imagePicker.pickImage(source: ImageSource.gallery);
    filePath.value = picked?.path ?? '';
    uploadFile(File(picked!.path));

    print("123" + picked.toString());
  }

  // void getImages() {
  //   print("ttt " + listImagePath.toString());
  //   for (var element in listImagePath) {
  //     uploadFile(File(element));
  //     // print("file " + )
  //   }
  // }

  // Future<List> uploadFiles(List<File> _images) async {
  //   var imageUrls =
  //       await Future.wait(_images.map((_image) => uploadFile(_image)));
  //   print(imageUrls);
  //   return imageUrls;
  // }

  // Future<String> uploadFiles(File file) async {
  //   final metaData = SettableMetadata(contentType: 'image/jpeg');
  //   final storageRef = FirebaseStorage.instance.ref();
  //   Reference ref = storageRef
  //       .child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
  //   final uploadTask = ref.putFile(file, metaData);

  //   final taskSnapshot = await uploadTask.whenComplete(() => null);
  //   String url = await taskSnapshot.ref.getDownloadURL();
  //   return url;
  // }

  Future<String> uploadFiles(File file) async {
    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef
        .child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file, metaData);

    final taskSnapshot = await uploadTask.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

  storeEntry(List<String> imageUrls) async {
    FirebaseFirestore.instance
        .collection('story')
        .add({'link': imageUrls}).then((value) {
      Get.snackbar('Success', 'Data is stored successfully');
    });
    for (var element in imageUrls) {
      img.add({"link": element});
    }
    //create img
    try {
      BotToast.showLoading();
      //
      bool updateS = false;
      final data = {
        "bird_Id": birdId.value,
        "links": img,
      };
      print("data " + data.toString());
      updateS = await birdService.createImages(data);

      if (updateS) {
        BotToast.showText(
            text: "Cập nhật thành công !",
            textStyle: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            duration: const Duration(seconds: 5));
        Get.toNamed(Routes.birdInfo);
        // getInfor();
      } else {
        BotToast.showText(
            text: "Cập nhật thất bại !",
            textStyle: TextStyle(
                fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
            duration: const Duration(seconds: 5));
      }
    } catch (e) {
      log("Lỗi: " + e.toString());
      BotToast.showText(text: "Cập nhật thất bại");
    }
    BotToast.closeAllLoading();
  }

// Future<String> uploadFile(File _image) async {
//   StorageReference storageReference = FirebaseStorage.instance
//       .ref()
//       .child('posts/${_image.path}');
//   StorageUploadTask uploadTask = storageReference.putFile(_image);
//   await uploadTask.onComplete;

//   return await storageReference.getDownloadURL();
// }
  Future<void> realTime() async {
    final connection = HubConnectionBuilder()
        .withUrl(
            'https://bird-tournament-service.azurewebsites.net/hubs/refreshListHub',
            HttpConnectionOptions(
              client: IOClient(
                  HttpClient()..badCertificateCallback = (x, y, z) => true),
              logging: (level, message) => print(message),
            ))
        .build();

    await connection.start();
    // print("HELLLOLOOOOOOOO");
    connection.on('ReceiveBird', (message) {
      print("HELLO ");
      getBirdList();
      getImageList();
      getVideoList();
    });
  }
}
