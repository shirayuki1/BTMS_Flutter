// import 'package:btms/Common/exception_handling/endpoints.dart';
// import 'package:btms/Models/tournament.dart';
import 'package:btms_member/Common/exception_handling/endpoints.dart';
import 'package:btms_member/Models/tournament.dart';

import 'base_service.dart';

mixin IJoinTournamentService {
  // Future<User?> loginWithFirebase(String idToken);
  Future<List<Tournament>?> getAllJoinTournament();
  // Future<User?> getById(int id);
  // Future<bool> updateProfile(int id, Map<String, String> data, String filePath);
}

class JoinTournamentService extends BaseService<Tournament>
    with IJoinTournamentService {
  @override
  String endpoint() {
    return Endpoints.RegistertournamentList;
  }

  @override
  Tournament fromJson(Map<String, dynamic> json) {
    return Tournament.fromJson(json);
  }

  // @override
  // Future<User?> loginWithFirebase(String idToken) async {
  //   return postNoAuth(Endpoints.loginFirebase, {"idToken": idToken});
  // }

  @override
  Future<List<Tournament>?> getAllJoinTournament() {
    return getAllBase2({}, {});
  }

  // @override
  // Future<User?> getById(int id) {
  //   return getByIdBase(id);
  // }

  // @override
  // Future<bool> updateProfile(
  //     int id, Map<String, String> data, String filePath) {
  //   return putWithOneFileBase(data, filePath, id);
  //}
}
