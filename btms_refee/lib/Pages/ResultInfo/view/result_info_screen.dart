import 'package:btms_refee/Pages/ResultInfo/controller/result_info_controller.dart';
import 'package:btms_refee/Widgets/radio_button.dart';
import 'package:btms_refee/Widgets/status_type_button.dart';
import 'package:btms_refee/Widgets/status_type_button1.dart';
import 'package:btms_refee/Widgets/status_type_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flip_card/flip_card.dart';

class _ResultInfor extends StatefulWidget {
  const _ResultInfor({Key? key}) : super(key: key);

  @override
  State<_ResultInfor> createState() => ResultInfoScreen();
  static const String routeName = "/_ResultInfor";
  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }
}

// class Result extends GetView<ResultInfoController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

class ResultInfoScreen extends State<_ResultInfor> {
  final String _selectedPoint = 'Đạt';
  // const ResultInfoScreen({Key? key}) : super(key: key);
  final controller = Get.put(ResultInfoController());
//  @override
  // GetView<_ResultInfor> createState() => ResultInfoScreen();
// }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    // Get.put(RadioButtonController());

    // return Obx(() {
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
              'Chi tiết chấm điểm',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.55,
              child: Obx(
                () {
                  var typeScore = controller.scoreTypeList;
                  if (typeScore.isEmpty) {
                    return const Text(
                      "Chưa có thể loại chấm điểm!",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    );
                  } else {
                    return Container(
                      width: screenSize.width * 1,
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                        addSemanticIndexes: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: typeScore.length,
                        itemBuilder: (BuildContext ctv, index) {
                          final type = typeScore[index];
                          return Container(
                            // width: 350,
                            child: Card(
                              color: Color.fromARGB(255, 245, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    // width: 200,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    decoration: const BoxDecoration(
                                      color: Colors.black12,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const ClipOval(
                                          child: Material(
                                            color: Colors.white,
                                            child: SizedBox(
                                              width: 60,
                                              height: 60,
                                              child:
                                                  /*Image.asset(
                                        'assets/icons/doc_icon.png'),*/
                                                  Icon(
                                                Icons.playlist_add_check,
                                                // color: AppTheme.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  type.name.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                    addSemanticIndexes: true,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: type.scoringCriterias!.length,
                                    itemBuilder: (BuildContext ctv, index) {
                                      final criti =
                                          type.scoringCriterias![index];
                                      return Container(
                                        margin: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        // width: _containerWidth,
                                        //padding: EdgeInsets.only(top: 2, bottom: 2),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                                child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                criti.name.toString(),
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )),
                                            //Expanded(child: Container()),
                                            // CheckboxExample(),
                                            Checkbox(
                                              value: criti.isSelected,
                                              onChanged: (newValue) {
                                                // criti.isSelected = !criti.isSelected;
                                                // controller.scoreCriteriaList
                                                //     .add(criti.id);
                                                // print("$value  value");

                                                setState(() {
                                                  criti.isSelected = newValue!;
                                                });
                                                // addRemoveFavHealth(
                                                //     value, condition.id);
                                              },
                                              activeColor: Colors.red,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  // Obx(() {
                                  //   return Container(
                                  //     child:

                                  //   );
                                  // }),
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
            ),
          ],
        ),
      ),
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
    );
  }
}

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
