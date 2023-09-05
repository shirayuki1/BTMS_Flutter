import 'package:btms_refee/Constants/Color/hexa_color.dart';

import 'package:btms_refee/Pages/RoundResult/controller/round_result_controller.dart';
import 'package:btms_refee/Pages/RoundResultEnd/controller/round_result_end_controller.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:btms_refee/Services/GlobalStates/share_states.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundResultEndScreen extends GetView<RoundResultEndController> {
  const RoundResultEndScreen({super.key});

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
          'Đánh giá chim thi đấu',
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
                                      .getRoundResultId(round.roundResult_Id);
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
                                            width: 70,
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
                                            width: 70,
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
    );
  }
}

/////////////////////
/////////////////////

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
                // Container(
                //   margin: const EdgeInsets.only(
                //     top: 10,
                //   ),
                //   alignment: Alignment.topCenter,
                //   height: screenSize.height * 0.24,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                Container(
                  margin: const EdgeInsets.only(
                    // top: 15,
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
                // ],
                // ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
