// import 'package:btms/Data/api_helper.dart';
// import 'package:btms/Pages/SignUp/controller/signUpController.dart';
// import 'package:btms/Services/api/bird_service.dart';
// import 'package:btms/Services/api/history_tournament_service.dart';
// import 'package:btms/Services/api/images_bird_service.dart';
// import 'package:btms/Services/api/incoming_tournament_service.dart';
// import 'package:btms/Services/api/ongoing_tournament_service.dart';
// import 'package:btms/Services/api/user_service.dart';
// import 'package:btms/Widgets/custom_bottom_bar.dart';
import 'package:btms_member/Data/api_helper.dart';
import 'package:btms_member/Pages/BirdInformation/controller/bird_information_controller.dart';
import 'package:btms_member/Pages/BirdList/controller/bird_controller.dart';
import 'package:btms_member/Pages/SignUp/controller/signUpController.dart';
import 'package:btms_member/Services/api/bird_achievement_service.dart';
import 'package:btms_member/Services/api/bird_service.dart';
import 'package:btms_member/Services/api/history_tournament_service.dart';
import 'package:btms_member/Services/api/images_bird_service.dart';
import 'package:btms_member/Services/api/incoming_tournament_service.dart';
import 'package:btms_member/Services/api/join_tournament_service.dart';
import 'package:btms_member/Services/api/list_bird_register_service.dart';
import 'package:btms_member/Services/api/ongoing_tournament_service.dart';
import 'package:btms_member/Services/api/prizes_service.dart';
import 'package:btms_member/Services/api/register_tournament_service.dart';
import 'package:btms_member/Services/api/round_result_service.dart';
import 'package:btms_member/Services/api/round_service.dart';
import 'package:btms_member/Services/api/score_criteria_service.dart';
import 'package:btms_member/Services/api/score_type_service.dart';
import 'package:btms_member/Services/api/tournament_detail_service.dart';
import 'package:btms_member/Services/api/user_service.dart';
import 'package:btms_member/Services/api/videos_bird_service.dart';
import 'package:btms_member/Widgets/custom_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Pages/ChooseBird/controller/choose_bird_controller.dart';
import '../../Services/GlobalStates/share_states.dart';

class AppInit {
  static void init() {
    initMobileAppServices();
    initApiServices();
  }

  /// Init mobile app services
  static void initMobileAppServices() {
    // Get image from file system
    // Get.lazyPut<ImagePicker>(() => ImagePicker(), fenix: true);
    // Shared states between widget
    Get.lazyPut<SharedStates>(() => SharedStates(), fenix: true);
    // Bottom bar
    Get.lazyPut<CustomBottombarController>(
      () => CustomBottombarController(),
      fenix: true,
    );
  }

  // Init api services
  static void initApiServices() {
    // Use for calling api
    Get.lazyPut<IApiHelper>(() => ApiHelper(), fenix: true);
    // Calling api at account service
    Get.lazyPut<IUserService>(() => UserService(), fenix: true);
    Get.lazyPut<IIncomingTournamentService>(() => IncomingTournamentService(),
        fenix: true);

    Get.lazyPut<IOngoingTournamentService>(() => OngoingTournamentService(),
        fenix: true);

    Get.lazyPut<IHistoryTournamentService>(() => HistoryTournamentService(),
        fenix: true);

    Get.lazyPut<IJoinTournamentService>(() => JoinTournamentService(),
        fenix: true);

    Get.lazyPut<IBirdService>(() => BirdService(), fenix: true);

    Get.lazyPut<IImagesService>(() => ImagesService(), fenix: true);
    Get.lazyPut<IVideosService>(() => VideosService(), fenix: true);
    Get.lazyPut(() => ImagePicker());
    Get.lazyPut(() => SignUpController());

    Get.lazyPut<ITournamentDetailService>(() => TournamentDetailService(),
        fenix: true);

    Get.lazyPut<IRegisterTournamentService>(() => RegisterTournamentService(),
        fenix: true);

    Get.lazyPut(() => RegisterTournamentService());

    Get.lazyPut<IRoundService>(() => RoundService(), fenix: true);

    Get.lazyPut<IRoundResultService>(() => RoundResultService(), fenix: true);

    Get.lazyPut<IBirdRegisterService>(() => BirdRegisterService(), fenix: true);

    Get.lazyPut(() => ChooseBirdController());
    Get.lazyPut(() => BirdController());

    Get.lazyPut(() => BirdInformationController());

    Get.lazyPut<IScoreCriteriaService>(() => ScoreCriteriaService(),
        fenix: true);

    Get.lazyPut<IPrizesService>(() => PrizesService(), fenix: true);

    Get.lazyPut<IScoreTypeService>(() => ScoreTypeService(), fenix: true);

    Get.lazyPut<IBirdAchievementService>(() => BirdAchievementService(),
        fenix: true);
    // Get.lazyPut(() => RoundService());
    // Calling api at edge service
    // Get.lazyPut<IEdgeService>(() => EdgeService(), fenix: true);
    // // Calling api at location service
    // Get.lazyPut<ILocationService>(() => LocationService(), fenix: true);
    // // Calling api at store service
    // Get.lazyPut<IStoreService>(() => StoreService(), fenix: true);
    // // Calling api at product service
    // Get.lazyPut<IProductService>(() => ProductService(), fenix: true);
    // // Calling api at coupon service
    // Get.lazyPut<ICouponService>(() => CouponService(), fenix: true);
    // // Calling api at FloorPlan service
    // Get.lazyPut<IFloorPlanService>(() => FloorPlanService(), fenix: true);
    // // Calling api at couponInUse service
    // Get.lazyPut<ICouponInUseService>(() => CouponInUseService(), fenix: true);
    // // Calling api at ProductCategory service
    // Get.lazyPut<IProductCategoryService>(() => ProductCategoryService(),
    //     fenix: true);
    // // Calling api at Building service
    // Get.lazyPut<IBuildingService>(() => BuildingService(), fenix: true);
    // // Calling api at ShoppingList service
    // Get.lazyPut<IShoppingListService>(() => ShoppingListService(), fenix: true);
    // // Calling api at ShoppingItem service
    // Get.lazyPut<IShoppingItemService>(() => ShoppingItemService(), fenix: true);
  }
}
