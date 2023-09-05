import 'package:btms_refee/Common/exception_handling/endpoints.dart';
import 'package:btms_refee/Models/tournament.dart';

import 'base_service.dart';

mixin IHistoryTournamentService {
  // Future<User?> loginWithFirebase(String idToken);
  Future<List<Tournament>?> getAllHistoryTournament();
  // Future<User?> getById(int id);
  // Future<bool> updateProfile(int id, Map<String, String> data, String filePath);
}

class HistoryTournamentService extends BaseService<Tournament>
    with IHistoryTournamentService {
  @override
  String endpoint() {
    return Endpoints.historytournamentList;
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
  Future<List<Tournament>?> getAllHistoryTournament() {
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
