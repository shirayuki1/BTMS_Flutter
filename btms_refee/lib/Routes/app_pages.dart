import 'package:btms_refee/Pages/EditProfile/binding/edit_profile_binding.dart';
import 'package:btms_refee/Pages/EditProfile/view/edit_profile_screen.dart';
import 'package:btms_refee/Pages/ForgotPassword/binding/forgotPassBinding.dart';
import 'package:btms_refee/Pages/ForgotPassword/view/forgotPassScreen.dart';
import 'package:btms_refee/Pages/History/binding/history_binding.dart';
import 'package:btms_refee/Pages/History/view/historyScreen.dart';
import 'package:btms_refee/Pages/HistoryDetail/binding/history_detail_binding.dart';
import 'package:btms_refee/Pages/HistoryDetail/view/history_detail_view.dart';
import 'package:btms_refee/Pages/HistoryResultRankingTournament/binding/history_ranking_binding.dart';
import 'package:btms_refee/Pages/HistoryResultRankingTournament/view/history_ranking_screen.dart';
import 'package:btms_refee/Pages/Round/binding/round_binding.dart';
import 'package:btms_refee/Pages/Round/view/round_screen.dart';

import 'package:btms_refee/Pages/RoundResult/binding/round_result_binding.dart';
import 'package:btms_refee/Pages/RoundResult/view/round_result_screen.dart';
import 'package:btms_refee/Pages/HistoryRound/binding/history_round_binding.dart';
import 'package:btms_refee/Pages/HistoryRound/view/history_round_screen.dart';
import 'package:btms_refee/Pages/HistoryRoundResult/binding/round_result_history_binding.dart';
import 'package:btms_refee/Pages/HistoryRoundResult/view/round_result_history_screen.dart';
import 'package:btms_refee/Pages/RoundResultEnd/binding/round_result__end_binding.dart';
import 'package:btms_refee/Pages/RoundResultEnd/view/round_result_end_screen.dart';
import 'package:btms_refee/Pages/Setting/binding/setting_binding.dart';
import 'package:btms_refee/Pages/Setting/view/setting_screen.dart';
import 'package:btms_refee/Pages/TournamentDetail_Incoming/binding/tournament_detail_incoming_binding.dart';
import 'package:btms_refee/Pages/TournamentDetail_Incoming/view/tournament_detail_incoming_view.dart';
import 'package:btms_refee/Pages/TournamentDetail_Ongoing/binding/tournament_detail_ongoing_binding.dart';
import 'package:btms_refee/Pages/TournamentDetail_Ongoing/view/tournament_detail_ongoing_view.dart';
import 'package:btms_refee/Routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Pages/Account/bindding/account_bindding.dart';
import '../Pages/Account/view/account_view.dart';
import '../Pages/Home/binding/home_binding.dart';
import '../Pages/Home/view/homeScreen.dart';
import '../Pages/Login/binding/login_binding.dart';
import '../Pages/Login/view/login_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
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
      name: Routes.editProfile,
      page: () => EditProfileScreen(),
      binding: EditProfileBinding(),
    ),

    //History
    GetPage(
      name: Routes.history,
      page: () => const HistoryScreen(),
      binding: HistoryBinding(),
    ),
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
      page: () => const RoundResultHistoryScreen(),
      binding: RoundResultHistoryBinding(),
    ),
    GetPage(
      name: Routes.historyRanking,
      page: () => const HistoryRankingScreen(),
      binding: HistoryRankingBinding(),
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
      name: Routes.roundResultEnd,
      page: () => const RoundResultEndScreen(),
      binding: RoundResultEndBinding(),
    ),
    //
    // GetPage(
    //   name: Routes.resultInfoBird,
    //   page: () => ResultInfoScreen,
    //   binding: ResultInfoBinding(),
    // ),
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
