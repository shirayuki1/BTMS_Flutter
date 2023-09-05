import 'package:btms_refee/Models/round.dart';
import '../../Common/exception_handling/endpoints.dart';
import 'base_service.dart';

mixin IRoundService {
  // Future<User?> loginWithFirebase(String idToken);
  Future<List<Round>?> getAllRound();
  Future<List<Round>?> getById(int id);
}

class RoundService extends BaseService<Round> with IRoundService {
  @override
  String endpoint() {
    return Endpoints.getAllRound;
  }

  @override
  Round fromJson(Map<String, dynamic> json) {
    return Round.fromJson(json);
  }

  @override
  Future<List<Round>?> getAllRound() {
    return getAllBase2({}, {});
  }

  @override
  Future<List<Round>?> getById(int id) {
    return getAllByIdBase(Endpoints.getAllRound, id, {});
  }

  // @override
  // Future<Round?> getById(int id) {
  //   return getByIdBase2(Endpoints.RoundDetails, id, {});
  // }
}
