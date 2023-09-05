import 'package:get/get.dart';

class RadioButtonController extends GetxController {
  String statusType = 'Đạt';
  String statusType1 = 'Đạt';
  String statusType2 = 'Đạt';
  String get _statusType => statusType;
  String get _statusType1 => statusType1;
  String get _statusType2 => statusType2;
  void setStatusType(String status) {
    statusType = status;
    update();
  }

  void setStatusType1(String status) {
    statusType1 = status;
    update();
  }

  void setStatusType2(String status) {
    statusType2 = status;
    update();
  }
}
