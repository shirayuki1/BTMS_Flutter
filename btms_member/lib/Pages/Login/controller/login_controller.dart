import 'dart:developer';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:btms_member/Models/user.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
import 'package:btms_member/Services/api/user_service.dart';
import 'package:btms_member/Utils/formatter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class LoginController extends GetxController {
  final IUserService _userService = Get.find();
  final email = "".obs;
  final pass = "".obs;
  var ispasswordev = true.obs;
  SharedStates sharedStates = Get.find();
  var user = User().obs;

  void loginWithUsername() async {
    try {
      BotToast.showLoading();
      if (email.isEmpty || pass.isEmpty) {
        BotToast.showText(text: "Email hoặc password không được trống.");
      } else {
        final data = {
          "email": email.value,
          "password": pass.value,
        };
        final result = await _userService.loginWithUsername(data);
        user.value = (await _userService.loginWithUsername(data))!;
        sharedStates.token = result!.accessToken.toString();
        print("test ${sharedStates.token}");
        if (result != null) {
          //&& result.isActive == true
          if (email.value.toLowerCase() == result.email!.toLowerCase() &&
              result.role!.toLowerCase() == "member") {
            selectedDate.value = result.dayOfBirth!;
            BotToast.showText(text: "Đăng nhập thành công.");
            Get.toNamed(Routes.homeScreen);
          } else {
            BotToast.showText(
                text: "Email chưa có quyền truy cập ứng dụng này!");
          }
        } else {
          BotToast.showText(text: "Email hoặc password chưa đúng.");
        }
      }
    } catch (e) {
      BotToast.showText(text: "Sai email hoặc mật khẩu!");
    }
    BotToast.closeAllLoading();
  }

  ImagePicker _imagePicker = Get.find();
  final filePath = ''.obs;

  // Pick Image of visitor
  Future<void> getImage() async {
    final picked = await _imagePicker.pickImage(source: ImageSource.gallery);
    filePath.value = picked?.path ?? '';
    uploadFile(File(picked!.path));

    print("123" + picked.toString());
  }

  // User login with phone
  User? user1;

  Future<void> getInfor() async {
    final data = {
      "email": email.value,
      "password": pass.value,
    };
    final result = await _userService.loginWithUsername(data);
    user.value = (await _userService.loginWithUsername(data))!;
  }

  // email
  // final newEmail = "".obs;

  // // set email
  // void setEmail(String email) {
  //   newEmail.value = email;
  // }

  // // userName
  // final userName = "".obs;

  // // set userName
  // // void setUserName(String name) {
  // //   userName.value = name;
  // // }

  // // phone
  // final phone = "".obs;

  // // set userName
  // void setPhone(String newPhone) {
  //   phone.value = newPhone;
  // }

  // // phone
  // final date = "".obs;

  // // set userName
  // void setDate(String newDate) {
  //   date.value = newDate;
  // }

  var urlImageUpload = "".obs;
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
    } on FirebaseException catch (e) {
      print('lỗi: ' + e.toString());
    }
  }

  IUserService _service = Get.find();
  final SharedStates sharedData = Get.find();
  User? userInfo;
  final profileName = "".obs;

  void changeName(String content) {
    profileName.value = content;
  }

  final profilePhone = "".obs;

  void changePhone(String content) {
    profilePhone.value = content;
  }

  final dob = "".obs;
  void changeDOB(String value) {
    dob.value = Formatter.date(selectedDate.value);
  }

  // ImagePicker _imagePicker = Get.find();
  // final filePath = ''.obs;

  // Future<void> getImage() async {
  //   filePath.value = '';
  //   final picked = await _imagePicker.getImage(source: ImageSource.gallery);
  //   filePath.value = picked?.path ?? '';
  //   uploadFile(File(picked!.path));
  // }

  // var urlImageUpload = "".obs;

  // Future uploadFile(File file) async {
  //   if (file == null) return;
  //   final fileName = basename(file.path);
  //   try {
  //     UploadTask task = FirebaseStorage.instance
  //         .ref()
  //         .child('uploads/$fileName')
  //         .putFile(file);
  //     if (task == null) {
  //       return null;
  //     }
  //     ;
  //     final snapshot = await task.whenComplete(() {});
  //     final urlDownload = await snapshot.ref.getDownloadURL();
  //     urlImageUpload.value = urlDownload;
  //     print('Download-Link: $urlDownload');
  //   } on FirebaseException catch (e) {
  //     print('lỗi: ' + e.toString());
  //   }
  // }

  void updateProfile() async {
    if (profileName.isEmpty) {
      profileName.value = user.value.fullname!;
    } else if (profilePhone.isEmpty) {
      profilePhone.value = user.value.phone!;
    }
    DateTime applyDate = DateTime.now();
    try {
      BotToast.showLoading();
      userInfo = sharedData.account;
      if (profilePhone.value.isEmpty) {
        profilePhone.value = user.value.phone!;
      }
      if (profileName.value.isEmpty) {
        profileName.value = user.value.fullname!;
      }
      if (urlImageUpload.value.isEmpty) {
        urlImageUpload.value = user.value.imageUrl!;
      }
      if (dob.value.isEmpty) {
        dob.value = Formatter.date(user.value.dayOfBirth);
      }
      bool updateS = false;
      final data = {
        // "userId": accountId.toString(),
        // "roleId": '2'
        "email": user.value.email,
        "fullName": profileName.value,
        "phone": profilePhone.value,
        // "isDeleted": 'false',
        "image": urlImageUpload.value,
        "dayOfBirth": Formatter.date2(selectedDate.value),
        "emailVertify": true,
        "phoneVertify": true,
        // "modifyDate": applyDate.toString(),
      };
      print("data " + data.toString());
      updateS = await _service.updateProfile(data);

      if (updateS) {
        BotToast.showText(
            text: "Cập nhật thành công !",
            textStyle: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            duration: const Duration(seconds: 5));
        Get.toNamed(Routes.account);
        getInfor();
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

  var selectedDate = DateTime.now().obs;

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(1960),
      lastDate: DateTime(2024),
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
      // selectableDayPredicate: disableDate
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }

    print("123 " + Formatter.date(selectedDate.value));
  }

  // bool disableDate(DateTime day) {
  //   if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
  //       day.isBefore(DateTime.now().add(Duration(days: 5))))) {
  //     return true;
  //   }
  //   return false;
  // }
}
