import 'package:btms_member/Pages/Tournament_Checkin/controller/tournament_join_controller.dart';
import 'package:get/get.dart';

class TournamentJoinBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<TournamentJoinController>(() => TournamentJoinController());
  }
}
