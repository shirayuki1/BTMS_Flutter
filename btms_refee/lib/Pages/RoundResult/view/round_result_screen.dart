import 'package:btms_refee/Constants/Color/hexa_color.dart';
import 'package:btms_refee/Models/round.dart';
import 'package:btms_refee/Pages/ResultInfo/view/result_info_screen.dart';
import 'package:btms_refee/Pages/RoundResult/controller/round_result_controller.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:btms_refee/Services/GlobalStates/share_states.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundResultScreen extends GetView<RoundResultController> {
  const RoundResultScreen({super.key});

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
            // Get.toNamed(Routes.round);
            controller.goToRound();
          },
        ),
        elevation: 1,
        title: const Text(
          'Danh sách đánh giá chim',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Container(
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
                        height: screenSize.height * 0.9,
                        margin: const EdgeInsets.only(
                          right: 15,
                          left: 15,
                          top: 5,
                          bottom: 5,
                        ),
                        alignment: Alignment.center,
                        child: ListView.builder(
                          addSemanticIndexes: true,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listRoundResult.length,
                          itemBuilder: (BuildContext ctv, index) {
                            final round = listRoundResult[index];
                            if (round.isEvaluate == true) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        // do something
                                        return const _ResultInfor3();
                                      },
                                    ),
                                  );
                                  controller
                                      .getResultEvaluate(round.roundResult_Id);
                                  // if (listRoundResult.length == 4) {
                                  //   Navigator.push(context,
                                  //       MaterialPageRoute(builder: (context) {
                                  //     // do something
                                  //     return const _ResultInfor2();
                                  //   }));
                                  // } else {
                                  //   Navigator.push(context,
                                  //       MaterialPageRoute(builder: (context) {
                                  //     // do something
                                  //     return const _ResultInfor();
                                  //   }));
                                  // }
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) {
                                  //   // do something
                                  //   return const _ResultInfor();
                                  // }));
                                },
                                child: Container(
                                  height: 170,
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
                                    color: HexColor("#EEEEEE"),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 30),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Xếp hạng: ",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 0,
                                                  child: Text(
                                                    round.rank.toString() ==
                                                            "null"
                                                        ? "Chưa có"
                                                        : round.rank.toString(),
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 30,
                                            ),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  "SBD: ",
                                                  // textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Expanded(
                                                  flex: 0,
                                                  child: Text(
                                                    round.candidateNumber
                                                                .toString() ==
                                                            "null"
                                                        ? "Chưa có"
                                                        : "${round.candidateNumber.toString()}",
                                                    textAlign: TextAlign.right,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            "Tên chim:",
                                            // textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "${round.bird?.name}",
                                              // round.bird.name.toString(),
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
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
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            "Trạng thái thí đấu: ",
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
                                                  color:
                                                      Colors.deepOrangeAccent),
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
                                            "Trạng thái chấm điểm: ",
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
                                              round.isEvaluate.toString() ==
                                                      "false"
                                                  ? "Chưa chấm"
                                                  : "Đã chấm điểm",
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  SharedStates t = Get.find();
                                  if (t.isEva == false) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      // do something
                                      return const _ResultInfor();
                                    }));
                                  } else {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      // do something
                                      return const _ResultInfor2();
                                    }));
                                  }
                                  controller
                                      .getRoundResultId(round.roundResult_Id);
                                  // // controller.checkEvaluate();
                                  // if (listRoundResult.length == 4) {
                                  //   Navigator.push(context,
                                  //       MaterialPageRoute(builder: (context) {
                                  //     // do something
                                  //     return const _ResultInfor2();
                                  //   }));
                                  // } else {
                                  //   Navigator.push(context,
                                  //       MaterialPageRoute(builder: (context) {
                                  //     // do something
                                  //     return const _ResultInfor();
                                  //   }));
                                  // }
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) {
                                  //   // do something
                                  //   return const _ResultInfor();
                                  // }));
                                },
                                child: Container(
                                  height: 170,
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
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 30),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Xếp hạng: ",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 0,
                                                  child: Text(
                                                    round.rank.toString() ==
                                                            "null"
                                                        ? "Chưa có"
                                                        : round.rank.toString(),
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 30,
                                            ),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  "SBD: ",
                                                  // textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Expanded(
                                                  flex: 0,
                                                  child: Text(
                                                    round.candidateNumber
                                                                .toString() ==
                                                            "null"
                                                        ? "Chưa có"
                                                        : "${round.candidateNumber.toString()}",
                                                    textAlign: TextAlign.right,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            "Tên chim:",
                                            // textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "${round.bird?.name}",
                                              // round.bird.name.toString(),
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            textAlign: TextAlign.left,
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
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            "Trạng thái thí đấu: ",
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
                                                  color:
                                                      Colors.deepOrangeAccent),
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
                                            "Trạng thái chấm điểm: ",
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
                                              round.isEvaluate.toString() ==
                                                      "false"
                                                  ? "Chưa chấm"
                                                  : "Đã chấm điểm",
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      Colors.deepOrangeAccent),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
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

/////////////////////
/////////////////////
/////////////////////
/////////////////////
/////////////////////
/////////////////////
/////////////////////
/////////////////////
/////////////////////

class _ResultInfor extends StatefulWidget {
  const _ResultInfor({Key? key}) : super(key: key);

  @override
  State<_ResultInfor> createState() => ResultInfoScreen();
  // static const String routeName = "/_ResultInfor";
  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }
}

class ResultInfoScreen extends State<_ResultInfor> {
  final String _selectedPoint = 'Đạt';
  // const ResultInfoScreen({Key? key}) : super(key: key);
  final controller = Get.put(RoundResultController());

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
            Get.toNamed(Routes.roundResult);
            controller.getScoreTypeList();
            controller.isWarn = false;
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
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Container(
            height: screenSize.height * 0.9,
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                    left: 15,
                    right: 15,
                  ),
                  height: screenSize.height * 0.85,
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
                          // height: screenSize.height * 0.8,
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
                                // width: screenSize.width * 0.5,
                                // margin: const EdgeInsets.only(
                                //   left: 10,
                                //   right: 10,
                                // ),
                                child: Card(
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Container(
                                        // width: 200,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        decoration: const BoxDecoration(
                                          color: Colors.black12,
                                        ),
                                        child: Row(
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.stretch,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      // _localization
                                                      //     .localeString(name),
                                                      type.name.toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            HexColor("#FF0000"),
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
                                        itemCount:
                                            type.scoringCriterias!.length,
                                        itemBuilder: (BuildContext ctv, index) {
                                          final criti =
                                              type.scoringCriterias![index];
                                          return Container(
                                            // width: _containerWidth,
                                            //padding: EdgeInsets.only(top: 2, bottom: 2),
                                            margin: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                            ),
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                )),
                                                //Expanded(child: Container()),
                                                // CheckboxExample(),
                                                Checkbox(
                                                  value: criti.isSelected,
                                                  onChanged: (newValue) {
                                                    // controller.scoreCriteriaList
                                                    //     .add(criti.id);
                                                    // print("$value  value");

                                                    setState(() {
                                                      // criti.isSelected = newValue!;
                                                      criti.isSelected =
                                                          !criti.isSelected;
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
                Container(
                  alignment: Alignment.topCenter,
                  height: screenSize.height * 0.24,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        // margin: const EdgeInsets.only(
                        //   top: 10,
                        //   left: 10,
                        // ),
                        child: Row(
                          children: <Widget>[
                            //Expanded(child: Container()),
                            // CheckboxExample(),
                            Checkbox(
                              value: controller.isWarn,
                              onChanged: (newValue) {
                                // controller.scoreCriteriaList
                                //     .add(criti.id);
                                // print("$value  value");

                                setState(() {
                                  // criti.isSelected = newValue!;
                                  controller.isWarn = !controller.isWarn;
                                });
                                // addRemoveFavHealth(
                                //     value, condition.id);
                              },
                              activeColor: Colors.red,
                            ),
                            Expanded(
                                child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Text(
                                "Cảnh cáo chim thi đấu",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                          left: 20,
                          right: 20,
                          bottom: 35,
                        ),
                        child: TextField(
                          onChanged: (val) => controller.note.value = val,
                          // obscureText: isPasswordTextField ? showPassword : false,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                                // bottom: 1,
                                ),
                            labelText: "Ghi chú:",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "Nhập nhận xét đánh giá",
                            hintStyle: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      //
                      GestureDetector(
                        onTap: () {
                          controller.evaluateBird();
                          // Get.toNamed(Routes.round);
                          controller.getScoreTypeList();
                          controller.isWarn = false;
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                            // bottom: 10,
                          ),
                          width: screenSize.width * 0.75,
                          height: screenSize.height * 0.05,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xff00CC00),
                              borderRadius: BorderRadius.circular(4)),
                          child: const Text(
                            "Gửi kết quả đánh giá",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
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

class _ResultInfor2 extends StatefulWidget {
  const _ResultInfor2({Key? key}) : super(key: key);

  @override
  State<_ResultInfor2> createState() => ResultInfoScreen2();
  // static const String routeName = "/_ResultInfor";
  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }
}

class ResultInfoScreen2 extends State<_ResultInfor2> {
  final String _selectedPoint = 'Đạt';
  // const ResultInfoScreen({Key? key}) : super(key: key);
  final controller = Get.put(RoundResultController());

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
            Get.toNamed(Routes.roundResult);
            controller.getScoreTypeList();
            controller.isWarn = false;
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
        child: SingleChildScrollView(
          // controller: controller.scrollController,
          child: Container(
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            height: screenSize.height * 0.9,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                    left: 15,
                    right: 15,
                  ),
                  height: screenSize.height * 0.85,
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
                          // height: screenSize.height * 0.8,
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
                                // width: screenSize.width * 0.5,
                                // margin: const EdgeInsets.only(
                                //   left: 10,
                                //   right: 10,
                                // ),
                                child: Card(
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Container(
                                        // width: 200,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        decoration: const BoxDecoration(
                                          color: Colors.black12,
                                        ),
                                        child: Row(
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.stretch,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      type.name.toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            HexColor("#FF0000"),
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
                                        itemCount:
                                            type.scoringCriterias!.length,
                                        itemBuilder: (BuildContext ctv, index) {
                                          final criti =
                                              type.scoringCriterias![index];
                                          return Container(
                                            // width: _containerWidth,
                                            //padding: EdgeInsets.only(top: 2, bottom: 2),
                                            margin: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                            ),
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                )),
                                                //Expanded(child: Container()),
                                                // CheckboxExample(),
                                                Checkbox(
                                                  value: criti.isSelected,
                                                  onChanged: (newValue) {
                                                    // controller.scoreCriteriaList
                                                    //     .add(criti.id);
                                                    // print("$value  value");

                                                    setState(() {
                                                      // criti.isSelected = newValue!;
                                                      criti.isSelected =
                                                          !criti.isSelected;
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
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  alignment: Alignment.topCenter,
                  height: screenSize.height * 0.24,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 10,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(
                                left: 10,
                                right: 20,
                              ),
                              child: const Text(
                                "Xếp hạng: ",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            //Expanded(child: Container()),
                            // CheckboxExample(),
                            Container(
                              height: 40,
                              width: 180,
                              margin: const EdgeInsets.only(
                                left: 30,
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Đánh giá xếp hạng',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  items: controller.items
                                      .map((String item) =>
                                          DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  value: controller.selectedValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      controller.selectedValue = value;
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 40,
                                    width: 180,
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      color: Colors.redAccent,
                                    ),
                                    elevation: 2,
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                    ),
                                    iconSize: 15,
                                    iconEnabledColor: Colors.yellow,
                                    iconDisabledColor: Colors.grey,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.redAccent,
                                    ),
                                    offset: const Offset(-20, 0),
                                    scrollbarTheme: ScrollbarThemeData(
                                      radius: const Radius.circular(40),
                                      thickness:
                                          MaterialStateProperty.all<double>(6),
                                      thumbVisibility:
                                          MaterialStateProperty.all<bool>(true),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                    padding: EdgeInsets.only(
                                      left: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                          left: 20,
                          right: 20,
                          bottom: 35,
                        ),
                        child: TextField(
                          onChanged: (val) => controller.note.value = val,
                          // obscureText: isPasswordTextField ? showPassword : false,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                                // bottom: 1,
                                ),
                            labelText: "Ghi chú:",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "Nhập nhận xét đánh giá",
                            hintStyle: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      //
                      GestureDetector(
                        onTap: () {
                          controller.evaluateBird2();
                          // Get.toNamed(Routes.round);
                          controller.getScoreTypeList();
                          // controller.isWarn = false;
                          // controller.items();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                            // bottom: 10,
                          ),
                          width: screenSize.width * 0.75,
                          height: screenSize.height * 0.05,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xff00CC00),
                              borderRadius: BorderRadius.circular(4)),
                          child: const Text(
                            "Gửi kết quả đánh giá",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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

class _ResultInfor3 extends StatefulWidget {
  const _ResultInfor3({Key? key}) : super(key: key);

  @override
  State<_ResultInfor3> createState() => ResultInfoScreen3();
  // static const String routeName = "/_ResultInfor";
  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }
}

class ResultInfoScreen3 extends State<_ResultInfor3> {
  final String _selectedPoint = 'Đạt';
  // const ResultInfoScreen({Key? key}) : super(key: key);
  final controller = Get.put(RoundResultController());

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
            Get.toNamed(Routes.roundResult);
            // controller.getScoreTypeList();
            // controller.isWarn = false;
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
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            height: screenSize.height * 0.9,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                    left: 15,
                    right: 15,
                  ),
                  height: screenSize.height * 0.7,
                  child: Obx(
                    () {
                      var resultEvaluate = controller.resultScoreType;
                      if (resultEvaluate.isEmpty) {
                        return const Text(
                          "Chưa có thể loại chấm điểm!",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        );
                      } else {
                        return Container(
                          // height: screenSize.height * 0.8,
                          width: screenSize.width * 1,
                          alignment: Alignment.topCenter,
                          child: ListView.builder(
                            addSemanticIndexes: true,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: resultEvaluate.length,
                            itemBuilder: (BuildContext ctv, index) {
                              final result = resultEvaluate[index];
                              return Container(
                                // width: screenSize.width * 0.5,
                                // margin: const EdgeInsets.only(
                                //   left: 10,
                                //   right: 10,
                                // ),
                                child: Column(
                                  children: [
                                    Card(
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            // width: 200,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 8),
                                            decoration: const BoxDecoration(
                                              color: Colors.black12,
                                            ),
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Text(
                                                          result.name
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: HexColor(
                                                                "#FF0000"),
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
                                            itemCount:
                                                result.scoringCriterias!.length,
                                            itemBuilder:
                                                (BuildContext ctv, index) {
                                              final criti = result
                                                  .scoringCriterias![index];
                                              return Container(
                                                alignment: Alignment.center,
                                                // width: _containerWidth,
                                                padding: EdgeInsets.only(
                                                  top: 5,
                                                  bottom: 5,
                                                ),
                                                margin: const EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                        child: Container(
                                                      height: 25,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Text(
                                                        criti.name.toString(),
                                                        style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    )),
                                                    //Expanded(child: Container()),
                                                    // CheckboxExample(),
                                                    // Checkbox(
                                                    //   value: result.isSelected,
                                                    //   // onChanged: (newValue) {
                                                    //   //   // controller.scoreCriteriaList
                                                    //   //   //     .add(criti.id);
                                                    //   //   // print("$value  value");

                                                    //   //   setState(() {
                                                    //   //     // criti.isSelected = newValue!;
                                                    //   //     criti.isSelected =
                                                    //   //         !criti.isSelected;
                                                    //   //   });
                                                    //   //   // addRemoveFavHealth(
                                                    //   //   //     value, condition.id);
                                                    //   // },
                                                    //   activeColor: Colors.red,
                                                    // ),
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
                                    ////
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),

                // Container(
                //   margin: const EdgeInsets.only(
                //     top: 10,
                //   ),
                //   alignment: Alignment.topCenter,
                //   height: screenSize.height * 0.24,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [

                //
                // ],
                // ),
                // ),
                Container(
                    height: 80,
                    margin: const EdgeInsets.only(
                      // top: 15,
                      left: 20,
                      right: 20,
                      bottom: 35,
                    ),
                    child: Obx(() {
                      var note = controller.resultEvaluate;
                      if (note.isEmpty) {
                        return const Text(
                          "Chưa có thể loại chấm điểm!",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        );
                      } else {
                        return Container(
                          // height: screenSize.height * 0.8,
                          width: screenSize.width * 1,
                          // alignment: Alignment.topCenter,
                          child: ListView.builder(
                            addSemanticIndexes: true,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: note.length,
                            itemBuilder: (BuildContext ctv, index) {
                              final result3 = note[index];
                              return Container(
                                // width: screenSize.width * 0.5,
                                // margin: const EdgeInsets.only(
                                //   left: 10,
                                //   right: 10,
                                // ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ghi chú: ",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Expanded(
                                      flex: 0,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Text(
                                          controller.note2.toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
