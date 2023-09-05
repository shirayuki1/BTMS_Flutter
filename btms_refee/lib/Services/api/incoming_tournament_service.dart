import 'package:btms_refee/Common/exception_handling/endpoints.dart';
import 'package:btms_refee/Models/tournament.dart';
import 'base_service.dart';

mixin IIncomingTournamentService {
  // Future<User?> loginWithFirebase(String idToken);
  Future<List<Tournament>?> getAllIncomingTournament();
  // Future<TournamentDetails?> getById(int id);
}

class IncomingTournamentService extends BaseService<Tournament>
    with IIncomingTournamentService {
  @override
  String endpoint() {
    return Endpoints.InComingtournamentList;
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
  Future<List<Tournament>?> getAllIncomingTournament() {
    return getAllBase2({}, {});
  }

  // @override
  // Future<bool> updateProfile(
  //     int id, Map<String, String> data, String filePath) {
  //   return putWithOneFileBase(data, filePath, id);
  //}
}
