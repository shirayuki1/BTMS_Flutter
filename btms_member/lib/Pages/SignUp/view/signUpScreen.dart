import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/Color/hexa_color.dart';
import '../../../Widgets/fade_amimation.dart';
import '../../Login/view/login_page.dart';
import '../controller/signUpController.dart';

enum FormData { Name, Phone, Email, Gender, password, ConfirmPassword }

class SignUpScreen extends GetView<SignUpController> {
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;

  FormData? selected;

  SignUpScreen({super.key});

  // TextEditingController nameController = new TextEditingController();
  // TextEditingController phoneController = new TextEditingController();
  // TextEditingController emailController = new TextEditingController();
  // TextEditingController passwordController = new TextEditingController();
  // TextEditingController confirmPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.4, 0.7, 0.9],
            colors: [
              HexColor("#BBFFFF"),
              HexColor("#96CDCD"),
              HexColor("#AEEEEE"),
              HexColor("#668B8B").withOpacity(0.99),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeAnimation(
                  delay: 0.1,
                  child: Image.network(
                    "https://chimchaomao.vn/upload/baiviet/logomobile-4993.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                  delay: 1,
                  child: Container(
                    child: Text(
                      "Hãy đăng ký tài khoản mới nào!",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.9),
                        // letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 5,
                  color:
                      // const Color.fromARGB(255, 171, 211, 250).withOpacity(0.4),
                      const Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0.1, 0.4, 0.7, 0.9],
                        colors: [
                          HexColor("#668B8B").withOpacity(0.99),
                          HexColor("#96CDCD"),
                          HexColor("#AEEEEE"),
                          HexColor("#BBFFFF"),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.Email
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              // controller: nameController,
                              onTap: () {
                                // setState(() {
                                //   selected = FormData.Name;
                                // });
                              },
                              onChanged: (val) =>
                                  controller.fullname.value = val,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.title,
                                  color: selected == FormData.Name
                                      ? enabledtxt
                                      : deaible,
                                  size: 25,
                                ),
                                hintText: 'Họ và Tên',
                                hintStyle: TextStyle(
                                    color: selected == FormData.Name
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 18),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.Name
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.Phone
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              // controller: phoneController,
                              onTap: () {
                                // setState(() {
                                //   selected = FormData.Phone;
                                // });
                              },
                              onChanged: (val) => controller.phone.value = val,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.phone_android_rounded,
                                  color: selected == FormData.Phone
                                      ? enabledtxt
                                      : deaible,
                                  size: 25,
                                ),
                                hintText: 'Số điện thoại',
                                hintStyle: TextStyle(
                                    color: selected == FormData.Phone
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 18),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.Phone
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: selected == FormData.Email
                                  ? enabled
                                  : backgroundColor,
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              // controller: emailController,
                              onTap: () {
                                // setState(() {
                                //   selected = FormData.Email;
                                // });
                              },
                              onChanged: (val) => controller.email.value = val,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: selected == FormData.Email
                                      ? enabledtxt
                                      : deaible,
                                  size: 25,
                                ),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    color: selected == FormData.Email
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 18),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.Email
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: selected == FormData.password
                                    ? enabled
                                    : backgroundColor),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              // controller: passwordController,
                              onTap: () {
                                // setState(() {
                                //   selected = FormData.password;
                                // });
                              },
                              onChanged: (val) => controller.pass.value = val,
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.lock_open_outlined,
                                    color: selected == FormData.password
                                        ? enabledtxt
                                        : deaible,
                                    size: 25,
                                  ),
                                  // suffixIcon: IconButton(
                                  //     icon: ispasswordev
                                  //         ? Icon(
                                  //             Icons.visibility_off,
                                  //             color:
                                  //                 selected == FormData.password
                                  //                     ? enabledtxt
                                  //                     : deaible,
                                  //             size: 25,
                                  //           )
                                  //         : Icon(
                                  //             Icons.visibility,
                                  //             color:
                                  //                 selected == FormData.password
                                  //                     ? enabledtxt
                                  //                     : deaible,
                                  //             size: 25,
                                  //           ),
                                  //     onPressed: () {}
                                  //     // setState(
                                  //     //     () => ispasswordev = !ispasswordev),
                                  //     ),
                                  hintText: 'Mật khẩu',
                                  hintStyle: TextStyle(
                                      color: selected == FormData.password
                                          ? enabledtxt
                                          : deaible,
                                      fontSize: 18)),
                              obscureText: ispasswordev,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.password
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: selected == FormData.ConfirmPassword
                                    ? enabled
                                    : backgroundColor),
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              // controller: confirmPasswordController,
                              onTap: () {
                                // setState(() {
                                //   selected = FormData.ConfirmPassword;
                                // });
                              },
                              onChanged: (val) =>
                                  controller.confirmPass.value = val,
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.lock_open_outlined,
                                    color: selected == FormData.ConfirmPassword
                                        ? enabledtxt
                                        : deaible,
                                    size: 25,
                                  ),
                                  // suffixIcon: IconButton(
                                  //     icon: ispasswordev
                                  //         ? Icon(
                                  //             Icons.visibility_off,
                                  //             color: selected ==
                                  //                     FormData.ConfirmPassword
                                  //                 ? enabledtxt
                                  //                 : deaible,
                                  //             size: 25,
                                  //           )
                                  //         : Icon(
                                  //             Icons.visibility,
                                  //             color: selected ==
                                  //                     FormData.ConfirmPassword
                                  //                 ? enabledtxt
                                  //                 : deaible,
                                  //             size: 25,
                                  //           ),
                                  //     onPressed: () {}
                                  //     // setState(
                                  //     //     () => ispasswordev = !ispasswordev),
                                  //     ),
                                  hintText: 'Nhập lại mật khẩu',
                                  hintStyle: TextStyle(
                                      color:
                                          selected == FormData.ConfirmPassword
                                              ? enabledtxt
                                              : deaible,
                                      fontSize: 18)),
                              obscureText: ispasswordev,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                  color: selected == FormData.ConfirmPassword
                                      ? enabledtxt
                                      : deaible,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: TextButton(
                              onPressed: () {
                                controller.registerUsers();
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFF2697FF),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14.0, horizontal: 80),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0))),
                              child: const Text(
                                "Đăng ký",
                                style: TextStyle(
                                  color: Colors.white,
                                  // letterSpacing: 0.5,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Nếu bạn đã có tài khoản? ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    letterSpacing: 0.5,
                                  )),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return LoginScreen();
                                  }));
                                },
                                child: Text("Đăng nhập tại đây",
                                    style: TextStyle(
                                        color:
                                            Colors.blueAccent.withOpacity(0.9),
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                        fontSize: 15)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //End of Center Card
                //Start of outer card
              ],
            ),
          ),
        ),
      ),
    );
  }
}
