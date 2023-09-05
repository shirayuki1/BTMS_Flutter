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
      '$apiVer/Tournament/IncomingTournaments';

  //Incoming Tournament list
  static const OnGoingtournamentList = '$apiVer/Tournament/OngoingTournaments';

  //Bird List
  static const BirdList = '$apiVer/Bird/CurrentMemberBirds';
  static const tmp = '?expand=Bird';

  //Bird list choose regester
  static const chooseList =
      '$apiVer/Bird/CurrentMemberBirdsForRegisterTournament/';

  //Bird Detail
  static const BirdDetail = '$apiVer/Bird/Id/';

  //Bird crud
  static const bird = '$apiVer/Bird?birdId=';

  //Bird create
  static const birdCreate = '$apiVer/Bird';

  //Bird Delete
  static const birdDelete = '$apiVer/Bird/DeleteBird?birdId=';

  //Bird Image
  // static const ImageBird = '$apiVer/BirdImages/Images/BirdId/';
  static const ImageBird = '$apiVer/BirdImages/ODataBirdId?id=';
  //Videos
  static const VideoBird = '$apiVer/BirdVideos/ODataVideoId?id=';

  static const imageCreate = '$apiVer/BirdImages';

  //tournament detail
  static const detailTournament = '$apiVer/Tournament/GetTournamentById/';

  //create a register form
  static const registerForm = '$apiVer/Tournament/Register';

  //All Register History
  static const historyRegister = '$apiVer/RegisterForm/AllRegisterHistory/';

  //Get Round Tournament
  static const getAllRound = '$apiVer/Round/GetTournamentRound?tournamentId=';

  //Get Round Tournament Result
  static const roundResult =
      '$apiVer/RoundResult/ListRoundResult?expand=Bird&roundId=';

  //History Tournament List
  static const HistorytournamentList = '$apiVer/Tournament/FinishedTournaments';

  //History Ranking Bird Tournamnet
  static const historyRanking =
      '$apiVer/BirdAchievement/GetByTournamentId?expand=Bird&tournamentId=';

  // //Checkin - Bird
  // static const registerHistory =
  //     '$apiVer/RegisterForm/AllRegisterHistory?tournamentId=';

  //Register Tournament List
  static const RegistertournamentList =
      '$apiVer/Tournament/RegisteredTournaments';

  //list score type
  static const listScoreType =
      '$apiVer/ScoringCriteriaType/ScoringCriteriaTypes';

  //list score criteria
  static const listScoreCriteria = '$apiVer/ScoringCriteria/ScoringCriterias';

  //Get Prizes on Tournament
  static const prizes = '$apiVer/Prize/Prizes?tournamentId=';
}
