import 'package:btms_member/Pages/BirdInformation/binding/bird_information_binding.dart';
import 'package:btms_member/Pages/BirdInformation/view/bird_information_screen.dart';
import 'package:btms_member/Pages/BirdInformationCheckin/binding/bird_information_checkin_binding.dart';
import 'package:btms_member/Pages/BirdInformationCheckin/view/bird_information_screen.dart';
import 'package:btms_member/Pages/BirdList/binding/bird_binding.dart';
import 'package:btms_member/Pages/BirdList/view/bird_screen.dart';
import 'package:btms_member/Pages/Cart/binding/cart_binding.dart';
import 'package:btms_member/Pages/Cart/view/cart_view.dart';
import 'package:btms_member/Pages/Checkin_Bird_List/bindding/checkin_binding.dart';
import 'package:btms_member/Pages/Checkin_Bird_List/view/checkin_view.dart';
import 'package:btms_member/Pages/ChooseBird/binding/choose_bird_binding.dart';
import 'package:btms_member/Pages/ChooseBird/view/choose_bird_screen.dart';
import 'package:btms_member/Pages/CreateBird/binding/create_bird_binding.dart';
import 'package:btms_member/Pages/CreateBird/view/create_bird_view.dart';
import 'package:btms_member/Pages/CreateBird_Tournament/binding/create_bird_1_binding.dart';
import 'package:btms_member/Pages/CreateBird_Tournament/view/create_bird_1_view.dart';
import 'package:btms_member/Pages/EditProfile/binding/edit_profile_binding.dart';
import 'package:btms_member/Pages/EditProfile/view/edit_profile_screen.dart';
import 'package:btms_member/Pages/ForgotPassword/binding/forgotPassBinding.dart';
import 'package:btms_member/Pages/ForgotPassword/view/forgotPassScreen.dart';
import 'package:btms_member/Pages/History/binding/history_binding.dart';
import 'package:btms_member/Pages/History/view/historyScreen.dart';
import 'package:btms_member/Pages/HistoryDetail/binding/history_detail_binding.dart';
import 'package:btms_member/Pages/HistoryDetail/view/history_detail_view.dart';
import 'package:btms_member/Pages/HistoryResultRankingTournament/binding/history_ranking_binding.dart';
import 'package:btms_member/Pages/HistoryResultRankingTournament/view/history_ranking_screen.dart';
import 'package:btms_member/Pages/HistoryRound/binding/round_binding.dart';
import 'package:btms_member/Pages/HistoryRound/view/round_screen.dart';
import 'package:btms_member/Pages/HistoryRoundResult/view/round_result_screen.dart';
import 'package:btms_member/Pages/Round/binding/round_binding.dart';
import 'package:btms_member/Pages/Round/view/round_screen.dart';
import 'package:btms_member/Pages/RoundResult/binding/round_result_binding.dart';
import 'package:btms_member/Pages/RoundResult/view/round_result_screen.dart';
import 'package:btms_member/Pages/Setting/binding/setting_binding.dart';
import 'package:btms_member/Pages/Setting/view/setting_screen.dart';
import 'package:btms_member/Pages/TournamentDetail_Incoming/binding/tournament_detail_incoming_binding.dart';
import 'package:btms_member/Pages/TournamentDetail_Incoming/view/tournament_detail_incoming_view.dart';
import 'package:btms_member/Pages/TournamentDetail_Ongoing/binding/tournament_detail_ongoing_binding.dart';
import 'package:btms_member/Pages/TournamentDetail_Ongoing/view/tournament_detail_ongoing_view.dart';
import 'package:btms_member/Pages/UpdateBird/binding/update_bird_binding.dart';
import 'package:btms_member/Pages/UpdateBird/view/update_bird_view.dart';
import 'package:btms_member/Routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Pages/Account/bindding/account_bindding.dart';
import '../Pages/Account/view/account_view.dart';
import '../Pages/HistoryRoundResult/binding/history_round_result_binding.dart';
import '../Pages/Home/binding/home_binding.dart';
import '../Pages/Home/view/homeScreen.dart';
import '../Pages/Login/binding/login_binding.dart';
import '../Pages/Login/view/login_page.dart';
import '../Pages/SignUp/binding/signUp_binding.dart';
import '../Pages/SignUp/view/signUpScreen.dart';
import '../Pages/Tournament_Checkin/bindding/tournament_bindding.dart';
import '../Pages/Tournament_Checkin/view/tournament_join_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.account,
      page: () => const AccountScreen(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: Routes.forgotPass,
      page: () => ForgotPasswordScreen(),
      binding: ForgotPassBinding(),
    ),
    GetPage(
      name: Routes.setting,
      page: () => const SettingScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: Routes.listBird,
      page: () => BirdScreen(),
      binding: BirdBinding(),
    ),
    GetPage(
      name: Routes.birdInfo,
      page: () => BirdInformationScreen(),
      binding: BirdInformationBinding(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => EditProfileScreen(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: Routes.createBird,
      page: () => CreateBirdScreen(),
      binding: CreateBirdBinding(),
    ),
    GetPage(
      name: Routes.createBird_1,
      page: () => CreateBird1Screen(),
      binding: CreateBird1Binding(),
    ),
    GetPage(
      name: Routes.updateBird,
      page: () => UpdateBirdScreen(),
      binding: UpdateBirdBinding(),
    ),
    GetPage(
      name: Routes.history,
      page: () => const HistoryScreen(),
      binding: HistoryBinding(),
    ),
    //History Details
    GetPage(
      name: Routes.historyDetail,
      page: () => const HistoryDetailsScreen(),
      binding: HistoryDetailsBinding(),
    ),
    GetPage(
      name: Routes.roundHistory,
      page: () => const RoundHistoryScreen(),
      binding: RoundHistoryBinding(),
    ),
    GetPage(
      name: Routes.roundResultHistory,
      page: () => const HistoryRoundResultScreen(),
      binding: HistoryRoundResultBinding(),
    ),
    GetPage(
      name: Routes.historyRanking,
      page: () => const HistoryRankingScreen(),
      binding: HistoryRankingBinding(),
    ),
    //
    GetPage(
      name: Routes.chooseBird,
      page: () => const ChooseBirdScreen(),
      binding: ChooseBirdBinding(),
    ),
    GetPage(
      name: Routes.cartBird,
      page: () => const CartScreen(),
      binding: CartBinding(),
    ),

    // ROUND
    GetPage(
      name: Routes.round,
      page: () => const RoundScreen(),
      binding: RoundBinding(),
    ),
    GetPage(
      name: Routes.roundResult,
      page: () => const RoundResultScreen(),
      binding: RoundResultBinding(),
    ),

    GetPage(
      name: Routes.checkinList,
      page: () => const CheckinScreen(),
      binding: CheckinBinding(),
    ),
    GetPage(
      name: Routes.checkinBird,
      page: () => BirdInformationCheckinScreen(),
      binding: BirdInformationCheckinBinding(),
    ),
    GetPage(
      name: Routes.tournamentJoinScreen,
      page: () => const TournamentJoinScreen(),
      binding: TournamentJoinBinding(),
    ),
    GetPage(
      name: Routes.comingTourDetail,
      page: () => const TournamentDetailIncomingScreen(),
      binding: TournamentDetailIncomingBinding(),
    ),
    GetPage(
      name: Routes.goingTourDetail,
      page: () => const TournamentDetailOngoingScreen(),
      binding: TournamentDetailOngoingBinding(),
    ),
  ];
}
