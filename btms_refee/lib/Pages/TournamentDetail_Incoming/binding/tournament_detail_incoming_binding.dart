import 'package:btms_refee/Pages/TournamentDetail_Incoming/controller/tournament_detail_incoming_controller.dart';
import 'package:get/get.dart';

class TournamentDetailIncomingBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<TournamentDetailIncomingController>(
        () => TournamentDetailIncomingController());
  }
}
