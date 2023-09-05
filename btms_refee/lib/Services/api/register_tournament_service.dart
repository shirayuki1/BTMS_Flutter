// import 'package:btms/Common/exception_handling/endpoints.dart';
// import 'package:btms/Models/bird.dart';
import 'package:btms_refee/Common/exception_handling/endpoints.dart';
import '../../Models/bird.dart';
import 'base_service.dart';

mixin IRegisterTournamentService {
  Future<bool> register(Map<String, dynamic> data);
}

class RegisterTournamentService extends BaseService<Bird>
    with IRegisterTournamentService {
  @override
  String endpoint() {
    return Endpoints.registerForm;
  }

  @override
  Bird fromJson(Map<String, dynamic> json) {
    return Bird.fromJson(json);
  }

  @override
  Future<bool> register(Map<String, dynamic> data) {
    return postBase(Endpoints.registerForm, data, {});
  }
}
