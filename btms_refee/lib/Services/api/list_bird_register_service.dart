import 'package:btms_refee/Common/exception_handling/endpoints.dart';
import 'package:btms_refee/Models/register_history.dart';
import 'base_service.dart';

mixin IBirdRegisterService {
  Future<List<register_history>?> getAllBirdRegister();
  Future<List<register_history>?> getById(int id);

  // //choose page
  // Future<bool> createBird1(Map<String, dynamic> bird);
  // Future<List<Bird>?> getAllBird1();
}

class BirdRegisterService extends BaseService<register_history>
    with IBirdRegisterService {
  @override
  String endpoint() {
    return Endpoints.historyRegister;
  }

  // String endpoint2() {
  //   return Endpoints.bird;
  // }

  @override
  register_history fromJson(Map<String, dynamic> json) {
    return register_history.fromJson(json);
  }

  @override
  Future<List<register_history>?> getAllBirdRegister() {
    return getAllBase2({}, {});
  }

  @override
  Future<List<register_history>?> getById(int id) {
    return getAllByIdBase(Endpoints.historyRegister, id, {});
  }
}
