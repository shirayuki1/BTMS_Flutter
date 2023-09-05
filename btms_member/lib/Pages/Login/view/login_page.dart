// import 'package:btms/Routes/routes.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/Color/hexa_color.dart';
import '../../../Widgets/fade_amimation.dart';
import '../../SignUp/view/signUpScreen.dart';
import '../controller/login_controller.dart';

enum FormData {
  Email,
  password,
}

class LoginScreen extends GetView<LoginController> {
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color deaible = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  FormData? selected;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // LoginScreen({super.key});

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
          // image: DecorationImage(
          //   fit: BoxFit.cover,
          //   colorFilter: ColorFilter.mode(
          //       HexColor("#ffffff").withOpacity(0.2), BlendMode.dstATop),
          //   image: const NetworkImage(
          //     '',
          //   ),
          // ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
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
                        height: 5,
                      ),
                      const FadeAnimation(
                        delay: 1,
                        child: Text(
                          "Giải đấu loài chim",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            // letterSpacing: 0.5,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: Text(
                          "Đăng nhập để tham gia giải đấu",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: HexColor("#111111"),
                            // letterSpacing: 0.5,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.only(
                    top: 25,
                  ),
                  color:
                      // const Color.fromARGB(255, 171, 211, 250).withOpacity(0.4),
                      const Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: Color.fromARGB(255, 255, 255, 255),
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      // mainAxisAlignment: MainAxisAlignment.center,
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
                              controller: emailController,
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
                                  fontSize: 18,
                                ),
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(
                                color: selected == FormData.Email
                                    ? enabledtxt
                                    : deaible,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
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
                              controller: passwordController,
                              onTap: () {
                                //controller
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
                                //             color: selected == FormData.password
                                //                 ? enabledtxt
                                //                 : deaible,
                                //             size: 25,
                                //           )
                                //         : Icon(
                                //             Icons.visibility,
                                //             color: selected == FormData.password
                                //                 ? enabledtxt
                                //                 : deaible,
                                //             size: 25,
                                //           ),
                                //     onPressed: () {
                                //       //controller
                                //     }),
                                hintText: 'Mật khẩu',
                                hintStyle: TextStyle(
                                    color: selected == FormData.password
                                        ? enabledtxt
                                        : deaible,
                                    fontSize: 18),
                              ),
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
                          height: 30,
                        ),
                        FadeAnimation(
                          delay: 1,
                          child: TextButton(
                            onPressed: () {
                              controller.loginWithUsername();
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF2697FF),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14.0, horizontal: 80),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0))),
                            child: const Text(
                              "Đăng nhập",
                              style: TextStyle(
                                color: Colors.white,
                                // letterSpacing: 0.5,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // //FORGOT PASSWORD
                        // FadeAnimation(
                        //   delay: 0.1,
                        //   child: GestureDetector(
                        //     onTap: (() {
                        //       Get.toNamed(Routes.forgotPass);
                        //     }),
                        //     child: Text("Quên mật khẩu?",
                        //         textAlign: TextAlign.center,
                        //         style: TextStyle(
                        //           fontSize: 15,
                        //           color: Colors.blueAccent.withOpacity(0.9),
                        //           // letterSpacing: 0.5,
                        //         )),
                        //   ),
                        // ),
                        // Text(
                        //   "_____________________________",
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.w500,
                        //     color: HexColor("#DDDDDD").withOpacity(0.5),
                        //   ),
                        // ),
                        // //LOGIN WITH GOOGLE
                        // GestureDetector(
                        //   onTap: () {
                        //     // Get.toNamed(Routes.homeScreen);
                        //   },
                        //   child: Container(
                        //     height: 50,
                        //     margin: const EdgeInsets.only(
                        //       top: 20,
                        //       left: 50,
                        //       right: 50,
                        //     ),
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(15),
                        //       border: Border.all(color: Colors.black),
                        //       // color: Colors.black,
                        //     ),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         // Image.network(
                        //         //   "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2008px-Google_%22G%22_Logo.svg.png",
                        //         //   width: 30,
                        //         //   height: 30,
                        //         // ),

                        //         Container(
                        //           height: 30,
                        //           width: 30,
                        //           child: Image.asset(
                        //             'assets/icons/google_icons.png',
                        //           ),
                        //         ),
                        //         const SizedBox(
                        //           width: 15,
                        //         ),
                        //         const Text(
                        //           "Đăng nhập với Google",
                        //           style: TextStyle(
                        //             fontSize: 15,
                        //             fontWeight: FontWeight.w500,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 30,
                        ),
                        //SIGN UP ACCOUNT
                        FadeAnimation(
                          delay: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Bạn chưa có tài khoản? ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    // letterSpacing: 0.5,
                                  )),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return SignUpScreen();
                                  }));
                                },
                                child: Text("Tạo tài khoản ở đây",
                                    style: TextStyle(
                                        color:
                                            Colors.blueAccent.withOpacity(0.9),
                                        fontWeight: FontWeight.bold,
                                        // letterSpacing: 0.5,
                                        fontSize: 15)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
