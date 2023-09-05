import 'package:btms_member/Constants/Color/hexa_color.dart';
import 'package:btms_member/Models/round.dart';
import 'package:btms_member/Pages/RoundResult/controller/round_result_controller.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:btms_member/Services/GlobalStates/share_states.dart';
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
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) {
                                  //       // do something
                                  //       return const _ResultInfor3();
                                  //     },
                                  //   ),
                                  // );
                                  // controller
                                  //     .getResultEvaluate(round.roundResult_Id);
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
                                  // SharedStates t = Get.find();
                                  // if (t.isEva == false) {
                                  //   Navigator.push(context,
                                  //       MaterialPageRoute(builder: (context) {
                                  //     // do something
                                  //     return const _ResultInfor();
                                  //   }));
                                  // } else {
                                  //   Navigator.push(context,
                                  //       MaterialPageRoute(builder: (context) {
                                  //     // do something
                                  //     return const _ResultInfor2();
                                  //   }));
                                  // }
                                  // controller
                                  //     .getRoundResultId(round.roundResult_Id);
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
    );
  }
}
