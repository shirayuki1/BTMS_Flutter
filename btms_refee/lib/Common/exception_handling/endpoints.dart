class Endpoints {
  static const String apiVer = "api";
  static const todos = "todos";

  //Login with username api
  static const accounts = '$apiVer/Account/Login';

  //Register user api
  static const registerAccount = '$apiVer/Account/Register';

  //Update profile
  static const updateProfile = '$apiVer/Account/UpdateUser';

  //Incoming Tournament list
  static const InComingtournamentList =
      '$apiVer/Tournament/IncomingTournamentsForReferee';

  //Incoming Tournament list
  static const OnGoingtournamentList =
      '$apiVer/Tournament/OngoingTournamentsForReferee';

  //History Tournament List
  static const historytournamentList = '$apiVer/Tournament/FinishedTournaments';

  //Bird List
  static const BirdList = '$apiVer/Bird/CurrentMemberBirds';

  //Bird Detail
  static const BirdDetail = '$apiVer/Bird/Id/';

  //Bird crud
  static const bird = '$apiVer/Bird?birdId=';

  //Bird create
  static const birdCreate = '$apiVer/Bird';

  //Bird Image
  static const ImageBird = '$apiVer/BirdImages/Images/BirdId';

  //tournament detail
  static const detailTournament = '$apiVer/Tournament/GetTournamentById/';

  //create a register form
  static const registerForm = '$apiVer/Tournament/Register';

  //All Register History
  static const historyRegister =
      '$apiVer/RegisterForm/AllRegisterHistory?tournamentId=';

  static const historyRanking =
      '$apiVer/BirdAchievement/GetByTournamentId?expand=Bird&tournamentId=';

  //Get Round Tournament
  static const getAllRound = '$apiVer/Round/GetTournamentRound?tournamentId=';

  //Get Round Tournament Result
  static const roundResult =
      '$apiVer/RoundResult/ListRoundResult?expand=Bird&roundId=';

//  static const roundResult =
//       '$apiVer/RoundResult/ListRoundResult?roundId=&Bird&orderby=candidateNumber';

  // //Checkin - Bird
  // static const registerHistory =
  //     '$apiVer/RegisterForm/AllRegisterHistory?tournamentId=';

  //Register Tournament List
  static const registertournamentList =
      '$apiVer/Tournament/RegisteredTournaments';

  //list score type
  static const listScoreType =
      '$apiVer/ScoringCriteriaType/ScoringCriteriaOfRound?roundId=';

  //Evaluate Bird
  static const evaluateBird = '$apiVer/Bird/Evaluate';

  static const evaluateBirdLast = '$apiVer/Bird/EvaluateLastRound';

  // //list score criteria
  // static const listScoreCriteria = '$apiVer/ScoringCriteria/ScoringCriterias';

  //Get Prizes on Tournament
  static const prizes = '$apiVer/Prize/Prizes?tournamentId=';
  // View evaluate
  static const resultEvaluate =
      '$apiVer/RoundResultDetail/ResultEvaluateBirdOfCurrentReferee?expand=ScoringCriteriaTypes&roundResultId=';
}
