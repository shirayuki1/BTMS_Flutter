import 'package:btms_refee/Models/tournament_detail.dart';
import '../../Common/exception_handling/endpoints.dart';
import 'base_service.dart';

mixin ITournamentDetailService {
  // Future<User?> loginWithFirebase(String idToken);
  Future<TournamentDetails?> getById(int id);
}

class TournamentDetailService extends BaseService<TournamentDetails>
    with ITournamentDetailService {
  @override
  String endpoint() {
    return Endpoints.detailTournament;
  }

  @override
  TournamentDetails fromJson(Map<String, dynamic> json) {
    return TournamentDetails.fromJson(json);
  }

  @override
  Future<TournamentDetails?> getById(int id) {
    return getByIdBase2(Endpoints.detailTournament, id, {});
  }
}
