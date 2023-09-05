import 'package:btms_refee/Constants/Color/hexa_color.dart';
import 'package:btms_refee/Models/round.dart';
import 'package:btms_refee/Pages/ResultInfo/view/result_info_screen.dart';
import 'package:btms_refee/Pages/RoundResult/controller/round_result_controller.dart';
import 'package:btms_refee/Pages/HistoryRoundResult/controller/round_result_history_controller.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundResultHistoryScreen extends GetView<RoundResultHistoryController> {
  const RoundResultHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var routes = <String, WidgetBuilder>{
    //   _ResultInfor.routeName: (BuildContext context) => new _ResultInfor(title: "MyItemsPage"),
    // };
    Size screenSize = MediaQuery.of(context).size;
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
        title: const Text(
          'Kết quả chim thi đấu',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () {
                  var listRoundResult = controller.roundResultList;
                  if (listRoundResult.isEmpty) {
                    return const Center(
                      child: Expanded(
                        child: Text(
                          style: TextStyle(fontSize: 18),
                          "Chưa có danh sách chim thi đấu. Hãy chờ đợi.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    // return Text("....");
                    return Container(
                      height: screenSize.height * 0.88,
                      margin:
                          const EdgeInsets.only(right: 15, left: 15, top: 10),
                      alignment: Alignment.center,
                      child: ListView.builder(
                        addSemanticIndexes: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listRoundResult.length,
                        itemBuilder: (BuildContext ctv, index) {
                          final round = listRoundResult[index];
                          return GestureDetector(
                            onTap: () {
                              // controller.getRoundResultId(round.roundResult_Id);
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   // do something
                              //   return const _ResultInfor();
                              // }));

                              // // controller.goToDetail(bird.bird_Id);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => ResultInfoScreen()),
                              // );
                            },
                            child: Container(
                              height: 130,
                              margin: const EdgeInsets.only(
                                bottom: 20,
                              ),
                              padding: const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black),
                                //
                                color: HexColor("##f0ffff"),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 120,
                                      bottom: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Xếp hạng: ",
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          round.rank.toString() == "null"
                                              ? "chưa có"
                                              : round.rank.toString(),
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Text(
                                        "SBD: ",
                                        // textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          round.candidateNumber.toString() ==
                                                  "null"
                                              ? "Chưa có"
                                              : "${round.candidateNumber.toString()}",
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 80,
                                      ),
                                      const Text(
                                        "Tên chim: ",
                                        // textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          "${round.bird?.name}",
                                          // round.bird.name.toString(),
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Text(
                                        "Cảnh cáo: ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        round.warnCount.toString() + " Lần",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Text(
                                        "Trạng thái thí đấu:",
                                        // textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          controller.updateStatus1(
                                              round.isPass.toString())!,
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.deepOrangeAccent),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),

      //   body: Container(
      //     // alignment: Alignment.center,
      //     width: double.infinity,
      //     padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
      //     child: Column(
      //       children: [
      //         GestureDetector(
      //           onTap: () {
      //             Get.toNamed(Routes.resultInfoBird);
      //           },
      //           child: Container(
      //             width: screenSize.width * 0.85,
      //             height: screenSize.height * 0.08,
      //             // alignment: Alignment.center,
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 border: Border.all(color: Colors.black)),
      //             child: GestureDetector(
      //               child: Row(
      //                 children: [
      //                   const SizedBox(
      //                     width: 20,
      //                   ),
      //                   Image.network(
      //                     "https://chimchaomao.vn/upload/baiviet/logomobile-4993.png",
      //                     width: 30,
      //                     height: 30,
      //                   ),
      //                   const SizedBox(
      //                     width: 20,
      //                   ),
      //                   const Text(
      //                     "Chim chào mào một",
      //                     textAlign: TextAlign.right,
      //                     style: TextStyle(
      //                         fontSize: 20, fontWeight: FontWeight.w500),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
    );
  }
}

// class _ResultInfor extends StatefulWidget {
//   const _ResultInfor({Key? key}) : super(key: key);

//   @override
//   State<_ResultInfor> createState() => ResultInfoScreen();
//   static const String routeName = "/_ResultInfor";
//   // @override
//   // Widget build(BuildContext context) {
//   //   // TODO: implement build
//   //   throw UnimplementedError();
//   // }
// }

// class Result extends GetView<ResultInfoController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

// class ResultInfoScreen extends State<_ResultInfor> {
//   final String _selectedPoint = 'Đạt';
//   // const ResultInfoScreen({Key? key}) : super(key: key);
//   final controller = Get.put(RoundResultController());
// //  @override
//   // GetView<_ResultInfor> createState() => ResultInfoScreen();
// // }
//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     // Get.put(RadioButtonController());

//     // return Obx(() {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             Get.back(closeOverlays: true);
//           },
//         ),
//         elevation: 1,
//         title: const Column(
//           children: [
//             Text(
//               'Chi tiết chấm điểm',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: Container(
//           height: screenSize.height * 0.9,
//           child: ListView(
//             // mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(
//                   top: 5,
//                 ),
//                 height: screenSize.height * 0.55,
//                 child: Obx(
//                   () {
//                     var typeScore = controller.scoreTypeList;
//                     if (typeScore.isEmpty) {
//                       return const Text(
//                         "Chưa có thể loại chấm điểm!",
//                         style: TextStyle(
//                           fontSize: 18,
//                         ),
//                       );
//                     } else {
//                       return Container(
//                         // height: screenSize.height * 0.8,
//                         width: screenSize.width * 1,
//                         alignment: Alignment.topCenter,
//                         child: ListView.builder(
//                           addSemanticIndexes: true,
//                           shrinkWrap: true,
//                           scrollDirection: Axis.vertical,
//                           itemCount: typeScore.length,
//                           itemBuilder: (BuildContext ctv, index) {
//                             final type = typeScore[index];
//                             // return GestureDetector(
//                             //   onTap: () {},
//                             //   child: Container(
//                             //     height: 110,
//                             //     width: 50,
//                             //     margin: const EdgeInsets.only(
//                             //       bottom: 20,
//                             //     ),
//                             //     padding: const EdgeInsets.only(
//                             //       top: 5,
//                             //       bottom: 5,
//                             //     ),
//                             //     alignment: Alignment.center,
//                             //     decoration: BoxDecoration(
//                             //         borderRadius: BorderRadius.circular(15),
//                             //         border: Border.all(color: Colors.black)),
//                             //     child: Expanded(
//                             //       child: Text(
//                             //         type.name.toString(),
//                             //         style: TextStyle(
//                             //           fontSize: 20,
//                             //           fontWeight: FontWeight.bold,
//                             //         ),
//                             //       ),
//                             //     ),
//                             //   ),
//                             // );
//                             // return FlipCard(
//                             //   alignment: Alignment.center,
//                             //   direction: FlipDirection.HORIZONTAL, // default
//                             //   front: Container(
//                             //     alignment: Alignment.center,
//                             //     height: screenSize.height * 0.2,
//                             //     width: screenSize.width * 0.8,
//                             //     color: Colors.red,
//                             //     child: Text(
//                             //       type.name.toString(),
//                             //       style: const TextStyle(
//                             //         fontSize: 18,
//                             //         fontWeight: FontWeight.bold,
//                             //       ),
//                             //     ),
//                             //   ),

//                             //   back: ListView.builder(
//                             //     addSemanticIndexes: true,
//                             //     shrinkWrap: true,
//                             //     scrollDirection: Axis.vertical,
//                             //     itemCount: type.scoringCriterias!.length,
//                             //     itemBuilder: (BuildContext ctv, index) {
//                             //       final criti = type.scoringCriterias![index];
//                             //       return Text(criti.name.toString());
//                             //     },
//                             //   ),
//                             // );o
//                             return Container(
//                               // width: screenSize.width * 0.5,
//                               child: Card(
//                                 color: Colors.white,
//                                 child: Column(
//                                   children: [
//                                     Container(
//                                       // width: 200,
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 8, horizontal: 8),
//                                       decoration: const BoxDecoration(
//                                         color: Colors.black12,
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           const ClipOval(
//                                             child: Material(
//                                               color: Colors.white,
//                                               child: SizedBox(
//                                                 width: 40,
//                                                 height: 40,
//                                                 child:
//                                                     /*Image.asset(
//                                         'assets/icons/doc_icon.png'),*/
//                                                     Icon(
//                                                   Icons.playlist_add_check,
//                                                   // color: AppTheme.primaryColor,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Flexible(
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: <Widget>[
//                                                   Text(
//                                                     // _localization
//                                                     //     .localeString(name),
//                                                     type.name.toString(),
//                                                     // style: TextStyle(
//                                                     //     color: AppTheme
//                                                     //         .primaryColor),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     ListView.builder(
//                                       addSemanticIndexes: true,
//                                       shrinkWrap: true,
//                                       scrollDirection: Axis.vertical,
//                                       itemCount: type.scoringCriterias!.length,
//                                       itemBuilder: (BuildContext ctv, index) {
//                                         final criti =
//                                             type.scoringCriterias![index];
//                                         return Container(
//                                           // width: _containerWidth,
//                                           //padding: EdgeInsets.only(top: 2, bottom: 2),
//                                           child: Row(
//                                             children: <Widget>[
//                                               Expanded(
//                                                   child: Container(
//                                                 margin: const EdgeInsets.only(
//                                                     left: 10),
//                                                 child: Text(
//                                                   criti.name.toString(),
//                                                 ),
//                                               )),
//                                               //Expanded(child: Container()),
//                                               // CheckboxExample(),
//                                               Checkbox(
//                                                 value: criti.isSelected,
//                                                 onChanged: (newValue) {
//                                                   // controller.scoreCriteriaList
//                                                   //     .add(criti.id);
//                                                   // print("$value  value");

//                                                   setState(() {
//                                                     // criti.isSelected = newValue!;
//                                                     criti.isSelected =
//                                                         !criti.isSelected;
//                                                   });
//                                                   // addRemoveFavHealth(
//                                                   //     value, condition.id);
//                                                 },
//                                                 activeColor: Colors.red,
//                                               ),
//                                             ],
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                     // Obx(() {
//                                     //   return Container(
//                                     //     child:

//                                     //   );
//                                     // }),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(
//                   top: 10,
//                 ),
//                 alignment: Alignment.topCenter,
//                 height: screenSize.height * 0.3,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: <Widget>[
//                         //Expanded(child: Container()),
//                         // CheckboxExample(),
//                         Checkbox(
//                           value: controller.isWarn,
//                           onChanged: (newValue) {
//                             // controller.scoreCriteriaList
//                             //     .add(criti.id);
//                             // print("$value  value");

//                             setState(() {
//                               // criti.isSelected = newValue!;
//                               controller.isWarn = !controller.isWarn;
//                             });
//                             // addRemoveFavHealth(
//                             //     value, condition.id);
//                           },
//                           activeColor: Colors.red,
//                         ),
//                         Expanded(
//                             child: Container(
//                           margin: const EdgeInsets.only(left: 10),
//                           child: Text("Cảnh cáo chim thi đấu"),
//                         )),
//                       ],
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(
//                         top: 5,
//                         left: 15,
//                         right: 15,
//                         bottom: 10,
//                       ),
//                       child: TextField(
//                         onChanged: (val) => controller.note.value = val,
//                         // obscureText: isPasswordTextField ? showPassword : false,
//                         decoration: const InputDecoration(
//                           contentPadding: EdgeInsets.only(bottom: 3),
//                           labelText: "Ghi chú:",
//                           labelStyle: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                           floatingLabelBehavior: FloatingLabelBehavior.always,
//                           hintText: "Nhập nhận xét đánh giá",
//                           hintStyle: TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//                     //
//                     Container(
//                       margin: const EdgeInsets.only(
//                         left: 30,
//                         right: 30,
//                         bottom: 15,
//                       ),
//                       width: screenSize.width * 0.75,
//                       height: screenSize.height * 0.05,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           color: const Color(0xff00CC00),
//                           borderRadius: BorderRadius.circular(4)),
//                       child: GestureDetector(
//                         onTap: () {
//                           controller.evaluateBird();
//                           // Get.toNamed(Routes.round);
//                         },
//                         child: const Text(
//                           "Gửi kết quả đánh giá",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
      // SafeArea(
      //   child: SingleChildScrollView(
      //     controller: controller.scrollController,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Container(
      //           height: screenSize.height * 0.8,
      //           width: screenSize.width * 0.8,
      //           child:
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      //   body: Container(
      //     padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
      //     child: GestureDetector(
      //       onTap: () {
      //         FocusScope.of(context).unfocus();
      //       },
      //       child: ListView(children: [
      //         Column(
      //           children: [
      //             Container(
      //               child: const Text(
      //                 "Các tiêu chí chấm điểm",
      //                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 40,
      //             ),
      //             Container(
      //               child: const Row(
      //                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text(
      //                     "Thái độ thi đấu",
      //                     style: TextStyle(
      //                       fontSize: 20,
      //                     ),
      //                   ),
      //                   StatusTypeButton(
      //                     value: "Đạt",
      //                     title: "Đạt",
      //                     isPass: true,
      //                   ),
      //                   StatusTypeButton(
      //                       value: "Không đạt",
      //                       title: "Không đạt",
      //                       isPass: false),
      //                   // StatusTypeButton(
      //                   //     value: "Đạt", title: "Đạt", isPass: true),
      //                   // StatusTypeButton(
      //                   //     value: "Không đạt",
      //                   //     title: "Không đạt",
      //                   //     isPass: false),
      //                   // ListTile(
      //                   //   leading: Radio<String>(
      //                   //     value: 'male',
      //                   //     groupValue: _selectedGender,
      //                   //     onChanged: (value) {
      //                   //       setState(() {
      //                   //         _selectedGender = value!;
      //                   //       });
      //                   //     },
      //                   //   ),
      //                   //   title: const Text('Male'),
      //                   // ),
      //                 ],
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 40,
      //             ),
      //             Container(
      //               child: const Row(
      //                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                 children: [
      //                   Expanded(
      //                     child: Text(
      //                       "Giọng hót thi đấu",
      //                       style: TextStyle(
      //                         fontSize: 20,
      //                       ),
      //                     ),
      //                   ),
      //                   StatusTypeButton1(
      //                     value: "Đạt",
      //                     title: "Đạt",
      //                     isPass: true,
      //                   ),
      //                   StatusTypeButton1(
      //                       value: "Không đạt",
      //                       title: "Không đạt",
      //                       isPass: false),
      //                   // Row(
      //                   //   children: [
      //                   //     Radio(
      //                   //       value: "Không đạt",
      //                   //       groupValue: "",
      //                   //       onChanged: (value) {},
      //                   //       activeColor: Colors.green,
      //                   //       fillColor:
      //                   //           MaterialStateProperty.all(Colors.greenAccent),
      //                   //     ),
      //                   //     const Text(
      //                   //       "Không đạt",
      //                   //       style: TextStyle(
      //                   //         fontSize: 20,
      //                   //         fontWeight: FontWeight.w500,
      //                   //       ),
      //                   //     ),
      //                   //   ],
      //                   // ),
      //                 ],
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 40,
      //             ),
      //             Container(
      //               child: const Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text(
      //                     "Dáng vẻ thi đấu",
      //                     style: TextStyle(
      //                       fontSize: 20,
      //                     ),
      //                   ),
      //                   StatusTypeButton2(
      //                     value: "Đạt",
      //                     title: "Đạt",
      //                     isPass: true,
      //                   ),
      //                   StatusTypeButton2(
      //                       value: "Không đạt",
      //                       title: "Không đạt",
      //                       isPass: false),
      //                 ],
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 35,
      //             ),
      //             Container(
      //               alignment: Alignment.centerLeft,
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   const Text(
      //                     "Ghi chú:",
      //                     style: TextStyle(
      //                       fontSize: 25,
      //                       fontWeight: FontWeight.w500,
      //                     ),
      //                   ),
      //                   const SizedBox(
      //                     height: 20,
      //                   ),
      //                   Container(
      //                     child: const Text(
      //                       "Chim nhảy yếu quá, trừ điểm",
      //                       style: TextStyle(
      //                         fontSize: 20,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             // GestureDetector(
      //             //   onTap: () {
      //             //     Get.toNamed(Routes.resultBird);
      //             //   },
      //             //   child: Container(child: Text(""),),
      //             // )
      //           ],
      //         ),
      //       ]),
      //     ),
      //   ),
  //   );
  // }
// }

// class CheckboxExample extends StatefulWidget {
//   const CheckboxExample({super.key});

//   @override
//   State<CheckboxExample> createState() => _CheckboxExampleState();
// }

// class _CheckboxExampleState extends State<CheckboxExample> {
//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     Color getColor(Set<MaterialState> states) {
//       const Set<MaterialState> interactiveStates = <MaterialState>{
//         MaterialState.pressed,
//         MaterialState.hovered,
//         MaterialState.focused,
//       };
//       if (states.any(interactiveStates.contains)) {
//         return Colors.blue;
//       }
//       return Colors.red;
//     }

//     return Checkbox(
//       checkColor: Colors.white,
//       fillColor: MaterialStateProperty.resolveWith(getColor),
//       value: isChecked,
//       onChanged: (bool? value) {
//         setState(() {
//           isChecked = value!;
//         });
//       },
//     );
//   }
// }

