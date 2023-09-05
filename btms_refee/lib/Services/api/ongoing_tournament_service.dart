import 'package:btms_refee/Common/exception_handling/endpoints.dart';
import 'package:btms_refee/Models/tournament.dart';
import 'base_service.dart';

mixin IOngoingTournamentService {
  // Future<User?> loginWithFirebase(String idToken);
  Future<List<Tournament>?> getAllOngoingTournament();
  Future<Tournament?> getById(int id);
  // Future<bool> updateProfile(int id, Map<String, String> data, String filePath);
}

class OngoingTournamentService extends BaseService<Tournament>
    with IOngoingTournamentService {
  @override
  String endpoint() {
    return Endpoints.OnGoingtournamentList;
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
  Future<List<Tournament>?> getAllOngoingTournament() {
    return getAllBase2({}, {});
  }

  @override
  Future<Tournament?> getById(int id) {
    return getByIdBase2(Endpoints.detailTournament, id, {});
  }

  // @override
  // Future<bool> updateProfile(
  //     int id, Map<String, String> data, String filePath) {
  //   return putWithOneFileBase(data, filePath, id);
  //}
}
