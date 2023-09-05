import 'package:btms_refee/Models/round_result.dart';
import '../../Common/exception_handling/endpoints.dart';
import 'base_service.dart';

mixin IRoundResultService {
  // Future<User?> loginWithFirebase(String idToken);
  Future<List<RoundResult>?> getAllRoundResult();
  Future<List<RoundResult>?> getById(int id);
}

class RoundResultService extends BaseService<RoundResult>
    with IRoundResultService {
  @override
  String endpoint() {
    return Endpoints.roundResult;
  }

  @override
  RoundResult fromJson(Map<String, dynamic> json) {
    return RoundResult.fromJson(json);
  }

  @override
  Future<List<RoundResult>?> getAllRoundResult() {
    return getAllBase2({}, {});
  }

  @override
  Future<List<RoundResult>?> getById(int id) {
    return getAllByIdBase(Endpoints.roundResult, id, {});
  }

  // @override
  // Future<Round?> getById(int id) {
  //   return getByIdBase2(Endpoints.RoundDetails, id, {});
  // }
}
