import 'package:btms_refee/Models/user.dart';
import 'package:get/get.dart';

import '../../Models/bird.dart';
import '../../Routes/routes.dart';

class SharedStates extends GetxService {
  /// selected bottom bar index
  final bottomBarSelectedIndex = 0.obs;
  String token = '';
  int birdId = 0;
  int bird_id_type = 0;
  // // Coupon
  Bird? bird;
  final birdList1 = <Bird>[].obs;
  int tournamentId = 0;
  int roundId = 0;
  int roundNumber = 0;
  int roundResultId = 0;
  double price = 0;

  bool isEva = false;
  User? account;

  // // Coupon
  // final couponInUse = CouponInUse().obs;

  // // Building
  // final building =
  //     Building(id: 12, name: "Đại học FPT thành phố Hồ Chí Minh").obs;

  // // List shopping
  // final shoppingList = ShoppingList().obs;

  // Current shopping item
  //final shoppingItemIndex = -1.obs;

  void logout() {
    Get.toNamed(Routes.login);
  }

  // new version no context
  // void showLoginBottomSheet() {
  //   //TextEditingController phoneController = TextEditingController();
  //   TextEditingController passController = TextEditingController();
  //   LoginEmailController loginController = Get.put(LoginEmailController());
  //   Get.bottomSheet(
  //     SingleChildScrollView(
  //       child: Container(
  //         color: Colors.white,
  //         child: Padding(
  //           padding: const EdgeInsets.only(left: 20, right: 20),
  //           child: Column(
  //             children: <Widget>[
  //               Row(
  //                 children: [
  //                   SizedBox(
  //                     width: 150,
  //                   ),
  //                   Text("Login",
  //                       style: TextStyle(
  //                           fontSize: 20,
  //                           color: Colors.black.withOpacity(0.8),
  //                           fontWeight: FontWeight.bold)),
  //                   SizedBox(
  //                     width: 110,
  //                   ),
  //                   IconButton(
  //                     icon: Icon(
  //                       Icons.close,
  //                       color: Colors.black,
  //                       size: 25,
  //                     ),
  //                     onPressed: () {
  //                       Get.back();
  //                     },
  //                   )
  //                 ],
  //               ),
  //               Container(
  //                 margin: EdgeInsets.only(top: 10, right: 20, left: 20),
  //                 child: TextField(
  //                   decoration: InputDecoration(
  //                       hintText: 'Enter Mobile Number',
  //                       hintStyle: TextStyle(color: Colors.black45),
  //                       prefixIcon: Icon(
  //                         Icons.phone,
  //                         color: Colors.grey,
  //                       )),
  //                   maxLength: 10,
  //                   keyboardType: TextInputType.number,
  //                   controller: phoneController,
  //                 ),
  //                 decoration:
  //                     BoxDecoration(borderRadius: BorderRadius.circular(4)),
  //               ),
  //               Obx(() {
  //                 return Container(
  //                   margin: EdgeInsets.only(right: 20, left: 20),
  //                   child: TextField(
  //                     obscureText:
  //                         loginController.isShowPass.value ? true : false,
  //                     decoration: InputDecoration(
  //                       suffixIcon: IconButton(
  //                         onPressed: () {
  //                           loginController.changeIshowPass();
  //                         },
  //                         icon: Icon(
  //                           Icons.remove_red_eye,
  //                           color: loginController.isShowPass.value
  //                               ? Colors.grey
  //                               : Colors.blue,
  //                         ),
  //                       ),
  //                       prefixIcon: Icon(
  //                         Icons.lock,
  //                         color: Colors.grey,
  //                       ),
  //                       hintText: 'Enter Password',
  //                       hintStyle: TextStyle(color: Colors.black45),
  //                     ),
  //                     controller: passController,
  //                   ),
  //                   decoration:
  //                       BoxDecoration(borderRadius: BorderRadius.circular(4)),
  //                 );
  //               }),
  //               Container(
  //                 margin: EdgeInsets.only(top: 20, right: 20, left: 20),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     Container(
  //                       width: 140,
  //                       child: ElevatedButton(
  //                         style: ElevatedButton.styleFrom(
  //                           primary: AppColors.primary,
  //                         ),
  //                         onPressed: () {
  //                           Get.toNamed(Routes.loginPhone);
  //                         },
  //                         child: Text(
  //                           'Sign Up',
  //                           style: TextStyle(color: Colors.white),
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       width: 20,
  //                     ),
  //                     Container(
  //                       width: 140,
  //                       child: OutlinedButton(
  //                         style: ButtonStyle(
  //                           shape: MaterialStateProperty.all(
  //                             RoundedRectangleBorder(
  //                                 borderRadius: BorderRadius.circular(5.0),
  //                                 side: BorderSide(
  //                                     color: Colors.purpleAccent, width: 2)),
  //                           ),
  //                         ),
  //                         onPressed: () {
  //                           loginController.checkLoginWithPhoneAndPass(
  //                               phoneController.value.text,
  //                               passController.value.text);
  //                         },
  //                         child: Text(
  //                           'Login',
  //                           style: TextStyle(color: AppColors.primary),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(height: 10),
  //               Row(
  //                 children: [
  //                   SizedBox(
  //                     width: 220,
  //                   ),
  //                   Text('Forgot Password ?',
  //                       style:
  //                           TextStyle(fontSize: 15, color: AppColors.primary)),
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 30,
  //               ),
  //               Center(
  //                   child: Text(
  //                 'You can also login with these methods',
  //                 style: TextStyle(
  //                     fontSize: 15, color: Colors.black.withOpacity(0.8)),
  //               )),
  //               SizedBox(height: 20),
  //               SignInButton(
  //                 Buttons.GoogleDark,
  //                 text: "Sign up with Google",
  //                 onPressed: () {
  //                   LoginEmailController loginController = Get.find();
  //                   loginController.loginWithGoogle();
  //                 },
  //               ),
  //               SizedBox(height: 20),
  //               Container(
  //                 width: 300,
  //                 margin: const EdgeInsets.only(bottom: 15),
  //                 child: RichText(
  //                   text: TextSpan(children: [
  //                     TextSpan(
  //                       text: 'You agree ',
  //                       style: TextStyle(
  //                         fontSize: 14,
  //                         color: Colors.black.withOpacity(0.8),
  //                       ),
  //                     ),
  //                     TextSpan(
  //                       text: 'User Agreement ',
  //                       style: TextStyle(
  //                           fontSize: 14, color: Colors.blue.withOpacity(0.8)),
  //                     ),
  //                     TextSpan(
  //                       text: 'and ',
  //                       style: TextStyle(
  //                           fontSize: 14, color: Colors.black.withOpacity(0.8)),
  //                     ),
  //                     TextSpan(
  //                       text: 'Privacy Policy',
  //                       style: TextStyle(
  //                           fontSize: 14, color: Colors.blue.withOpacity(0.8)),
  //                     ),
  //                   ]),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     barrierColor: Colors.transparent,
  //     isDismissible: false,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(5),
  //       side: BorderSide(width: 0.5, color: Colors.grey),
  //     ),
  //     enableDrag: false,
  //   );
  // }
}
