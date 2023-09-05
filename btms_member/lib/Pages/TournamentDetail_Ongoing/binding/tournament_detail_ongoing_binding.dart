import 'package:btms_member/Pages/TournamentDetail_Ongoing/controller/tournament_detail_ongoing_controller.dart';
import 'package:get/get.dart';

class TournamentDetailOngoingBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<TournamentDetailOngoingController>(
        () => TournamentDetailOngoingController());
  }
}
