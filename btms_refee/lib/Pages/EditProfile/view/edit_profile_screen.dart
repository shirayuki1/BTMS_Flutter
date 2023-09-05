// import 'package:btms/Pages/EditProfile/controller/edit_profile_controller.dart';
// import 'package:btms/Routes/routes.dart';
import 'package:btms_refee/Pages/EditProfile/controller/edit_profile_controller.dart';
import 'package:btms_refee/Pages/Login/controller/login_controller.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:btms_refee/Utils/formatter.dart';
import 'package:btms_refee/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

import '../../../Services/GlobalStates/share_states.dart';

class EditProfileScreen extends GetView<LoginController> {
  final SharedStates sharedStates = Get.find();
  bool showPassword = false;
  String? accountId;

  EditProfileScreen({super.key});
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
              'Cập nhật thông tin',
              style: TextStyle(color: Colors.black87, fontSize: 30),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        height: 650,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Obx(
                () {
                  var user = controller.user.value;
                  return Column(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Obx(() {
                              String filePath = controller.filePath.value;
                              if (user.imageUrl!.isEmpty) {
                                return Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 6,
                                          color: Colors.black.withOpacity(0.1),
                                          offset: Offset(0, 4))
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Utils.resolveFileImg(
                                        filePath,
                                        "assets/images/error.png",
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 6,
                                          color: Colors.black.withOpacity(0.1),
                                          offset: Offset(0, 4))
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          user.imageUrl.toString()),
                                    ),
                                  ),
                                );
                              }
                            }),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.getImage();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 4,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                      color: Colors.grey,
                                    ),
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          controller.changeName(value);
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(bottom: 3),
                            labelText: "Tên",
                            labelStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: user.fullname.toString(),
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          // controller.setEmail(value);
                        },
                        // obscureText: isPasswordTextField ? showPassword : false,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(bottom: 3),
                            labelText: "Email",
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: user.email.toString(),
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          controller.changePhone(value);
                        },
                        // obscureText: isPasswordTextField ? showPassword : false,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(bottom: 3),
                            labelText: "Số điện thoại",
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: user.phone.toString(),
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              // onChanged: (value) {
                              //   controller.changeDOB(value);
                              // },
                              // obscureText: isPasswordTextField ? showPassword : false,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: 3),
                                labelText: "Ngày sinh nhật",
                                labelStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: Formatter.date(
                                    controller.selectedDate.value),
                                hintStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                // _DatePickerDemoState();
                                controller.chooseDate();
                              },
                              icon: Icon(Icons.calendar_month_rounded)),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          // controller.updateBird(bird.bird_Id!);
                          controller.updateProfile();
                        },
                        child: Container(
                          width: 220,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xff00CC00),
                              borderRadius: BorderRadius.circular(4)),
                          child: const Text(
                            "Cập nhật thông tin",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  );
                },
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
}

class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  /// Which holds the selected date
  /// Defaults to today's date.
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                'Select date',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              // color: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }
}
