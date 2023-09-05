import 'package:btms_member/Models/prizes.dart';
import '../../Common/exception_handling/endpoints.dart';
import 'base_service.dart';

mixin IPrizesService {
  // Future<User?> loginWithFirebase(String idToken);
  Future<List<Prizes>?> getAllPrizes();
  Future<List<Prizes>?> getById(int id);
}

class PrizesService extends BaseService<Prizes> with IPrizesService {
  @override
  String endpoint() {
    return Endpoints.prizes;
  }

  @override
  Prizes fromJson(Map<String, dynamic> json) {
    return Prizes.fromJson(json);
  }

  @override
  Future<List<Prizes>?> getAllPrizes() {
    return getAllBase2({}, {});
  }

  @override
  Future<List<Prizes>?> getById(int id) {
    return getAllByIdBase(Endpoints.prizes, id, {});
  }

  // @override
  // Future<Round?> getById(int id) {
  //   return getByIdBase2(Endpoints.RoundDetails, id, {});
  // }
}
